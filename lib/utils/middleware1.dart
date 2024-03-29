import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert';
import '../appConfig.dart';
import 'localStorage.dart';

/*
 * 封装 restful 请求
 * 
 * GET、POST、DELETE、PATCH
 * 主要作用为统一处理相关事务：
 *  - 统一处理请求前缀；
 *  - 统一打印请求信息；
 *  - 统一打印响应信息；
 *  - 统一打印报错信息；
 */
class HttpUtils {

  /// global dio object
  static Dio dio;

  /// default options
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 3000;

  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  /// request method
  static Future<Map> request (
    String url, 
    { data, method, success}) async {

    data = data ?? {};
    method = method ?? 'GET';
    
    data.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });

    // /// 打印请求相关信息：请求地址、请求方式、请求参数
    // print('请求地址：【' + method + '  ' + url + '】');
    // print('请求参数：' + data.toString());

    Dio dio = createInstance();
    var result;

    try {
      Response response = await dio.request(url, data: data, options: new Options(method: method));

      result = response.data;
      // print(result);
      success(result);
      /// 打印响应相关信息
      // print('响应数据：' + response.toString());
    } on DioError catch (e) {
      /// 打印请求失败相关信息
      print('请求出错：' + e.toString());
    } 

    return result;
  }

  /// 创建 dio 实例对象
  static Dio createInstance () {
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      Options options = new Options(
          baseUrl: AppConfig.base_url,
          connectTimeout: CONNECT_TIMEOUT,
          receiveTimeout: RECEIVE_TIMEOUT,
          headers:{
            // "x-access-token": "D27FBDA3012F3B433F1A79D8E3738BDCAD2673276ECC15139621C3243E6B8B5A",
            "version": AppConfig.version
          },
      );

      dio = new Dio(options);
      // 发送的拦截器
      dio.interceptor.request.onSend = (Options options) async{
        String token = await LocalStorage.get(AppConfig.TOKEN_KEY);
        options.headers['x-access-token'] = token;
        return options;
      };
    }

    return dio;
  }

  /// 清空 dio 对象
  static clear () {
    dio = null;
  }

}