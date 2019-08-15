import 'package:flutter/material.dart';
import '../views/webViewPage.dart';
import '../views/detail.dart';
class Router{
  static const String detail = 'detail';
  Widget _getPage(String url, dynamic params) {
    if (url.startsWith('https://') || url.startsWith('htts://')) {
      print(params);
      return WebViewPage(url, params: params);
    } else {
      switch(url){
        case detail:
          return DetailPage(params);
      }
    }
    return null;
  }
  Router.pushNoParams(BuildContext context, String url) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, null);
    }));
  }

  Router.push(BuildContext context, String url, dynamic params) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, params);
    }));
  }
}