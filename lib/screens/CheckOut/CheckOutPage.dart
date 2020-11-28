import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/providers/AddToCart.dart';
import 'package:ecommerce/providers/user_profile.dart';
import 'package:ecommerce/screens/HomePage/HomePageBody.dart';
import 'package:ecommerce/services/Order_service.dart';
import 'package:ecommerce/services/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'PaymentScreen.dart';


class CheckOutPage extends StatefulWidget {

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final firestoreInstance = FirebaseFirestore.instance;
  FullScreenDialog _myDialog = new FullScreenDialog();

  String _radioValue1 = '';

  final String cashOnDelivery='cash on delivery';
  final String onlineBanking='online Banking';


  void _handleRadioValueChange1(String value) {
    setState(() {
      _radioValue1 = value;
    });
  }

  String userName;
  @override
  void initState() {
    userProfile().then((value) {
     // userName=  value.name;
      print(userName);
      setState(() {
        setState(() {
          userName=  value.name;
        });
      });
      //  userNameProvider.setDisplayText(userName);
    });
    // TODO: implement initState
    super.initState();
  }


//  String url;
//
//  Future<Map<String,dynamic>> webViewUrl() async {
//    final response = await http.post('http://sslcommerz.weaverecom.tk/api/pay',
//        headers: {});
//
//    if (response.statusCode == 200) {
//      print(response.body);
//      return json.decode(response.body);
//    } else {
//      throw Exception('Failed to load album');
//    }
//  }



  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    var cartProvider = Provider.of<AddToCartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Checkout",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            height: hp * 0.32,
            width: hw * 0.9,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "User name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Shipping Address"),
                          InkWell(
                              onTap: () {
                                Navigator.push(context, new MaterialPageRoute(
                                  builder: (BuildContext context) => _myDialog,
                                  fullscreenDialog: true,
                                ));
                              },
                              child: Text(
                                "EDIT",
                                style: TextStyle(color: Colors.blue),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      new Card(child: new ListTile(
                        title: new Text("Click to add your Shipping Address"),
                        subtitle: new Text(
                            "${_myDialog._address}    ${_myDialog._mobileNo}    ${_myDialog
                                ._dateTime}"),
                        onTap: () {
                          Navigator.push(context, new MaterialPageRoute(
                            builder: (BuildContext context) => _myDialog,
                            fullscreenDialog: true,
                          ));
                        },
                      ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: hp * 0.31,
            width: hw * 0.9,
            child: Card(
              elevation: 1.0,
              color: Colors.white70,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Payment Method",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: const Text('Cash On Delivery'),
                    leading: Radio(
                      value: cashOnDelivery,
                      activeColor: Colors.red,
                      groupValue: _radioValue1,
                      onChanged: _handleRadioValueChange1,
                      focusColor: Colors.red,
                    ),
                  ),
                  ListTile(
                    title: const Text('Online Banking System'),
                    leading: Radio(
                      value: onlineBanking,
                      groupValue: _radioValue1,
                      onChanged: _handleRadioValueChange1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: hp * 0.08,
            width: hw,
            //color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: hw * 0.52,
                  child: Column(
                    children: <Widget>[
                      Center(
                          child: Text(
                        "\$${cartProvider.totalPrice}",
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      )),
                      Center(child: Text("Vat included where applicable")),
                    ],
                  ),
                ),
                InkWell(
                  onTap: ()async{

                    addShippingAddress(_myDialog._address, _myDialog._mobileNo,cartProvider.totalPrice, _myDialog._dateTime,_radioValue1,cartProvider.orderDetails).then((value) {
                      print(value);
                    });
                    Alert(
                      context: context,
                      type: AlertType.success,
                      title: "SuccessFully Order Completed",
                   //   desc: "Flutter is more awesome with RFlutter Alert.",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Ok",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePageBody())),
                          width: 120,
                        )
                      ],
                    ).show();

                    firestoreInstance.collection("notifications").add(
                        {
                          "address" :_myDialog._address,
                          "name" : userName,
                          "price" : cartProvider.totalPrice.toString(),
                        }).then((value){
                      print(value.id);
                    });

//                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PymentRecivePage()));
                  },
                  child: Container(
                      margin: EdgeInsets.only(right: 10),
                      height: hp * 0.06,
                      width: hw * 0.4,
                      color: kPrimaryColor,
                      child: Center(
                        child: Text(
                          "Proceed to Pay",
                          style: TextStyle(color: Colors.white,fontSize: 18),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}






class FullScreenDialog extends StatefulWidget {
  String _address = "Address";
  String _mobileNo = "Mobile no";
  String _dateTime = "Add Date Time";

  @override
  FullScreenDialogState createState() => new FullScreenDialogState();
}

class FullScreenDialogState extends State<FullScreenDialog> {
  TextEditingController _addressCtlr = new TextEditingController();
  TextEditingController _phoneCtlr = new TextEditingController();
  DateTime selectedDate;


  void _pickStartDateDialog() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        //which date will display when user open the picker
        firstDate: DateTime(1950),
        //what will be the previous supported year in picker
        lastDate: DateTime
            .now()) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        //for rebuilding the ui
        selectedDate = pickedDate;
      });
    });
  }



  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Add Shipping Address"),
        ),
        body: new Padding(child: new ListView(
          children: <Widget>[
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 10),
              child: new TextField(controller: _addressCtlr,
                decoration: InputDecoration(
                  //  border: InputBorder.,
                  contentPadding: EdgeInsets.all(10),
                    hintText: 'Enter Shipping Address'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 10),
              child: new TextField(controller: _phoneCtlr,
                decoration: InputDecoration(
                  //  border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Enter Phone Number'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(
                        left: 10),
                    child: Text(
                        selectedDate ==
                            null //ternary expression to check if date is null
                            ? '${widget._dateTime}'
                            : '${DateFormat.yMd().format(selectedDate)}',
                        style: TextStyle(
                          color:Colors.grey,
                          fontSize: 18,)),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(right: 10,left: 10,top: 20,bottom: 20),
                    child:
                    InkWell(
                        onTap: (){
                          setState(() {
                            _pickStartDateDialog();
                          });
                        },
                        child: Icon(Icons.date_range)
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50,),
            new Row(
              children: <Widget>[
                new Expanded(child: new RaisedButton(onPressed: () {
                  widget._dateTime = convertDateTimeDisplay(selectedDate.toString());
                  widget._mobileNo = _phoneCtlr.text;
                  widget._address = _addressCtlr.text;
                  Navigator.pop(context);
                }, child: new Text("Save"),))
              ],
            )
          ],
        ), padding: const EdgeInsets.symmetric(horizontal: 20.0),)
    );
  }


}