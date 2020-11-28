import 'package:ecommerce/constants.dart';
import 'package:ecommerce/data/HomePageTestData.dart';
import 'package:ecommerce/model/Wishlist/WishListModel.dart';
import 'package:ecommerce/screens/HomePage/HomePageBody.dart';
import 'package:ecommerce/screens/ProductDetails/ProductDetails.dart';
import 'package:ecommerce/screens/WishList/WishlistEmplyPage.dart';
import 'package:ecommerce/services/wishList_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishListPage extends StatefulWidget {
   
  @override
  _WishListPageState createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  HomePageTestData homePageTestData = HomePageTestData();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('WishList', style: GoogleFonts.kaushanScript(color:kPrimaryColor )),
        leading: IconButton(
          icon: Icon(Icons.menu,color:Colors.white,),
          onPressed: null,
        ),
      ),
      body: FutureBuilder<List<WishListModel>>(
          future: getWishList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return WishListEmpyPage();
              }

              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) => SafeArea(
                  minimum: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: (){

                    },
                    child: Container(
                      height: hp * 0.18,
                      width: double.infinity,
                      // color: Colors.green,
                      child: Align(
                        alignment: Alignment.center,
                        child:Container(
                          height: hp*0.18,
                          width: hw*0.97,
                          // color:Colors.red,
                          child: Card(
                            elevation: 0.5,
                            shadowColor: Colors.black12,
                            color: Colors.white12,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: double.infinity,
                                  width: hw*0.3,
                                  color: Colors.red,
                                  child: Image.network(
                                    'http://weaverbd.net/ecommerce-api/'
                                    // ignore: unnecessary_brace_in_string_interps
                                        '${snapshot.data[index].productImage}',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(width: 15,),
                                Container(
                                  margin: EdgeInsets.only(top: 12),
                                  height: double.infinity,
                                  width: hw*0.5,
                                  //color: Colors.black12,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(snapshot.data[index].productName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      SizedBox(height: 10,),
                                      Text("\$ ${snapshot.data[index].price.toDouble()}",style: TextStyle(color: Colors.red,fontSize: 22),),
                                      Row(
                                        children: <Widget>[
                                          InkWell(
                                            onTap: (){},
                                            child: Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(Icons.move_to_inbox),
                                                  Text(" Move Cart")
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5,),
                                          InkWell(
                                            onTap: (){
                                              setState(() {
                                                deleteWishlist(snapshot.data[index].wishlisId.toString()).then((value) {
                                                  print(value);
                                                });
                                              });
                                            },
                                            child: Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(Icons.remove_from_queue),
                                                  Text(" Remove")
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
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
              );
            }
            else return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
