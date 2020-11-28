import 'package:ecommerce/providers/AddToCart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCartCard extends StatefulWidget {
  final String picture;
  final String productName;
  final int newPrice;
  final int oldPrice;
  final int productItemCount;
  final int productId;
  final int product_qty;
  MyCartCard(@required this.productName,@required this.picture,@required this.newPrice,@required this.oldPrice,@required this.productItemCount,this.productId,this.product_qty);

  @override
  _MyCartCardState createState() => _MyCartCardState();
}

class _MyCartCardState extends State<MyCartCard> {
  @override
  Widget build(BuildContext context) {
    var hp=MediaQuery.of(context).size.height;
    var hw=MediaQuery.of(context).size.width;
    var cartProvider = Provider.of<AddToCartProvider>(context);

    return  Container(
      height: hp*0.25,
      width: hw*0.92,
       color:Colors.white12,
      child: Card(
        elevation: 0.5,
        shadowColor: Colors.black12,
        color: Colors.white12,
        child: Row(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: hw*0.35,
              color: Colors.red,
              child: Image.network(
                'http://weaverbd.net/ecommerce-api/'
                // ignore: unnecessary_brace_in_string_interps
                    '${widget.picture}',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(width: 15,),
            Container(
              height: double.infinity,
              width: hw*0.5,
              //color: Colors.black12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(widget.productName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Container(
                    height: 35,
                    width: 120,
                    decoration:BoxDecoration(
                      border: Border.all(
                        //  width: 1.0,
                        color: Colors.black12
                      ),
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon:Icon(Icons.remove),
                          onPressed: (){
                            setState(() {
                              cartProvider.cartPageDecremnet(widget.productId);
                          //    cartProvider.addTotalPrice();
                            });
                          },
                        ),
                        Text("${widget.product_qty.toString()}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        IconButton(
                          icon:Icon(Icons.add),
                          onPressed: (){
                            setState(() {
                              cartProvider.cartPageIncremnet(widget.productId);
                           //   cartProvider.addTotalPrice();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text("\$ ${widget.newPrice}",style: TextStyle(color: Colors.red,fontSize: 22),),
                      SizedBox(width: 10,),
                      Text("\$ ${widget.oldPrice}",style: TextStyle(decoration: TextDecoration.lineThrough,fontSize: 16),),
                    ],
                  ),
                  //SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        cartProvider.deleteItemFromCart(widget.productId);
                      });
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.delete),
                          Text("Remove")
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
