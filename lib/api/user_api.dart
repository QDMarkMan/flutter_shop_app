import 'http_util.dart';

// 登陆
Future loginByUserName(Map para) async {
  try {
   print("==============开始进行登陆请求==============");
   ReturnObject response =await HttpUtil().post('/user/login', para);
   return response;
  } catch (e) {
    return print("ERROR:======>$e");
  }
}