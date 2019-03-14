import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/utils/toast.dart';
import 'home_page.dart';
import 'dart:ui';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  SharedPreferences preferences;
  bool loading = false;
  bool isLogin = false;
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
    // 已经登陆的情况下
    if (isLogin) {
      // 跳转并替换当前路由
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
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
                        if (userName == '123' && password == '123456') {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => HomePage()
                          ));
                        } else {
                          return ToastHelp(msg: '用户名或密码错误').errorToast();
                        }

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
            )));
  }
}
