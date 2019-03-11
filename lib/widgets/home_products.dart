/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @LastEditors: etongfu
 * @Description: 最新产品展示
 * @youWant: add you want info here
 * @Date: 2019-03-08 09:57:27
 * @LastEditTime: 2019-03-11 11:27:46
 */
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_app/pages/product_details.dart';

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
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // GridView中渲染子widget的总数
      itemCount: productList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
      ),
      itemBuilder: (BuildContext contex, int index) {
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

class Product extends StatelessWidget {
  final productName;
  final pictrue;
  final oldPrice;
  final price;

  Product({
    this.productName,
    this.pictrue,
    this.oldPrice,
    this.price
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Hero(
          tag: productName,
          child: Material(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) {
                      // 构建页面的时候传递值
                      return ProductPage(
                        productDetailName: productName,
                        priceDetail: price,
                        oldPriceDetail: oldPrice,
                        pictrueDetail: pictrue,
                      );
                    }
                  )
                );
              },
              // 图片层
              child: GridTile(
                child: Image.asset(pictrue, fit: BoxFit.cover,),
                // 底部遮罩
                footer: Container(
                  color: Colors.white70,
                  // 更新价格信息样式
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(productName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        ),
                        Text("\$$price", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700),)
                      ],
                    ),
                  )
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}