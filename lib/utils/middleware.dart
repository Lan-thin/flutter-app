
import 'dart:io';

import 'package:dio/dio.dart';
class HttpUtil{
  static HttpUtil instance;
  static Dio dio;
  Options options;
  
  // requset methods 
  static const String GET = "get";
  static const String POST = "post";
  static const String PUT = "put";
  static const String DELETE = "DELETE";
  // 单例模式
  static HttpUtil getInstance(){
    if(null == instance) {
      instance = new HttpUtil();
      return instance;
    }
  }
  HttpUtil(){
    options = new Options(
      baseUrl:  "https://mp.iot.yudada.com/",
      connectTimeout: 5000,
      receiveTimeout: 5000,
      headers:{
        "x-access-token": "D27FBDA3012F3B433F1A79D8E3738BDCAD2673276ECC15139621C3243E6B8B5A",
        "version": "1.0.0"
      },
      contentType: ContentType.json,
      responseType: ResponseType.JSON,
    );
    Dio dio = new Dio(options);
  }

  static Future<Map> request(
    String url,
    {data, 
    method,
    success}
    ) async {
      data = data ?? {};
      method = method ?? "GET";
      data.forEach((key, value) {
        if (url.indexOf(key) != -1) {
          url = url.replaceAll(':$key', value.toString());
        }
      });
      var res ;
      try {
        Response response = await dio.request(url, data: data, options:  new Options(method: method));
        res = response.data;
        success(res);
      } on DioError catch(e){
        print('请求出错' + e.toString());
      }
    }
}