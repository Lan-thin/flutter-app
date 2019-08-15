import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'dart:math' as Math;
import 'package:yudada_pondmanager_demo_dart/common/color.dart';
class SwitchItem extends StatefulWidget{
  SwitchItem({Key key, this.switchItem}): super(key:key);
  final Map<String,dynamic> switchItem;
  _SwitchItem createState() => new _SwitchItem();
}
class _SwitchItem extends State<SwitchItem> with SingleTickerProviderStateMixin{
  @override
  String path = 'detail';
  // 增氧机icon
  String imageUrl;
  Color  switchColor;
  Animation<double> tween;
  AnimationController controller;
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller = new AnimationController(
    //   duration: const Duration(microseconds: 2000),
    //   vsync: this
    // );
    // tween = new Tween(begin: 0.0, end: Math.pi *2).animate(
    //   CurvedAnimation(curve: Interval(0.1, 0.3, curve: Curves.ease), parent: controller)
    // )..addListener((){
    //   setState(() {
    //     print(tween.value);
    //   });
    // })
    // ..addStatusListener((AnimationStatus status){
    //   print(status);
    // });
    // controller.forward();
  }
  // 渲染增氧机
  void initSwitch() {
    // 只有增氧机信息才渲染增氧机信息
    var switchInfo = widget.switchItem['switch'];
    if(switchInfo['warningLevel'] == null){
      imageUrl = 'assets/images/icon_normal.png';
      switchColor = PMColors.greenColor;
    } else {
      if(switchInfo['warningLevel'] == 1 || switchInfo['warningLevel'] == 1){
        imageUrl = 'assets/images/icon_disable.png';
        switchColor = PMColors.geryColor;
      } else {
        switchColor = PMColors.redColor;
        imageUrl = 'assets/images/icon_err.png';
      }
    }
    setState(() {
      switchColor = switchColor;
      imageUrl = imageUrl;
    });

  }
  Widget build (BuildContext context){
    
    if(widget.switchItem['switch'] == null){
      return new Container(
        width: 50.0,
        height: path == 'detail'? 70.0 : 50.0,
      );
    } else { 
      initSwitch();
      return new GestureDetector(
        onTap: null,
        child: new Container(
          width: 50.0,
          height: path == 'detail'? 70.0 : 50.0,
          decoration: BoxDecoration(
            // color: PMColors.switchColor
          ),
          child: renderDetail()
          ),
      );
    } 
  }
  Widget renderDetail(){
    return new Container(
      width: 50.0,
      height: 70.0,
      decoration: new BoxDecoration(
        color: PMColors.switchColor,
        borderRadius: new BorderRadius.only(topLeft: new Radius.circular(50.0),topRight: new Radius.circular(50.0),bottomLeft: new Radius.circular(10.0),bottomRight: new Radius.circular(10.0))
      ),
      child: new Column(
        children: <Widget>[
          new Stack(
            children: <Widget>[
              new Container(
                width: 50,
                height: 50,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.all(new Radius.circular(50))
                ),
                child: new Image.asset(imageUrl,width: 50,height: 50),
                
              ),
              new Positioned(
                left: 17.0,
                top: 17.0,
                child: new Text(widget.switchItem['switch']['switchName'], style: new TextStyle(color: switchColor, fontSize: 12,fontWeight: FontWeight.bold)),
              ),
              new Positioned(
                bottom: 0,
                right: 0,
                child: new Offstage(
                  offstage: widget.switchItem['switch']['hasTiming'] == null ? true : !widget.switchItem['switch']['hasTiming'],
                  child: new Image.asset('assets/images/timing.png',width: 17,height: 17),
                )
              ),
            ],
          ),
          new Text(widget.switchItem['switch']['currentOverloadRate'].toStringAsFixed(1), style: new TextStyle(color: PMColors.textColor)),
        ],
      ),
    );
  }

}