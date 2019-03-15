/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @LastEditors: etongfu
 * @Description: 单个产品页面
 * @youWant: add you want info here
 * @Date: 2019-03-12 09:47:01
 * @LastEditTime: 2019-03-15 10:53:39
 */
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_app/pages/product_details.dart';
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