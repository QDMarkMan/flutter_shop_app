import 'package:flutter/material.dart';
// 和Android、Ios类似，Flutter也支持Preferences（Shared Preferences and NSUserDefaults） 、文件、和Sqlite3。
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/utils/toast.dart';
import 'home_page.dart';
import 'dart:ui';
import 'package:shop_app/api/user_api.dart';
// import 'package:shop_app/widgets/Loading.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  SharedPreferences preferences;
  bool loading = false;
  String username;
  String password;
  String userId;
  Future<String> _id;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      // 开始loading
      loading = true;
    });

    preferences = await SharedPreferences.getInstance();
    // Future 异步对象
    _id = _getUserId();
    _id.then((String value) {
      print(value);
      userId =value;
      // 已经登陆的情况下
      if (userId != null) {
        // 跳转并替换当前路由
        Navigator.pushReplacement( context, MaterialPageRoute(builder: (context) => HomePage())); }
    });
  }
  /// @param username
  _saveUserInfo (String sessionId) {
    preferences.setString("key", sessionId);
  }
  /// 获取用户信息
  /// 用户信息的判断， 如果是要求用户强制登陆的话那么一定要在main.dart去做判断。这样有比较好的体验
  Future<String> _getUserId () async{
    var _temp;
    _temp = preferences.getString("userId");
    print("获取到的userId$_temp");
    return _temp;
  }
  /// 登陆
  void _login (para) async {
    loginByUserName(para).then((data) {
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
            decoration: BoxDecoration(
              // color: Theme.of(context).primaryColor,
              // 使用背景图
              image: DecorationImage(
                fit: BoxFit.fill,
                image: new Image.asset('images/bg.jpg').image,
              )
            ),
            height: double.infinity, // 高度100%
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    // 加载状态
                    // Loading(),
                    // 图标
                    Padding(
                      padding: EdgeInsets.only(top: 60),
                      child: Image.asset("images/icon.png"),
                    ),
                    // 文字部分
                    Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: <Widget>[
                            Text(
                              '紫色商城',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'shop_app',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                    // 输入框包裹层
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      width: (_screenSize.width - 30),
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            controller: _nameController,
                            autofocus: false,
                            decoration: InputDecoration(
                              labelText: "用户名",
                              prefixIcon: Icon(Icons.person),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: TextField(
                              controller: _passController,
                              decoration: InputDecoration(
                                  labelText: "用户名",
                                  prefixIcon: Icon(Icons.lock)),
                              obscureText: true,
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        var userName =_nameController.text;
                        var password =_passController.text;
                        // 验证
                        if (userName.isEmpty) {
                          return ToastHelp(msg: '请输入用户名').errorToast();
                        }
                        if (password.isEmpty) {
                          return ToastHelp(msg: '请输入密码').errorToast();
                        }
                        // 模拟登陆
                        /* if (userName == '123' && password == '123456') {
                          // 保存登陆用户信息
                          _saveUserInfo(userName, password);
                          // 跳转页面
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => HomePage()
                          ));
                        } else {
                          return ToastHelp(msg: '用户名或密码错误').errorToast();
                        } */
                        Map para = {
                          'username': userName,
                          'password':password
                        };
                        
                        print(para);
                        loginByUserName(para).then((data) {
                          if (data.success) {
                            print(data.result['sessionId']);
                            // 设置sessionid
                             _saveUserInfo(data.result['sessionId']);
                            ToastHelp(msg: "登陆成功").successToast();
                            /* Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => HomePage()
                            )); */
                          } else {
                            return ToastHelp(msg: data.message).errorToast();
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        width: (_screenSize.width - 31),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.white,
                            Colors.deepPurpleAccent[700]
                          ]), // 背景渐变
                          borderRadius: BorderRadius.circular(3), //3圆角
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(2.0, 2.0),
                                blurRadius: 4.0)
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 14,
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w800),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
    );
  }
}
