import 'dart:convert';

import 'package:ecommerce/SharePrefarenc/PrefarenceToken.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/model/CategoryResponseModel/AllCategoryModelResponse.dart';
import 'package:ecommerce/screens/HomePage/CategoryScreen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HomePageItemTypeListView extends StatefulWidget {

  @override
  _HomePageItemTypeListViewState createState() => _HomePageItemTypeListViewState();
}

class _HomePageItemTypeListViewState extends State<HomePageItemTypeListView> {

  Future<List<Categorye>> fetchAllCategory() async {
    var token=await getValue();
    http.Response response = await http.get(
        'http://weaverbd.net/ecommerce-api/api/v1/category',
        headers:{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }
    );
    var responseJson = json.decode(response.body);
    return (responseJson['categorye'] as List)
        .map((p) => Categorye.fromJson(p))
        .toList();
  }




  @override
  Widget build(BuildContext context) {
    var hp=MediaQuery.of(context).size.height;
    var hw=MediaQuery.of(context).size.width;
    return FutureBuilder<List<Categorye>>(
        future: fetchAllCategory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error");
            }
            return Row(
              children: [
                Container(
                    height: hp*0.1,
                    width: hw,
                    child: ListView.builder(
                      padding: EdgeInsets.all(10),
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context,int index)=>Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlineButton(
                          child: Text(snapshot.data[index].categoryName,
                            style:GoogleFonts.josefinSans(fontSize: 22,fontWeight: FontWeight.bold,color:kPrimaryColor),
                          ),
                          onPressed:()=>{
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryScreen(snapshot.data[index].id,snapshot.data[index].categoryName))),
                          },
                          borderSide: BorderSide(color: Colors.greenAccent),
                        ),
                      ),
                    ),
                ),

              ],
            );
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        });
  }
}
