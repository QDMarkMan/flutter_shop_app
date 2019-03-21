/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @LastEditors: etongfu
 * @Description: make dio as global top-level variable
 * @youWant: add you want info here
 * @Date: 2019-03-19 10:04:21
 * @LastEditTime: 2019-03-21 11:16:13
 */
import 'package:dio/dio.dart';
import 'dart:io';
final fixedParam = {
      "abflag": "0",
      "ac": "wifi",
      "aid": "0",
      "app_name": "tuchong",
      "device_platform": "android",
      "device_type": "MI",
      "dpi": "400",
      "manifest_version_code": "232",
      "openudid": "65143269dafd1f3a5",
      "os_api": "22",
      "os_version": "5.8.1",
      "resolution": "1280*1000",
      "ssmix": "a",
      "uuid": "651384659521356",
      "version_code": "232",
      "version_name": "2.3.2"
    };
/// 请求拦截
Options requestInterceptor (RequestOptions options) {
  if (options.method == "GET") {
    options.queryParameters = fixedParam;
  }
  print("Http request ${options.uri}");
  // print(options.queryParameters);
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

/// 生成dio对象
Dio getDioInstance () {
  var _dioInstance = new Dio(
    BaseOptions(
      baseUrl:  "https://api.tuchong.com/",
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