import 'package:ecommerce/services/Order_service.dart';
import 'package:flutter/material.dart';

class OrderDetailsPage extends StatefulWidget {
   int orderId;
   OrderDetailsPage(this.orderId);
  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            'Order Details',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: FutureBuilder<Map<String,dynamic>>(
            future: getOrderDetails(widget.orderId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text(snapshot.error);
                }
               List orderDetailsList=snapshot.data['order details'];
                return Column(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Container(
                        //  color: Colors.green,
                        child: ListView.builder(
                          itemCount:orderDetailsList.length,
                          itemBuilder: (BuildContext context, int index) => SafeArea(
                            minimum: EdgeInsets.all(10),
                            child: Container(
                              height: hp * 0.2,
                              width: double.infinity,
                              // color: Colors.green,
                              child: Align(
                                alignment: Alignment.center,
                                child:Container(
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
                                            'http://weaverbd.net/ecommerce-api/''${orderDetailsList[index]['product_image']}',
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
                                              Text(orderDetailsList[index]['product_name'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                              SizedBox(height: 5,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Text("Price :\$${orderDetailsList[index]['product_price']}",style: TextStyle(color: Colors.red,fontSize: 16),),
                                                  SizedBox(width: 10,),
                                                  Text("Quantity : ${orderDetailsList[index]['product_qty']}",style: TextStyle(fontSize: 16),),
                                                ],
                                              ),
                                              Text('Category Name : ${orderDetailsList[index]['category_name']}'),
                                              Text("Color Name : ${orderDetailsList[index]['color_name']}"),
                                              Text("Size Name : ${orderDetailsList[index]['size_name']}"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                  child:Builder(
                                      builder: (context) {
                                        if (snapshot.data.isEmpty == true) {
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
                                                "Shopping Address",
                                                style: TextStyle(
                                                    fontSize: 18, fontWeight: FontWeight.bold),
                                              ),
                                              Divider(),
                                              Row(
                                                children: <Widget>[
                                                  Text("Address :  ",style: TextStyle(fontSize: 18),),
                                                  Text(
                                                    "${snapshot.data['order details'][0]['shipping_address']}",
                                                    style: TextStyle(
                                                        color: Colors.lightGreen,
                                                        fontWeight: FontWeight.bold, fontSize: 20),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Text("Contact Number :  ",style: TextStyle(fontSize: 18),),
                                                  Text(
                                                    "${snapshot.data['order details'][0]['shipping_contact_number']}",
                                                    style: TextStyle(
                                                        color: Colors.lightGreen,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Text("OrderStatus :  ",style: TextStyle(fontSize: 18),),
                                                  Text(
                                                    "${snapshot.data['order details'][0]['order_status']}",
                                                    style: TextStyle(
                                                        color: Colors.lightGreen,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Text("Payment Method :  ",style: TextStyle(fontSize: 18),),
                                                  Text(
                                                    "${snapshot.data['order details'][0]['payment_method']}",
                                                    style: TextStyle(
                                                        color: Colors.lightGreen,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Text("Shopping Date :  ",style: TextStyle(fontSize: 18),),
                                                  Text(
                                                    "${snapshot.data['order details'][0]['shipping_date']}",
                                                    style: TextStyle(
                                                        color: Colors.lightGreen,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 10),
                                                child: Row(
                                                  children: <Widget>[
                                                    Text("Total Amount :  ",style: TextStyle(fontSize: 18),),
                                                    Text(
                                                      "\$ ${snapshot.data['total amount']}",
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 20),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        }
                                      }
                                  ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );

              }
              else return Center(
                child: CircularProgressIndicator(),
              );
            }),
    );
  }
}
