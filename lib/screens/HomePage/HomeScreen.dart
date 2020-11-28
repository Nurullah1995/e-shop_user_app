import 'package:badges/badges.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/providers/AddToCart.dart';
import 'package:ecommerce/providers/user_profile.dart';
import 'package:ecommerce/screens/HomePage/HomePageBody.dart';
import 'package:ecommerce/screens/Login/login_screen.dart';
import 'package:ecommerce/screens/MyCart/MyCartPage.dart';
import 'package:ecommerce/screens/Order/OrderList_Screen.dart';
import 'package:ecommerce/screens/WishList/WishListPage.dart';
import 'package:ecommerce/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
PageController _pageController=PageController();
List<Widget> _screen=[
  HomePageBody(),
  MyCartPage(),
  WishListPage(),
  OrderListScreen()
];
void _onpageChange(int index){


}

void _onItemTap(int selectedIndex){
  print(selectedIndex);
  _pageController.jumpToPage(selectedIndex);
}

String userName;
@override
void initState() {
  userProfile().then((value) {
    print(userName);
    setState(() {
      userName=  value.name;
    });
    //  userNameProvider.setDisplayText(userName);
  });
  print(userName);
  // TODO: implement initState
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<AddToCartProvider>(context);
  //  var userProvider = Provider.of<UserProfileProvider>(context);
    return new Scaffold(
//      appBar: new AppBar(
//        title: Text('E- Shop', style: GoogleFonts.kaushanScript(color:Colors.red ),),
//      ),
      body: PageView(
         controller: _pageController,
        children: _screen,
        onPageChanged: _onpageChange,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar:  CurvedNavigationBar(
        animationCurve: Curves.easeInOutQuart,
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.black12,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.dashboard,size: 30,color:kPrimaryColor),
          Badge(
            badgeColor: Colors.red,
            showBadge:cartProvider.items>0,
            position: BadgePosition( bottom: 0,),
            badgeContent: Text(
              '${cartProvider.items}',
              style: TextStyle(color: Colors.white,),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart, size: 25,color: kPrimaryColor,),
//              onPressed: () {
//                Navigator.of(context).push(
//                    MaterialPageRoute(builder: (context) => MyCartPage()));
//              },
            ),
          ),
          Icon(Icons.favorite_border, size: 30,color: kPrimaryColor,),
          Icon(Icons.shopping_basket, size: 30,color: kPrimaryColor,),
        ],
        onTap: _onItemTap,
//            (index) {
//          //Handle button tap
//          setState(() {
////            _currentIndex = index;
////            _currentPage = _pages[index];
//          });
//        },
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: Color(0xffFDCF09),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/tshart.jfif'),
                      ),
                    ),
                    Text(
                      userName!=null?userName:'name',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                )),
            ListTile(
              leading: Icon(Icons.present_to_all),
              title: Text('All Products',style: TextStyle(fontSize: 18),),
              onTap: () {
                _pageController.jumpToPage(0);
              },
            ),
            Divider(height: 10,),
            ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text('WishList',style: TextStyle(fontSize: 18),),
              onTap: () {
                _pageController.jumpToPage(2);
//                Navigator.of(context).popUntil((route) => route.isFirst);
//                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => WishListPage()));
                // Update the state of the app.
                // ...
              },
            ),
            Divider(height: 10,),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Cart',style: TextStyle(fontSize: 18),),
              onTap: () {
                _pageController.jumpToPage(1);
//                Navigator.of(context).popUntil((route) => route.isFirst);
//                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MyCartPage()));
                // Update the state of the app.
                // ...
              },
            ),
            Divider(height: 10,),
            ListTile(
              leading: Icon(Icons.shopping_basket),
              title: Text('Order List',style: TextStyle(fontSize: 18),),
              onTap: () {
                _pageController.jumpToPage(3);
//                Navigator.of(context).popUntil((route) => route.isFirst);
//                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => OrderListScreen()));
                // Update the state of the app.
                // ...
              },
            ),

//            ListTile(
//              leading: Icon(Icons.),
//              title: Text('Edit Profile',style: TextStyle(fontSize: 18),),
//              onTap: () {
////                Navigator.of(context).popUntil((route) => route.isFirst);
////                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => EditProfile()));
//                // Update the state of the app.
//                // ...
//              },
//            ),
          Divider(height: 10,),
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text(
                "Logout",
                style: TextStyle(color: Colors.black,fontSize: 18),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                //  eraseValue();
              },
            ),
          ],
        ),
      ),
    );
  }

}


