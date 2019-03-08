import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  
  final productDetailName;
  final pictrueDetail;
  final oldPriceDetail;
  final priceDetail;

  ProductPage({
    this.productDetailName,
    this.pictrueDetail,
    this.oldPriceDetail,
    this.priceDetail
  });

  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  
  @override
  Widget build(BuildContext context) {
    print(widget.pictrueDetail);
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: Text('ShopApp'),
        backgroundColor: Colors.red,
        //右侧工具栏
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            color: Colors.black,
            child:GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.pictrueDetail, fit: BoxFit.contain,),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(widget.productDetailName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                  title: Row(
                    children: <Widget>[
                      Expanded(child: Text("\$${widget.oldPriceDetail}",style: TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough)),),
                      Expanded(child: Text("\$${widget.priceDetail}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 17)),)
                    ],
                  ),
                ),
              ),
            )
          ),
          Row(
            children: <Widget>[
              // ============== Color Button ===============
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Color'),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              ),
              // ============== Size Button ===============
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Size'),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              ),
              //  ============== Qty Button ===============
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Qty'),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          //    ================ Second button ===================
          Row(
            children: <Widget>[
              // ============== Color Button ===============
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text('Buy now')
                ),
              ),
              // 购物车
              IconButton(icon: Icon(Icons.add_shopping_cart, color: Colors.red,),onPressed: (){},),
              // 收藏
              IconButton(icon: Icon(Icons.favorite_border, color: Colors.red,),onPressed: (){},)
            ],

          )
        ],
      ),
    );
  }
}