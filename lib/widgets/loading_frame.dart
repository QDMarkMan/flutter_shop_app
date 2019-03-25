/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @LastEditors: etongfu
 * @Description: 默认加载状态  基于flutter_spinkit实现
 * @youWant: add you want info here
 * @Date: 2019-03-25 11:34:28
 * @LastEditTime: 2019-03-25 12:01:28
 */
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  final  Widget child;
  Loading({Key key, this.child}) : super(key: key);
  
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool loading = false;
  Widget _setContent () {
    if (loading) {
      return Stack(
        overflow: Overflow.clip,
        children: <Widget>[
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: SpinKitWave(color: Theme.of(context).primaryColor, type: SpinKitWaveType.start, size: 36,)
            )
          )
        ],
      );
    } else {
      return Container();
    }
  }


  @override
  Widget build(BuildContext context) {
    // 确保全屏
   return ConstrainedBox(
     constraints: BoxConstraints.expand(),
     child: Stack(
        overflow: Overflow.clip,
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: SpinKitWave(color: Theme.of(context).primaryColor, type: SpinKitWaveType.start, size: 36,)
            )
          ),
          
        ],
      ),
   );
  }
}