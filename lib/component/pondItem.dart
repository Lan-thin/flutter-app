import 'package:flutter/material.dart';
import 'package:yudada_pondmanager_demo_dart/common/color.dart';
import 'package:yudada_pondmanager_demo_dart/routers/router.dart';
class PondItem extends StatefulWidget{
  PondItem({Key key, this.pondItem}): super(key:key);
  Map<String,dynamic> pondItem;
  _PondItem createState() => new _PondItem();
}

class _PondItem extends State<PondItem>{
  @override
  String pondText = '';
  String statusText = '';
  int status = 0;
  @override
  void initState(){
    super.initState();
    getText();
  }
  Map<String, dynamic> getText(){
    if(widget.pondItem['warningLevel'] != null){
      statusText = '有异常';
      status = 2;
    } else {
      statusText = widget.pondItem['activitySwitchCount'] != 0 ? '增氧中' : '空闲中';
      status = widget.pondItem['activitySwitchCount'] != 0 ? 1 : 0;
    }
    pondText = widget.pondItem['activitySwitchCount'] != 0 ? "${widget.pondItem['activitySwitchCount']}台增氧机开启中" : '无运行中的增氧机';
    setState(() {
      pondText;
      statusText;
      status;
    });
  }
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        Router.push(context, Router.detail, widget.pondItem['id']);
      },
      child: new Container(
      padding: new EdgeInsets.fromLTRB(15.0,0,15.0,0),
      margin: new EdgeInsets.only(top: 15.0),
      color: PMColors.geryColor,
      
      child: new Container(
        width: 345.0,
        height: 90.0,
        padding: EdgeInsets.fromLTRB(20.0,15.0,20.0,15.0),
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.all(new Radius.circular(10.0))
        ),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Image.asset(widget.pondItem['warningLevel'] == null ? 'assets/images/pool_icon.png' : 'assets/images/pool_icon_warn.png',width: 22,height: 22,),
                  new Container(
                    margin: new EdgeInsets.only(left: 5.0),
                    child: new Text(widget.pondItem['name'], style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                  )
                ],
              ),
              new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    width: 12.0,
                    height: 12.0,
                    margin: EdgeInsets.only(right: 6.0),
                    decoration: new BoxDecoration(
                      color: PMColors.c1Color,
                      borderRadius: new BorderRadius.all(new Radius.circular(6.0))
                    ),
                  ),
                  new Text(statusText, style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 18, color: status == 0 ? PMColors.c1Color : PMColors.redColor))
                ],
              )
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text(widget.pondItem['fishTypeName'], style: new TextStyle(
                color: PMColors.textColor,
                fontSize: 15.0
              )),
              new Text(pondText, style: new TextStyle(
                color: PMColors.textColor,
                fontSize: 15.0
              ),)
            ],
          )
        ],
        ),
      ),
    )
    );
  }
}