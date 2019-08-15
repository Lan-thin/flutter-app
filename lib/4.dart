import 'package:flutter/material.dart';
void main() => runApp(
  new MaterialApp(
    title: 'flutter tutirial',
    home: new TutoriaHome(),
  )
);

class TutoriaHome extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: new Text('Example title'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          )
        ],
      ),
      body: new Center(
        child: new Text('hello world'),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'add',
        child: new Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}