import 'package:ecommerce/constants.dart';
import 'package:ecommerce/data/HomePageTestData.dart';
import 'package:ecommerce/model/AddToCartModel.dart';
import 'package:ecommerce/providers/AddToCart.dart';
import 'package:ecommerce/screens/CheckOut/CheckOutPage.dart';
import 'package:ecommerce/screens/HomePage/HomePageBody.dart';
import 'package:ecommerce/widgets/MyCart/empty_cart_page.dart';
import 'package:ecommerce/widgets/MyCart/mycartCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyCartPage extends StatefulWidget {


  @override
  _MyCartPageState createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {

  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    var cartProvider = Provider.of<AddToCartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart', style: GoogleFonts.kaushanScript(color:kPrimaryColor )),
        leading: IconButton(
          icon: Icon(Icons.menu,color:Colors.white,),
          onPressed: null,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(right: 10,left: 10,top: 10),
              // color: Colors.redAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total Items (${cartProvider.cartList.length})',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  OutlineButton(
                    color: Colors.white,
                    onPressed: () {
                      cartProvider.removeAllItem();
                    },
                    child: Text(
                      "Clear all",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: kPrimaryColor),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              //  color: Colors.green,
              child: Builder(
                  builder: (context) {
                    if (cartProvider.cartList.isEmpty ==true ) {
                      return EmptyCart();
                    } else {
                      return ListView.builder(
                        itemCount:cartProvider.cartList.length,
                        itemBuilder: (BuildContext context, int index) => SafeArea(
                          minimum: EdgeInsets.all(10),
                          child: Container(
                            height: hp * 0.2,
                            width: double.infinity,
                            // color: Colors.green,
                            child: Align(
                              alignment: Alignment.center,
                              child:MyCartCard(cartProvider.cartList[index]['product_name'],
                                  cartProvider.cartList[index]['product_image'], cartProvider.cartList[index]['sale_price'],
                                  cartProvider.cartList[index]['regular_price'],4,cartProvider.cartList[index]['id'],cartProvider.cartList[index]['product_qty']),
                            ),
                          ),
                        ),
                      );
                    }
                  }
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.only(left: 10,right: 10),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                        child:Builder(
                            builder: (context) {
                              if (cartProvider.cartList.isEmpty == true) {
                                return Container(
                                  color: Colors.white,
                                );
                              }
                              else {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Payment Details",
                                      style: TextStyle(
                                          fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    Divider(),
                                    Row(
                                      children: <Widget>[
                                        Text("Offer -"),
                                        Text(
                                          "not Available",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold, fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("Shipping Charge-"),
                                        Text(
                                          "free",
                                          style: TextStyle(
                                              color: Colors.lightGreen,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),

                                  ],
                                );
                              }
                            }
                        )
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                      child: Builder(
                        builder: (context){
                          if(cartProvider.cartList.isEmpty==true){
                            return Container();
                          }
                          else {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "\$ ${cartProvider.totalPrice}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("Total Amount"),
                                  ],
                                ),
                                Divider(),
                                InkWell(
                                  onTap: () {
                                    cartProvider.orderDetaisList();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CheckOutPage()));
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: double.infinity,
                                    width: hw / 2,
                                    color: kPrimaryColor,
                                    child: Text(
                                      "Order",
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 20),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
