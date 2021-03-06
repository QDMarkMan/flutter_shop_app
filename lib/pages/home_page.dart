/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @LastEditors: etongfu
 * @Description: 主页
 * @youWant: add you want info here
 * @Date: 2019-03-07 10:08:16
 * @LastEditTime: 2019-06-17 11:37:47
 */
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// 抽屉
import 'package:shop_app/widgets/nav_drawer.dart';
import 'package:shop_app/widgets/home_swiper.dart';
import 'package:shop_app/widgets/home_category.dart';
// import 'package:shop_app/widgets/home_products.dart';
import 'package:shop_app/widgets/home_wrap_products.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: Text('ShopApp'),
        backgroundColor: Theme.of(context).primaryColor,
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
          HomeCategorys(),
          // title
          Padding(
            padding: EdgeInsets.all(8),
            child: Text('Recent Products', style: TextStyle(),)
          ),
          /* Container(
            height: 320,
            child: HomeProducts(),
          ) */
          HomeWrapProducts(),
          // loading状态
          // SpinKitWave(color: Theme.of(context).primaryColor, type: SpinKitWaveType.start, size: 36,),
          // 最新产品
        ],
      ),
    );
  }
}