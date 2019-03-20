import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:io';
// import 'package:flutter/rendering.dart';
// index 页面
// import './widgets/bottom_nav.dart';
import 'package:shop_app/pages/login_page.dart';

void main() async {
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  // debugPaintSizeEnabled = true;      //打开视觉调试开关
  runApp(MyShopApp());
}

class MyShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: 'FlutterShop',
        theme: ThemeData(
          primaryColor: Colors.deepPurpleAccent
        ),
        home: LoginPage(),
      ),
    );
  }
}