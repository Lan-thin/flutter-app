import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'dart:convert';
import 'package:yudada_pondmanager_demo_dart/common/color.dart';
import 'package:yudada_pondmanager_demo_dart/common/loading.dart';
import 'package:yudada_pondmanager_demo_dart/component/pondItem.dart';
import 'package:yudada_pondmanager_demo_dart/utils/middleware1.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yudada_pondmanager_demo_dart/redux/list/list_export.dart';
import '../redux/redux_export.dart';
class HomePage extends StatefulWidget{
  @override 
  _HomePage createState() => new _HomePage();
}
class _HomePage extends State<HomePage>{
  @override
  buildList(poolInfo){
    print("list");
    print(poolInfo);
    return new ListView.builder(
      itemCount: poolInfo['data'] == null ? 0 : poolInfo['data']['userPoolList'].length,
      itemBuilder: (BuildContext context, int index){
        return new PondItem(pondItem: poolInfo['data']['userPoolList'][index]);
      },
    );
  }
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: PMColors.geryColor,
      appBar: new AppBar(
        title: new Text('我的鱼塘', style: new TextStyle(color: Colors.white)),
      ),
      body: StoreConnector<AppState,ListState>(
        onInit: (store){
          if(!store.state.listState.isInit){
            store.dispatch(fetchList);
          }
        },
        converter: (store){
          return store.state.listState;
        },
        builder: (context, state){
          if(!state.isInit){
            return LoadingModal(
              outsideDismiss: false,


            );
          } else {
            var list = state.poolInfo;
            return buildList(list);
          }
        },

      )
      // new PondList(),
    );
  }
}
// class PondList extends StatefulWidget{
//   @override
//   _PondList createState()=> new _PondList();
// }
// class _PondList extends State<PondList>{
//   var _PondInfo;
  
//   @override
//   void initState(){
//     super.initState();
//     getPondList();
//   }

//   getPondList() async{
//     HttpUtils.request(
//       "pools",
//       data: {},
//       success: (res){
//         setState(() {
//           _PondInfo = res;
//         });
//       }
//     );
//   }
//   Widget build(BuildContext context){
//     // return new SmartRefresher{

//     // }
//     // return new Container();
//     return new ListView.builder(
//       itemCount: _PondInfo == null ? 0 : _PondInfo['data']['userPoolList'].length,
//       itemBuilder: (BuildContext context, int index){
//         return new PondItem(pondItem: _PondInfo['data']['userPoolList'][index]);
//         // return new Card(
//         //   // margin: new EdgeInsets.only(top: 10),
//         //   child: new Container(
//         //     padding: new EdgeInsets.all(10.0),
//         //     child: new ListTile(
//         //       subtitle: new Container(
//         //         child: new Column(
//         //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //           children: <Widget>[
//         //             new Row(
//         //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //               children: <Widget>[
//         //                 new Text(_PondInfo['data']['userPoolList'][index]['name'], style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
//         //               ],
//         //             ),
//         //             new Row(
//         //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //               children: <Widget>[
//         //                 new Row(
//         //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //                   crossAxisAlignment: CrossAxisAlignment.center,
//         //                   children: <Widget>[
//         //                     new Text("时间"),
//         //                     new Text("2012-12-12 12:12"),
//         //                   ],
//         //                 )
//         //               ],
//         //             ),
//         //             new Row(
//         //               children: <Widget>[
//         //                 new Container(
//         //                   padding: new EdgeInsets.fromLTRB(0,8,0,2),
//         //                   child: new Text('内容'),
//         //                 )
//         //               ],)
//         //           ],
//         //         ),
//         //       ),
//         //       trailing: new Icon(Icons.keyboard_arrow_right,color: Colors.grey),
//         //     ),
//         //   ),
//         // );
//       },
//     );
//   }
// }