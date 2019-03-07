/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @LastEditors: etongfu
 * @Description: 主页
 * @youWant: add you want info here
 * @Date: 2019-03-07 10:08:16
 * @LastEditTime: 2019-03-07 13:44:08
 */
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// 抽屉
import 'package:shop_app/widgets/nav_drawer.dart';
import 'package:shop_app/widgets/home_swiper.dart';
import 'package:shop_app/widgets/home_category.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShopApp'),
        backgroundColor: Colors.red,
        //右侧工具栏
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              
            },
          )
        ],
      ),
      // 抽屉
      drawer: NavDrawer(),
      body: ListView(
        children: <Widget>[
          // image carouse
          HomeSwiper(),
          // title
          Padding(
            padding: EdgeInsets.all(8),
            child: Text('Categories', style: TextStyle(),)
          ),
          // 横向listview
          HomeCategorys()
        ],
      ),
    );
  }
}