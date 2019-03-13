import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var productsInCart = [
    {
      "productName": "Pants",
      "pictrue": "images/products/pro05.png",
      "oldPrice": 1,
      "price": "29.99",
      "size": "M",
      "color": "red"
    },
    {
      "productName": "Pets",
      "pictrue": "images/products/pro04.png",
      "oldPrice": 1,
      "price": "29.99",
      "size": "L",
      "color": "red"
    },
    {
      "productName": "Pets",
      "pictrue": "images/products/pro06.jpg",
      "oldPrice": 1,
      "price": "29.99",
      "size": "L",
      "color": "red"
    },
    {
      "productName": "Pets",
      "pictrue": "images/products/pro02.png",
      "oldPrice": 1,
      "price": "29.99",
      "size": "L",
      "color": "red"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productsInCart.length,
      itemBuilder: (context, index) {
        return ProductInCart(
          productName: productsInCart[index]['productName'],
          pictrue: productsInCart[index]['pictrue'],
          oldPrice: productsInCart[index]['oldPrice'],
          price: productsInCart[index]['price'],
          size: productsInCart[index]['size'],
          color: productsInCart[index]['color'],
        );
      }
    );
  }
}

class ProductInCart extends StatelessWidget {

  final productName;
  final pictrue;
  final oldPrice;
  final price;
  final size;
  final color;

  ProductInCart({
    this.productName,
    this.pictrue,
    this.oldPrice,
    this.price,
    this.size,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(pictrue, width: 60, height: 60,),
        title: Text(productName),
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                // =========== size =========
                Padding (
                  padding: EdgeInsets.all(0),
                  child: Text('Size:'),
                ),
                Padding (
                  padding: EdgeInsets.all(4),
                  child: Text(size, style: TextStyle(color: Colors.red),),
                ),
                // =========== color =========
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 8, 8),
                  child: Text('Color:'),
                ),
                Padding (
                  padding: EdgeInsets.all(4),
                  child: Text(color, style: TextStyle(color: Colors.red),),
                ),
                // =========== price =========
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text("\$$price", style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),),
            ),
          ],
        ),
        trailing: Column(
          children: <Widget>[
            IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: () {},),
            Text("$oldPrice"),
            IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: () {},),
          ],
        ),
      ),
    );
  }

  void addProduct() {

  }
}
