/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @LastEditors: etongfu
 * @Description: 第一行分类
 * @youWant: add you want info here
 * @Date: 2019-03-07 11:51:26
 * @LastEditTime: 2019-03-11 11:33:54
 */

import 'package:flutter/material.dart';

class HomeCategorys extends StatelessWidget {
  // 分类列表
  final List<CategoryTypes> _categorys = [
    CategoryTypes('images/cats/010.png','T-Shirt'),
    CategoryTypes('images/cats/004.png','Sweatshirt'),
    CategoryTypes('images/cats/011.png','Shoes'),
    CategoryTypes('images/cats/009.png','Dress'),
    CategoryTypes('images/cats/005.png','Pants')
  ];
  List<Widget> _setCats () {
    List<Widget> _temp = [];
    _categorys.forEach((cat) {
      _temp.add(
        Category(imageLocation: cat.location, imageCaption: cat.caption,)
      );
    });
    return _temp;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _setCats(),
      ),
    );
  }
}
class CategoryTypes {
  String location;
  String caption;
  CategoryTypes(this.location, this.caption);
}
// 单个分类
class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

  Category({
    this.imageLocation,
    this.imageCaption
  });
  
  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),      
      child: InkWell(
        onTap: () {},
        // 分类图标
        child: Container(
            width: 80,
            child: ListTile(
              title: Image.asset(imageLocation, width: 40,height: 40,),
//              subtitle: Text(imageCaption, textAlign: TextAlign.center,),
            ),
        ),
      ),
    );
  }
}