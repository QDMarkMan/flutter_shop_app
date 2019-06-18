import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shop_app/pages/shopping_cart.dart';
import 'package:shop_app/pages/login_page.dart';
import 'package:shop_app/pages/map_page.dart';
import 'package:shop_app/pages/android_page.dart';
import 'package:shop_app/pages/music_view.dart';
import 'package:shop_app/pages/animate_page.dart';
import 'package:shop_app/pages/login_ui2.dart';
import 'package:shop_app/pages/card_page.dart';
import 'package:shop_app/pages/shoppingUI/shopping.dart';
import 'package:shop_app/pages/shoppingCartUI1/shoppint_cart_ui1.dart';
import 'package:shop_app/pages/guide/guide_page.dart';
import 'package:shop_app/pages/netflix/netflix_page.dart';



class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _iconColor = Theme.of(context).primaryColor;

    // 跳转页面
    void _jumpPage (Widget widget) {
      Navigator.of(context).push(
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
            child: ListTile(title: Text('Animate'), leading: Icon(Icons.android, color: Colors.blue,)),
            onTap: () {
              _jumpPage(AnimatePage());
            },
          ),
          InkWell(
            child: ListTile(title: Text('LoginUI2'), leading: Icon(Icons.person, color: Colors.green,)),
            onTap: () {
              _jumpPage(LoginUI2());
            },
          ),
          InkWell(
            child: ListTile(title: Text('Map'), leading: Icon(Icons.map, color: Theme.of(context).primaryColor,)),
            onTap: () {
                _jumpPage(MapPage());
            },
          ),
          InkWell(
            child: ListTile(title: Text('Card'), leading: Icon(Icons.credit_card, color: Theme.of(context).primaryColor,)),
            onTap: () {
                _jumpPage(CardPage());
            },
          ),
          InkWell(
            child: ListTile(title: Text('ShoppingUI'), leading: Icon(Icons.shop, color: Theme.of(context).primaryColor,)),
            onTap: () {
                _jumpPage(ShoppintUiPage());
            },
          ),
          InkWell(
            child: ListTile(title: Text('ShoppingCart1'), leading: Icon(Icons.card_travel, color: Theme.of(context).primaryColor,)),
            onTap: () {
                _jumpPage(ShoppingCart1());
            },
          ),
          InkWell(
            child: ListTile(title: Text('GuidePage'), leading: Icon(Icons.card_giftcard, color: Theme.of(context).primaryColor,)),
            onTap: () {
                _jumpPage(GuidePage());
            },
          ),
          InkWell(
            child: ListTile(title: Text('NetFlix'), leading: Icon(Icons.videocam, color: Theme.of(context).primaryColor,)),
            onTap: () {
                _jumpPage(NetflixPage());
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
