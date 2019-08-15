import 'package:flutter/material.dart';
import 'package:yudada_pondmanager_demo_dart/common/color.dart';
import 'package:yudada_pondmanager_demo_dart/component/pondItem.dart';
import 'package:yudada_pondmanager_demo_dart/component/switchItem.dart';
class Pond extends StatefulWidget{
  final List switchList;
  Pond({Key key,this.switchList}): super(key: key);
  _Pond createState ()=> new _Pond();
}
class _Pond extends State<Pond>{
  @override
  List <Map<String,dynamic>> swicthAllList = [];
  void initState() {
    // TODO: implement initState
    super.initState();
    for(var i = 0; i < 24; i++){
      swicthAllList.add({
        'index': i
        }   
      );
    }
    // print('widget');
    // print(widget.switchList);
    // renderSwitchList();
  }
  // void renderSwitchList(){
  //   print(widget.switchList);
  //   for(int i = 0; i < widget.switchList.length; i++) {
  //     if(widget.switchList[i]['bindStatus'] == 1){
  //       int index = widget.switchList[i]['xline'] * 6 + widget.switchList[i]['yline'];
  //       swicthAllList[index]['switch'] = widget.switchList[i];
  //     }
  //   }
  // }
  // List<Widget> renderSwitchList(){
  //    list = [];
  //   for(var i = 0; i < 24; i++){
  //     list.add(new SwitchItem);
  //   }
  //   return list;
  // }
  Widget build(BuildContext context){

    void renderSwitchList(){
      // print(widget.switchList[0]);
      // swicthAllList[0]['switch'] = widget.switchList[0];

      for(int i = 0; i < widget.switchList.length; i++) {
        if(widget.switchList[i]['bindStatus'] == 1){
          int index = widget.switchList[i]['xline'] * 6 + widget.switchList[i]['yline'];
          swicthAllList[index]['switch'] = widget.switchList[i];
        }
      }
      
      print(swicthAllList);
    }
    renderSwitchList();
    
    return new Container(
      height: 345.0,
      padding: new EdgeInsets.fromLTRB(12.0, 20.0, 12.0, 10.0),
      color: PMColors.pondColor,
      child: new Wrap(
        spacing: 10,
        runSpacing: 10,
        children: List.generate(24, (index){
          // switchItem: swicthAllList[index]
          return new SwitchItem(switchItem: swicthAllList[index]);
        })
        )
      );
  }
  // // 开关集合列表
  // List <Widget> SwitchListRender = List.generate(24, (index){
  //     print(swicthAllList);
  //     return new SwitchItem();
  // });
}