import 'package:flutter/material.dart';
void main() => runApp(
  new MaterialApp(
    title: 'my app',
    home: new MyScaffold(),
  )
);
// class MyAppBar extends StatelessWidget{
//   MyAppBar({this.title});
//   final Widget title;
//   @override
//   Widget.build(BuildContext context){
//     return new Container(
//       height: 56.0,
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: new BoxDecoration(color: Colors.blue[500]),
//       child: new Row(children: <Widget>[
//         new IconButton(
//           icon: new Icon(Icons.menu),
//           tooltip: 'Navigation menu',
//           // null 会禁止button
//           onPressed: null,
//         ),
//         new Expanded(
//           child: title,
//         ),
//         new IconButton(
//           icon: new Icon(Icons.search),
//           tooltip: 'Search',
//           onPressed: null,
//         ),
//       ],),
//     );
//   }
// }
class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  // Widget子类中的字段往往都会定义为"final"

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      // Row 是水平方向的线性布局（linear layout）
      child: new Row(
        //列表项的类型是 <Widget>
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null 会禁用 button
          ),
          // Expanded expands its child to fill the available space.
          new Expanded(
            child: title,
          ),
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
class MyScaffold extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Material(
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text('example title', style: Theme.of(context).primaryTextTheme.title)
          ),
          new Expanded(
            child: new Center(
              child: new Text('Hello World')
            ),
          )
        ],
      ),
    );
  }
}