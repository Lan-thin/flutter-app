import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
void main(List<String> args) {
  
}
class ParentWidget extends StatefulWidget{
  _ParentWidgetState createState() => new _ParentWidgetState();
}
class _ParentWidgetState extends State<ParentWidget>{
  bool _active = false;
  void _handleTapBoxChanaged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }
  @override
  Widget build(BuildContext context){
    return new Container(
      child: new TapBox(
        active: _active,
        onChanged: _handleTapBoxChanaged
      ),
    );
  }
}
class TapBox extends StatelessWidget{
  TapBox({Key key, this.active: false,@required this.onChanged}):super(key: key);
  final bool active;
  final ValueChanged(bool) onChanged;
  void _handleTap(){
    onChanged(!active);
  }
  Widget build(BuildContext context){
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        width: 200,
        height: 200,
        child: new Center(
          child: new Text(
            active? 'Active': 'Inactive',
            style: new TextStyle(fontSize: 32,color:Colors.white)
          ),
        ),
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen : Colors.grey
        ),
          
        ),
    );
  }

}