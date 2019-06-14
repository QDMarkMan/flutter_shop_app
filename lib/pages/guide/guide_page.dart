/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @Version: 
 * @Date: 2019-06-14 09:56:06
 * @LastEditors: etongfu
 * @LastEditTime: 2019-06-14 11:52:41
 * @Description: 引导页
 * @youWant: add you want info here
 */
import 'package:flutter/material.dart';
import 'data.dart';
import 'gradient_text.dart';
// 页面
class GuidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GuideApp(),
    );
  }
}

class GuideApp extends StatefulWidget {
  @override
  _GuideAppState createState() => _GuideAppState();
}

class _GuideAppState extends State<GuideApp> {

  PageController _pageController;
  int _index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: _index);
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF485563), Color(0xFF29323C)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp,
          stops: [0.0, 1.0]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            PageView.builder(
              itemCount: pages.length,
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _index = index; 
                });
              },
              itemBuilder: (context, index) {
                return Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    AnimatedBuilder(
                      animation: _pageController,
                      builder: (context, child) {
                        var page = pages[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(page.imageUrl, ),
                            Container(
                              height: 100,
                              child: Stack(
                                children: <Widget>[
                                  Opacity(
                                    opacity: 0.1,
                                    child: GradientText(
                                        page.title,
                                        gradient: LinearGradient(colors: page.titleGradient),
                                        style: TextStyle(
                                          fontSize: 90,
                                          fontFamily: "Montserrat-Black",
                                          letterSpacing: 1.0
                                        ),
                                      ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 30, left: 22),
                                      child: GradientText(
                                        page.title,
                                        gradient: LinearGradient(colors: page.titleGradient),
                                        style: TextStyle(
                                          fontSize: 70,
                                          fontFamily: "Montserrat-Black",
                                          letterSpacing: 1.0
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}