import 'package:flutter/material.dart';
class BottomNavigation extends StatefulWidget{
  _BottomNavigation createState()=> new _BottomNavigation();
}
class _BottomNavigation extends State<BottomNavigation>{
  final _BottomNavigationColor = Colors.green;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(
            Icons.home, color: _BottomNavigationColor
            ),
            title: new Text('我的鱼塘', style: new TextStyle(color: _BottomNavigationColor),)
          ), 
          BottomNavigationBarItem(
            icon: new Icon(
            Icons.settings, color: _BottomNavigationColor
            ),
            title: new Text('用户设置', style: new TextStyle(color: _BottomNavigationColor),)
          ),   

        ],
      ),
    );
  }
}