import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
void main () {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    String title = 'web images';
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new ListView(
          children: <Widget>[
            new Image.asset('assets/images/wait_receive_icon.png'),
            new FadeInImage.memoryNetwork(
              placeholder: kTransparentImage, image: 'https://static.yudada.com/wechat/pond/img/bg_authorization.png'
            ),
          ],
        )
      )
      );
  }
}