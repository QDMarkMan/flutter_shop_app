/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @LastEditors: etongfu
 * @Description: dio示例
 * @youWant: add you want info here
 * @Date: 2019-03-19 09:50:15
 * @LastEditTime: 2019-03-19 13:36:22
 */
import 'package:dio/dio.dart';
import 'dio_instance.dart';

void getListDemo () async {
   try {
      Response response;
      response = await getDioInstance().get("/feed-app", queryParameters: {
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
        "page": "1",
        "resolution": "1280*1000",
        "ssmix": "a",
        "type": "refresh",
        "uuid": "651384659521356",
        "version_code": "232",
        "version_name": "2.3.2"
      });
      return print(response.data);
    } catch (e) {
      return print(e);
    }
}