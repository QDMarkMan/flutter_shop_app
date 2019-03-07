/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @LastEditors: etongfu
 * @Description: 首页轮播图
 * @youWant: add you want info here
 * @Date: 2019-03-07 11:20:17
 * @LastEditTime: 2019-03-07 11:49:56
 */
import 'package:flutter/material.dart';

import 'package:carousel_pro/carousel_pro.dart';

class HomeSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 200.0,
        width: 300.0,
        child: new Carousel(
          boxFit: BoxFit.cover,
          images: [
            // NetworkImage('https://yanxuan.nosdn.127.net/38d204ba72e3a72afb59d1b491a15f5d.png?quality=95&thumbnail=265x265&imageView'),
            ExactAssetImage("images/01.png"),
            ExactAssetImage("images/02.png"),
            ExactAssetImage("images/03.png")
          ],
          autoplay: true,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 1000),
          dotSize: 4.0,
          dotSpacing: 15.0,
          dotColor: Theme.of(context).primaryColor,
          indicatorBgPadding: 10,
          dotBgColor: Colors.grey.withOpacity(0.5),
        )
      ),
    );
  }
}