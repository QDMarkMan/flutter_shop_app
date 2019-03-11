import 'package:flutter/material.dart';
import 'package:shop_app/pages/home_page.dart';

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
  
  // void _showDialog()

  @override
  Widget build(BuildContext context) {
    print(widget.pictrueDetail);
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Theme.of(context).primaryColor,
        title: InkWell(
          child: Text('ShopApp'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => new HomePage())
            );
          },
        ),
        //右侧工具栏
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
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
                  onPressed: () {
                    // 展示dialog
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        title: Text('Color'),
                        content: Text('Choose Color'),
                        actions: <Widget>[
                          MaterialButton(
                            onPressed: () {
                              // dialog在这里看来其实是一个页面
                              Navigator.of(context).pop(context);
                            },
                            child: Text('close'),
                          )
                        ],
                      );
                    });
                  },
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
                  onPressed: () {
                    
                  },
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
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: Text('Buy now')
                ),
              ),
              // 购物车
              IconButton(icon: Icon(Icons.add_shopping_cart, color: Theme.of(context).primaryColor,),onPressed: (){},),
              // 收藏
              IconButton(icon: Icon(Icons.favorite_border, color: Theme.of(context).primaryColor,),onPressed: (){},)
            ],
          ),
          Divider(),
          ListTile(
            title: Text('Product details'),
            subtitle: Text("The draft foreign investment law that has been submitted to the second session of China's top legislative body for deliberation is now a focus of public attention. China has the determination to further open up its economy, and it hopes the West can offer the same sincerity in return to open its high-tech markets, especially the 5G sector, to Chinese companies."),
          ),
          Divider(),
          // 
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
                child: Text('Product Name', style:TextStyle(color:Colors.grey)),
              ),
               Padding(
                padding: EdgeInsets.all(5),
                child: Text(widget.productDetailName),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
                child: Text('Product Brand', style:TextStyle(color:Colors.grey)),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text('Brand X'),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
                child: Text('Product Condition', style:TextStyle(color:Colors.grey)),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text('New'),
              )
            ],
          ),
        ],
      ),
    );
  }
}