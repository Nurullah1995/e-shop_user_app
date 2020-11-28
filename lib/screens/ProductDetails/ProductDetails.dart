import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/providers/AddToCart.dart';
import 'package:ecommerce/screens/MyCart/MyCartPage.dart';
import 'package:ecommerce/services/wishList_service.dart';
import 'package:ecommerce/widgets/ProductDetails/AnimitedExpanded.dart';
import 'package:ecommerce/widgets/ProductDetails/SingleItemColor.dart';
import 'package:ecommerce/widgets/ProductDetails/SingleItemSize.dat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {

  Map<String,dynamic> productDetails;
  final String image;
  ProductDetailsPage(this.productDetails,this.image);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetailsPage> {
  bool _isFavorited = false;


  _getProductAvailability(int quantityData){
    int pQuantity=quantityData;
    if(pQuantity>0){
      String result='In Stock';
      return result;
    }
    else{
      String result='Out Of Stock';
      return result;
    }
  }

  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    var cartProvider = Provider.of<AddToCartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 15.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        // automaticallyImplyLeading: false, // Don't show the leading button
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Badge(
                  showBadge:cartProvider.items>0,
                  position: BadgePosition(bottom: 0,),
                  badgeContent: Text(
                    '${cartProvider.items}',
                    style: TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: (){
                    },
                  ),
                ),

                IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ],
            )
            // Your widgets here
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          CarouselSlider(
            items: <Widget>[
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Image.network(
                    'http://weaverbd.net/ecommerce-api/'
                    // ignore: unnecessary_brace_in_string_interps
                        '${widget.image}',
                    height: hp * 0.3,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20,right: 20),
                    child:_isFavorited? IconButton(
                      icon: Icon(
                        Icons.favorite,
                        size: 25,
                        color: Colors.redAccent,
                      ),
                      onPressed: () {
                        setState(() {
                          if (_isFavorited) {
                            _isFavorited = false;
                            print(_isFavorited);
                          } else {
                            _isFavorited = true;
                            print(_isFavorited);
                            print(widget.productDetails['id']);
                            addWishList(widget.productDetails['id']);
                          }
                        });
                      },
                    ) :
                    IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        size: 25,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          if (_isFavorited) {
                            _isFavorited = false;
                            print(_isFavorited);
                          } else {
                            _isFavorited = true;
                            print(_isFavorited);
                            print(widget.productDetails['id']);
                            addWishList(widget.productDetails['id']);
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
            options: CarouselOptions(
              autoPlay: false,
              aspectRatio: 2.0,
              autoPlayInterval: Duration(seconds: 3),
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 700),
              autoPlayCurve: Curves.fastOutSlowIn,
              viewportFraction: 1.0,
            ),
          ),
          SafeArea(
            minimum: EdgeInsets.all(10),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.productDetails['product_name'],
                        style:GoogleFonts.comfortaa( fontSize: 18,color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text('Category : '),
                          Text(' ${widget.productDetails['category_name']}',style:GoogleFonts.comfortaa( fontSize: 18,color: Colors.red, fontWeight: FontWeight.bold),)
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              '\$${widget.productDetails['sale_price']}',
                              style:GoogleFonts.comfortaa( fontSize: 25,color: Colors.red,),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '\$${widget.productDetails['regular_price']}',
                              style:GoogleFonts.comfortaa( fontSize: 18,color: Colors.black,decoration: TextDecoration.lineThrough),
                            ),
                          ],
                        ),
                      ),
                      StarRating(
                        size: 18,
                        starCount: 5,
                        rating:4,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: <Widget>[
                      Text(
                        'Availability :',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        _getProductAvailability(widget.productDetails['quantity']),
                        //_getProductAvailability(),
                        style:GoogleFonts.comfortaa( fontSize: 23,color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Add To Cart",
                            style:GoogleFonts.comfortaa( fontSize: 18,color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        color: kPrimaryColor,
                        onPressed: () {
                          setState(() {
                          //  cartProvider.increment();
                           // cartProvider.checkDuplicateCartList(widget.productDetails['id']);
                            cartProvider.addItemsToCart(widget.productDetails);
                          });
                        //cartProvider.addTotalPrice();

                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                  cartProvider.decrementCount();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12)),
                                child: Icon(Icons.remove),
                                height: 40,
                                width: 60,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12)),
                              child: Center(child: Text(
                                cartProvider.count.toString(),
                              )),
                              height: 40,
                              width: 60,
                            ),
                            InkWell(
                              onTap: () {
                                 cartProvider.incrementCount();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12)),
                                child: Icon(Icons.add),
                                height: 40,
                                width: 60,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  DemoPage(widget.productDetails['product_description']),
                  Text(
                    'Color',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    height: 50,
                    width: 400,
                    child: SigleItemColorSize(widget.productDetails['color_name']),
                  ),
                  Text(
                    'Size',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    height: 50,
                    width: 400,
                    child: SigleItemSize(widget.productDetails['size_name']),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}

