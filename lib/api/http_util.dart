/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @LastEditors: etongfu
 * @Description: 封装Http utils
 * @youWant: add you want info here
 * @Date: 2019-03-20 10:26:41
 * @LastEditTime: 2019-03-26 13:50:13
 */
import "package:dio/dio.dart";
import 'dart:async';
import 'dart:io';

class ReturnObject {
  final String message;
  final bool success;
  final num code;
  final Map<String, dynamic> result;

  ReturnObject(this.message, this.success, this.code, this.result);
  //序列化参数
  ReturnObject.fromJson(Map<String, dynamic> json):
                        message = json['message'],
                        success = json['success'], 
                        code = json['code'], 
                        result = json['result'];

}

final fixedParam = {};
/// 请求拦截
Options requestInterceptor (RequestOptions options) {
  if (options.method == "GET") {
    options.queryParameters = fixedParam;
  }
  print(options.queryParameters);
  // 在请求被发送之前做一些事情
  return options; //continue
  // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
  // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
  //
  // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
  // 这样请求将被中止并触发异常，上层catchError会被调用。
} 
/// 返回数据拦截
responseInterceptor (Response response) {
  // print(response);
}
/// 当请求失败预处理
errorInterceptor (DioError e) {

}
// 转化函数
class DioTransformer extends DefaultTransformer {
  /// If the request data is a `List` type, the [DefaultTransformer] will send data
  /// by calling its `toString()` method. However, normally the List object is
  /// not expected for request data( mostly need Map ). So we provide a custom
  /// [Transformer] that will throw error when request data is a `List` type.
  @override
  Future<String> transformRequest(RequestOptions options) async {
    if (options.data is List<String>) {
      throw new DioError(message: "Can't send List to sever directly");
    } else {
      return super.transformRequest(options);
    }
  } 
  /// The [Options] doesn't contain the cookie info. we add the cookie
  /// info to [Options.extra], and you can retrieve it in [ResponseInterceptor]
  /// and [Response] with `response.request.extra["cookies"]`.
  @override
  Future transformResponse (RequestOptions options, ResponseBody response) async {
      options.extra["self"] = 'XX';
     return super.transformResponse(options, response);
  }
}
class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  Dio _client;
  // 默认构造函数
  factory HttpUtil() => _instance;

  HttpUtil._internal(){
    if (_client == null) {
      _client = _initDio();
    }
  }
  /// 初始化dio
  Dio _initDio () {
    var _dioInstance = new Dio(
      BaseOptions(
        baseUrl:  "http://172.16.255.196:3001/api/",
        connectTimeout: 5000,
        receiveTimeout: 100000,
        headers: {
          HttpHeaders.userAgentHeader: 'dio',
          "api": "1.0.1",
          "uuid": ""
        },
        contentType: ContentType.json,
        // 返回数据格式
        responseType: ResponseType.json
      )
    );
    // 转化器
    _dioInstance.transformer = DioTransformer();
    // 添加拦截器
    _dioInstance.interceptors
    // 日志打印拦截器
    ..add(LogInterceptor(responseBody: false))
    // 自定义拦截器
    ..add(InterceptorsWrapper(
      onRequest: requestInterceptor,
      onResponse: responseInterceptor,
      onError: errorInterceptor
    ));

    return _dioInstance;
  }
  /// get 请求
  /// @param path 请求地址
  /// @param Map<String, dynamic> params  请求参数
  Future<Map<String, dynamic>> get(String path, [Map<String, dynamic> params]) async {
    Response<Map<String, dynamic>> response;
    if (params !=null) {
      response = await _client.get(path, queryParameters: params);
    } else {
      response = await _client.get(path);
    }
    return response.data;
  }
  /// post 请求
  /// @param path 请求地址
  /// @param Map<String, dynamic> params  请求参数
  Future<ReturnObject> post(String path,  [Map<dynamic, dynamic> data]) async {
    
    Response<Map<dynamic, dynamic>> response;
    if (data != null) {
      response = await _client.post(path,data:data);
    } else {
      response = await _client.post(path);
    }
    var _returnObject = ReturnObject.fromJson(response.data);
    return _returnObject;
  }

}
