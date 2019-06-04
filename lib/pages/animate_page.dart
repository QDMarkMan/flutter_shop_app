/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @Version: 
 * @Date: 2019-06-04 09:11:05
 * @LastEditors: etongfu
 * @LastEditTime: 2019-06-04 10:09:13
 * @Description: 动画demo
 * @youWant: add you want info here
 */
import 'package:flutter/material.dart';

class AnimatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
        elevation: 0,
      ),
      body: AnimateHome(),
    );
  }
}

class AnimateHome extends StatefulWidget {
  AnimateHome({Key key}) : super(key: key);

  _AnimateHomeState createState() => _AnimateHomeState();
}

class _AnimateHomeState extends State<AnimateHome> with TickerProviderStateMixin {
  
  ///　AnimationController是一个特殊的Animation对象，在屏幕刷新的每一帧，就会生成一个新的值。默认情况下，
  /// AnimationController在给定的时间段内会线性的生成从0.0到1.0的数字
  AnimationController animationController;
  Animation animation;
  Animation animationColor;
  // 曲线动画
  CurvedAnimation curve;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 动画对象
    animationController = AnimationController(
      /* value: 30,
      lowerBound: 0,
      upperBound: 60, */
      duration: Duration(milliseconds: 1000),
      vsync: this
    );
    // 监听动画
    /* animationController.addListener(() {
      print('${animationController.value}');
      // 这里的作用是手动的去重建当前widget 下面我们使用AnimatedWidget去让他自动的重建
      setState(() {
        
      });
    }); */
    // 曲线动画
    curve = CurvedAnimation(parent: animationController, curve: Curves.bounceInOut);

    // 使用Tween 来代替AnimationController中的范围值
    animation = Tween(
      begin: 20.0,
      end: 60.0,
    ).animate(curve);
    // 颜色动画
    animationColor = ColorTween(
      begin: Colors.red,
      end: Colors.red[900]
    ).animate(animationController);
    // 执行动画
    // animationController.forward();

    animationController.addStatusListener((AnimationStatus status) {
      print(status);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center( 
      child: AnimateHeart(
        animations: [
          animation, 
          animationColor
        ],
        controller: animationController,
      ),
    );
  }
}

class AnimateHeart extends AnimatedWidget {

  final List animations;
  final AnimationController controller;

  AnimateHeart({
    this.animations,
    this.controller
  }): super(listenable: controller);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
        icon: Icon(Icons.favorite),
        iconSize: animations[0].value,
        color: animations[1].value,
        onPressed: () {
          // 判断动画状态
          switch (controller.status) {
            case AnimationStatus.completed:
              // 动画如果完成了那么倒退
              controller.reverse();
              break;
            default:
              controller.forward();
          }
        },
      );
  }
}