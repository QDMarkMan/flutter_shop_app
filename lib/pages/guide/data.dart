/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @Version: 
 * @Date: 2019-06-14 10:08:09
 * @LastEditors: etongfu
 * @LastEditTime: 2019-06-14 11:57:07
 * @Description: 引导页数据
 * @youWant: add you want info here
 */
import 'package:flutter/material.dart';

class PageModel {

  var imageUrl;
  var title;
  var body;
  List<Color> titleGradient;
  PageModel(this.imageUrl, this.title, this.body, this.titleGradient);
}

List<List<Color>> gradients = [
  [Color(0xFF9708CC), Color(0xFF43CBFF)],
  [Color(0xFFE2859F), Color(0xFFFCCF31)],
  [Color(0xFF5EFCE8), Color(0xFF736EFE)]

];

var pages = [
  PageModel("images/cats/001.png", "VUE", "THIS IS A VUE GUIDE PAGE", gradients[0]),
  PageModel("images/cats/002.png", "DATA", "MY DATA PAGE", gradients[1]),
  PageModel("images/cats/003.png", "IOS", "MY IOS GUIDE PAGE", gradients[2])
];