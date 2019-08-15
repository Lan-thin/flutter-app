import 'package:flutter/material.dart';
import 'package:yudada_pondmanager_demo_dart/views/homePage.dart';
import 'package:yudada_pondmanager_demo_dart/views/userPage.dart';
import 'package:yudada_pondmanager_demo_dart/common/color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'appConfig.dart';
import './utils/localStorage.dart';
import 'package:flutter_redux/flutter_redux.dart';
import './redux/state.dart';
import './redux/store.dart';

void main(List<String> args) {
  initUserInfo();
  runApp(new Programe());
}
void initUserInfo() async{
  await LocalStorage.save(AppConfig.TOKEN_KEY, "D27FBDA3012F3B433F1A79D8E3738BDCAD2673276ECC15139621C3243E6B8B5A");
}

class Programe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = createStore();
    return StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        home: IndexPage(),
        theme: new ThemeData(
          primaryColor: PMColors.greenColor,
        ),
    )
    // return new MaterialApp(
    //   home: IndexPage(),
    //   theme: new ThemeData(
    //     primaryColor: PMColors.greenColor,
    //   ),
    );
  }
    
}

// class MyApp extends StatefulWidget {
//   @override
//   _MyApp createState() => new _MyApp();
// }

// class _MyApp extends State<MyApp> with SingleTickerProviderStateMixin {
//   TabController tabController;
//   @override
//   void initState() {
//     tabController = new TabController(vsync: this, length: 2);
//   }

//   @override
//   void dispose() {
//     tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: new TabBarView(
//           children: <Widget>[new HomePage(), new UserPage()],
//           controller: tabController),
//       bottomNavigationBar: new Material(
//         color: Colors.white,
//         child: new TabBar(
//           controller: tabController,
//           unselectedLabelColor: Colors.white,
//           tabs: <Tab>[
//             new Tab(text: '我的鱼塘', icon: new Icon(Icons.home)),
//             new Tab(text: '用户设置', icon: new Icon(Icons.message))
//           ],
//         ),
//       ),
//     );
//   }
// }
class IndexPage extends StatefulWidget{
  @override
  _IndexPage createState()=> new _IndexPage();
}
class _IndexPage extends State<IndexPage>{
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      icon: new Icon(Icons.home),
      title: Text('我的鱼塘')
    ),
    BottomNavigationBarItem(
      icon: new Icon (Icons.person),
      title: Text('用户设置')
    )
  ];
  int currentIndex;
  final pages = [HomePage(), UserPage()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          _changeTab(index);
        },
      ),
      body: pages[currentIndex]
    );
  }
  // 切换页面
  void _changeTab(int index){
    if(index != currentIndex){
      setState(() {
        currentIndex = index;
      });
    }
  }
}
