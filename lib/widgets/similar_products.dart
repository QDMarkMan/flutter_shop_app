import 'package:flutter/material.dart';
import 'package:shop_app/widgets/single_product.dart';

// 相似商品组件
class SimilarProduct extends StatefulWidget {
  @override
  _SimilarProductState createState() => _SimilarProductState();
}

class _SimilarProductState extends State<SimilarProduct> {
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
