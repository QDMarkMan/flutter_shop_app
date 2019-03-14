/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @LastEditors: etongfu
 * @Description: toast 帮助文档
 * @youWant: add you want info here
 * @Date: 2019-03-14 10:25:24
 * @LastEditTime: 2019-03-14 11:02:15
 */
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// toast 
class ToastHelp {
  
  @required
  String msg;
  Color bgColor;
  Color textColor;
  ToastGravity location;

  ToastHelp({
    this.msg,
    this.bgColor,
    this.textColor,
    this.location
  });
  // =========== 自定义提示 ===========
  void setToast () {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: bgColor,
        textColor: textColor,
        fontSize: 16.0
    );
  }
  // =========== 错误提示 ===========
  void errorToast () {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }


}