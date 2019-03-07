import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _iconColor = Theme.of(context).primaryColor;
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('etongfu'),
            accountEmail: Text('13583254085@163.com'),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.grey),
              ),
            ),
            decoration: BoxDecoration(color: Colors.red),
          ),
          // InkWell 水波纹效果
          InkWell(
            child: ListTile(title: Text('Home Page'), leading: Icon(Icons.home, color: _iconColor,)),
            onTap: () {

            },
          ),
          InkWell(
            child: ListTile(title: Text('Account'), leading: Icon(Icons.person)),
            onTap: () {
              
            },
          ),
          InkWell(
            child: ListTile(title: Text('Orders'), leading: Icon(Icons.shopping_basket)),
            onTap: () {
              
            },
          ),
          InkWell(
            child: ListTile(title: Text('Found'), leading: Icon(Icons.dashboard)),
            onTap: () {
              
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 3, bottom: 3),
            child: Divider(),
          ),
          InkWell(
            child: ListTile(title: Text('Setting'), leading: Icon(Icons.settings, color: Colors.blue,)),
            onTap: () {
              
            },
          ),
          InkWell(
            child: ListTile(title: Text('Question'), leading: Icon(Icons.help, color: Colors.green,)),
            onTap: () {
              
            },
          ),
        ],
      ),
    );
  }
}
