import 'package:ecommerce/constants.dart';
import 'package:ecommerce/model/Order/OrderListModel.dart';
import 'package:ecommerce/screens/HomePage/HomePageBody.dart';
import 'package:ecommerce/screens/Order/OrderDetails.dart';
import 'package:ecommerce/services/Order_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class OrderListScreen extends StatefulWidget {
  @override
  _OrderListScreenState createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order List', style: GoogleFonts.kaushanScript(color:kPrimaryColor)),
        leading: IconButton(
          icon: Icon(Icons.menu,color:Colors.white,),
          onPressed: null,
        ),
      ),
      body: FutureBuilder<List<OrderListModel>>(
        future:fetchOrderList() ,
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetailsPage(snapshot.data[index].id)));
                  },
                  child: Card(
                    elevation: 3.0,
                    margin: new EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.black12),
                      child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                          leading: Container(
                            padding: EdgeInsets.only(right: 6.0),
                            decoration: new BoxDecoration(
                                border: new Border(
                                    right: new BorderSide(width: 1.0, color: Colors.black))),
                            child:Text("${snapshot.data[index].id}",style: TextStyle(fontSize: 23,color: Colors.black),),
                          ),
                          title: Row(
                            children: [
                              Text(
                                "${snapshot.data[index].userName}",
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        "Total : ",
                                        style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold),
                                      ),Text(
                                        "${snapshot.data[index].totalAmount}\$",
                                        style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                              ),
                            ],
                          ),
                          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                          subtitle: Row(
                            children: <Widget>[
                              Text("Order Status:", style: TextStyle(color: Colors.black)),
                              Text("${snapshot.data[index].orderStatus}", style: TextStyle(color:kPrimaryColor)),
                              Text(" Payment:", style: TextStyle(color: Colors.black)),
                              Text("${snapshot.data[index].paymentMethod}", style: TextStyle(color: kPrimaryColor)),
                            ],
                          ),
                          trailing:
                          Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 10.0)),
                    ),
                  ),
                );
              }
          )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
