import 'package:ecommerce/widgets/Home/CategoryProdutGridBuilder.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final int categoryId;
  final String categoryName;
  CategoryScreen(this.categoryId,this.categoryName);
  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          elevation: 1.0,
          backgroundColor: Colors.white,
          // automaticallyImplyLeading: false, // Don't show the leading button
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                categoryName,
                style: TextStyle(color: Colors.black),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.search,size: 30,),
                    ),
                  ],
                ),
              )
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: hp*0.06,
              width: hw,
              //color: Colors.deepOrangeAccent,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "$categoryName Collection",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          onPressed: () => {},
                          icon: Icon(
                            Icons.swap_vert,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                        IconButton(
                          onPressed: () => {},
                          icon: Icon(
                            Icons.dashboard,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                        IconButton(
                          onPressed: () => {},
                          icon: Icon(
                            Icons.line_weight,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 5,) ,


            Expanded(
              child: Container(
                // color: Colors.lightBlue,
                child:CategoryWiseProductBulider(categoryId) ,
              ),
            ),

          ],
        ),
      ),
    );
  }
}