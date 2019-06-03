import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shop_app/pages/shopping_cart.dart';
import 'package:shop_app/pages/login_page.dart';
import 'package:shop_app/pages/map_page.dart';
import 'package:shop_app/pages/android_page.dart';
import 'package:shop_app/pages/music_view.dart';



class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _iconColor = Theme.of(context).primaryColor;

    // 跳转页面
    void _jumpPage (Widget widget) {
      Navigator.of(context).pushReplacement(
        CupertinoPageRoute(builder: (context) => widget)
      );
    }

    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('etongfu'),
            accountEmail: Text('13583254085@163.com'),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.grey),
              ),
            ),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          // InkWell 水波纹效果
          InkWell(
            child: ListTile(title: Text('Home Page'), leading: Icon(Icons.home, color: _iconColor,)),
            onTap: () {

            },
          ),
          InkWell(
            child: ListTile(title: Text('Account'), leading: Icon(Icons.person, color: Theme.of(context).primaryColor,)),
            onTap: () {
              
            },
          ),
          InkWell(
            child: ListTile(title: Text('Music'), leading: Icon(Icons.music_video, color: Theme.of(context).primaryColor,)),
            onTap: () {
              _jumpPage(MusicView());
            },
          ),
          InkWell(
            child: ListTile(title: Text('ShoppingCart'), leading: Icon(Icons.shopping_cart, color: Theme.of(context).primaryColor,)),
            onTap: () {
              _jumpPage(ShoppingCart());
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 3, bottom: 3),
            child: Divider(),
          ),
          InkWell(
            child: ListTile(title: Text('Setting'), leading: Icon(Icons.settings, color: Colors.blue,)),
            onTap: () {
              
            },
          ),
          InkWell(
            child: ListTile(title: Text('Question'), leading: Icon(Icons.help, color: Colors.green,)),
            onTap: () {
              
            },
          ),
          InkWell(
            child: ListTile(title: Text('Map'), leading: Icon(Icons.map, color: Theme.of(context).primaryColor,)),
            onTap: () {
                _jumpPage(MapPage());
            },
          ),
          InkWell(
            child: ListTile(title: Text('AndroidView'), leading: Icon(Icons.map, color: Theme.of(context).primaryColor,)),
            onTap: () {
                _jumpPage(AndroidPage());
            },
          ),
          InkWell(
            child: ListTile(title: Text('Logout'), leading: Icon(Icons.power_settings_new, color: Colors.red,)),
            onTap: () async {
              SharedPreferences _shared = await SharedPreferences.getInstance();
              //　清除登陆痕迹
              _shared.setString('userId', null);
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => LoginPage()
              ));
            },
          ),
        ],
      ),
    );
  }
}
