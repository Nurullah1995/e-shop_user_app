
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/data/user.dart';
import 'package:ecommerce/providers/user_profile.dart';
import 'package:ecommerce/screens/NewesProduct/NewProductPage.dart';
import 'package:ecommerce/widgets/Home/HomePageItemTypelistView.dart';
import 'package:ecommerce/widgets/Home/HomePageNewestProductItem.dart';
import 'package:ecommerce/widgets/Home/HomePageTopImgCarsoulBuilder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';



class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  var _scaffolkey=GlobalKey<ScaffoldState>();
////  UserProfileProvider userNameProvider=UserProfileProvider();
//   String userName;
//    @override
//  void initState() {
//       userProfile().then((value) {
//        userName=  value.name;
//         print(userName);
//      //  userNameProvider.setDisplayText(userName);
//       });
//    // TODO: implement initState
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    var userProvider = Provider.of<UserProfileProvider>(context);
    return Scaffold(
     // key:_scaffolkey ,
      //drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('E- Shop', style: GoogleFonts.kaushanScript(color:kPrimaryColor ),),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          FistCarsoulBuilder(),
          HomePageItemTypeListView(),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Newest Product",
                  style: GoogleFonts.comfortaa(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => NewProductPage('New Product')),
                      );
                    },
                    child: Text(
                      "view all",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    )),
              ],
            ),
          ),
          Container(
            height: hp*0.35,
            width: double.infinity,
            child:NewestProductItem(),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Feature Product",
                  style:GoogleFonts.comfortaa(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => NewProductPage('Feature Product')),
                      );
                    },
                    child: Text(
                      "view all",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    )),
              ],
            ),
          ),
          Container(
            height: hp*0.35,
            width: double.infinity,
            child:NewestProductItem(),
          ),
        ],
      ),
    );
  }
}

