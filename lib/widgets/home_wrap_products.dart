/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @LastEditors: etongfu
 * @Description: 最新产品展示
 * @youWant: add you want info here
 * @Date: 2019-03-08 09:57:27
 * @LastEditTime: 2019-06-17 11:53:37
 */
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_app/api/home_api.dart';
import 'package:dio/dio.dart';
// import 'package:shop_app/widgets/single_product.dart';
import 'dart:ui';

class HomeWrapProducts extends StatefulWidget {
  _HomeWrapProductsState createState() => _HomeWrapProductsState();
}

class _HomeWrapProductsState extends State<HomeWrapProducts> {
  List<dynamic> products =List();

  void getList () async{
    Response response =await getHomeList();
    products =  response.data["feedList"];
    setState(() {
      print("修改产品列表");
      products =  response.data["feedList"];
    });

  }
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 获取产品列表
    // getList();
  }
  var productList = [
    {
      "productName": "name1",
      "pictrue": "images/products/pro01.jpg",
      "oldPrice": "99",
      "price": "29.99"
    },
    {
      "productName": "nam2",
      "pictrue": "images/products/pro02.png",
      "oldPrice": "99",
      "price": "29.99"
    },
    {
      "productName": "Cloth",
      "pictrue": "images/products/pro03.png",
      "oldPrice": "99",
      "price": "29.99"
    },
    {
      "productName": "NeiYI",
      "pictrue": "images/products/pro04.png",
      "oldPrice": "99",
      "price": "29.99"
    },
    {
      "productName": "Pants",
      "pictrue": "images/products/pro05.png",
      "oldPrice": "99",
      "price": "29.99"
    },
    {
      "productName": "Pets",
      "pictrue": "images/products/pro06.jpg",
      "oldPrice": "99",
      "price": "29.99"
    },
    {
      "productName": "Last",
      "pictrue": "images/products/pro02.png",
      "oldPrice": "99",
      "price": "29.99"
    }
  ];
  // 构建list
  Widget _listWidget() {
    final Size _screenSize = MediaQuery.of(context).size;
    if (productList.length != 0) {
      List<Widget> listWidget = products.map((item) {
        return Container(
            height: _screenSize.height / 3.5,
            width: _screenSize.width / 2,
            child: Card(
              child: Hero(
                tag: item["title"],
                child: InkWell(
                  onTap: () {},
                  child: GridTile(
                    child: Image.network(item["url"]),
                    footer: Container(
                        color: Colors.white70,
                        child: Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text( item["title"], style: TextStyle( fontWeight: FontWeight.bold, fontSize: 16), ),
                              ),
                              Text( "\$${item['favorites']},", style: TextStyle( color: Colors.red, fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        )),
                  ),
                ),
              ),
            ),
          );
      }).toList();
      
      return Wrap(
        runSpacing: 5,
        children: listWidget,
      );
    } else {
      return Text('暂无相关商品');
    }
  }

  @override
  Widget build(BuildContext context) {
    /* return Wrap(
        // spacing: 2,
        runSpacing: 5,
        children: <Widget>[
          Container(
            height: _screenSize.height / 3.5,
            width: _screenSize.width / 2,
            child: Card(
              child: Hero(
                tag: '111',
                child: InkWell(
                  onTap: () {},
                  child: GridTile(
                    child: Image.asset(
                      "images/products/pro06.jpg",
                      fit: BoxFit.cover,
                    ),
                    footer: Container(
                        color: Colors.white70,
                        child: Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "demo",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              Text(
                                "\$20",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        )),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: _screenSize.height / 3.5,
            width: _screenSize.width / 2,
            child: Card(
              child: Hero(
                tag: '111',
                child: InkWell(
                  onTap: () {},
                  child: GridTile(
                    child: Image.asset(
                      "images/products/pro06.jpg",
                      fit: BoxFit.cover,
                    ),
                    footer: Container(
                        color: Colors.white70,
                        child: Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text( "demo", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 16), ),
                              ),
                              Text( "\$20", style: TextStyle( color: Colors.red, fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        )),
                  ),
                ),
              ),
            ),
          ),
        ],
    ); */
    return _listWidget();
  }
}
