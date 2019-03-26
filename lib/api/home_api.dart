/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @LastEditors: etongfu
 * @Description: dio示例
 * @youWant: add you want info here
 * @Date: 2019-03-19 09:50:15
 * @LastEditTime: 2019-03-26 10:18:05
 */
import 'dio_instance.dart';

Future getHomeList () async {
   /* try {
      Response response;
      response = await getDioInstance().get("/feed-app", queryParameters: {
        "type": "refresh",
        "page": "1",
      });
      // List items = json.decode(response.data['feedList']);
      // 通过我们呢手动转为Map结构
      // Map<String, dynamic> data = json.decode(response.data);
      return print(response.data);
    } catch (e) {
      return print(e);
    } */
    return getDioInstance().get("/feed-app", queryParameters: {
      "type": "refresh",
      "page": "1",
    });
}