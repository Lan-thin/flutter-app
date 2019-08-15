import 'package:flutter/material.dart';
class UserPage extends StatefulWidget{
  @override 
  _UserPage createState() => new _UserPage();
}
class _UserPage extends State<UserPage> with TickerProviderStateMixin{
  AnimationController controller;
  Animation<double> animation;
  // CurvedAnimation curve
  @override
  void initState(){
    super.initState();
    controller = AnimationController(
      duration: const Duration(microseconds: 5000),
      vsync: this 
    );
    // curve = CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    animation.addListener(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('user'),
      ),
      body: new Center(
        child: new RotationTransition(
          turns: animation,
          child: new Image.asset('assets/images/icon_normal.png',width: 50,height: 50),
        )   
        ),
    );
  }
}