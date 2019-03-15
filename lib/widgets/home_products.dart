/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @LastEditors: etongfu
 * @Description: 最新产品展示
 * @youWant: add you want info here
 * @Date: 2019-03-08 09:57:27
 * @LastEditTime: 2019-03-15 11:31:34
 */
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_app/widgets/single_product.dart';


class HomeProducts extends StatefulWidget {
  _HomeProductsState createState() => _HomeProductsState();
}
class _HomeProductsState extends State<HomeProducts> {
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
    }
  ];
  // 构建list
  Widget _listWidget() {
    if (productList.length != 0) {
      List<Widget> listWidget = productList.map((item) {
        return Product(
          productName: item['productName'],
          pictrue: item['pictrue'],
          oldPrice: item['oldPrice'],
          price: item['price'],
        );
      }).toList();
      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    } else {
      return Text('暂无相关商品');
    }
  }

  @override
  Widget build(BuildContext context) {
    // _listWidget();

    return GridView.builder(
      // GridView中渲染子widget的总数
      itemCount: productList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Product(
          productName: productList[index]['productName'],
          pictrue: productList[index]['pictrue'],
          oldPrice: productList[index]['oldPrice'],
          price: productList[index]['price'],
        );
      },
    );
  }
}