import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/rendering.dart';
// index 页面
// import './widgets/bottom_nav.dart';
import 'package:shop_app/pages/home_page.dart';
void main() {
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
          primaryColor: Colors.red
        ),
        home: HomePage(),
      ),
    );
  }
}