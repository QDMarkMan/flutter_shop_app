import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../pages/index_page.dart';
import '../pages/found_page.dart';
import '../pages/mine_page.dart';
import '../pages/shop_page.dart';

class BottomNav extends StatefulWidget {
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  // 颜色
  // final Color _color =CupertinoColors.black;
  List<BottomNavigationBarItem> bottoms =List<BottomNavigationBarItem>();
  int _currentIndex = 0;
  List<Widget> pages = [
    IndexPage(),
    ShopPage(),
    FoundPage(),
    MinePage()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bottoms..add(BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('Home')))
           ..add(BottomNavigationBarItem(icon: Icon(CupertinoIcons.shopping_cart), title: Text('Shop')))
           ..add(BottomNavigationBarItem(icon: Icon(CupertinoIcons.folder), title: Text('Found')))
           ..add(BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), title: Text('Mine')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // 使用的比较多颜色
        type: BottomNavigationBarType.fixed,
        iconSize: 22,
        fixedColor: CupertinoColors.activeBlue,
        items: bottoms,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
           _currentIndex = index; 

          });
        },
      ),
    );
  }
}