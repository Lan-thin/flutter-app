import 'package:flutter/material.dart';
import 'package:yudada_pondmanager_demo_dart/common/color.dart';
import 'package:yudada_pondmanager_demo_dart/component/pond.dart';
import '../utils/middleware1.dart';
class DetailPage extends StatefulWidget{
  final int pondId;
  DetailPage(this.pondId, {Key key}): super(key: key);
  @override 
  _DetailPage createState() => new _DetailPage(pondId);
}
class _DetailPage extends State<DetailPage>{
  @override
  final _pondId;
  Map _pondInfo;
  List <dynamic> _switchList = [];
  _DetailPage(this._pondId);
  void initState() {
    // TODO: implement initState
    super.initState();
    getPondInfo();
  }
  void getPondInfo() async{
    
    HttpUtils.request(
      "pools/${this._pondId}",
      data: {},
      success: (res){
        List switchArr = [];
        // 暂时没找到map forEach的使用方法 报错
        // // print(res['data']['deviceList']);
        // res['data']['deviceList'].forEach((key,value) => {
        //   print(value['switchList']),
        //   switchArr.addAll(value['switchList'])
        // }
        // );
        // print(switchArr);
        // print(res['data']['deviceList']);
        // res['data']['deviceList'].forEach((key,value) => switchArr.addAll(value['switchList']));
        for(int i = 0; i < res['data']['deviceList'].length; i++ ){
          if(res['data']['deviceList'][i]['warningLevel'] == 1){
            print(res['data']['deviceList'][i]);
            // res['data']['deviceList'][i]['switchList']['warningLevel'] = 1;
          }
          
          switchArr.addAll(res['data']['deviceList'][i]['switchList']);
        }
        setState(() {
          _switchList = switchArr;
          _pondInfo = res;
        });
      }
    );
  }
  @override
  Widget build(BuildContext context){
    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('detail'),
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            height: 50,
            color: Colors.white,
            padding: new EdgeInsets.only(left: 20.0,right: 20.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Text('鱼塘增氧机分布图', style: new TextStyle(color: PMColors.textColor, fontSize: 16.0, fontWeight: FontWeight.bold)),
                new Image.asset('assets/images/north.png', width: 38.0, height: 24.0,)
              ],
            ),
          ),
          new Pond(switchList: _switchList),
        ],
      )
    );
  }
}