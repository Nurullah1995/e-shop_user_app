
import 'package:ecommerce/screens/ProductDetails/ProductDetails.dart';
import 'package:ecommerce/services/product_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleProduct extends StatefulWidget {
  final String name;
  final int price;
  final String picture;
  final int rating;
  final int productId;
  SingleProduct(
      {@required this.name,
      @required this.price,
      @required this.picture,
      @required this.rating,
      @required this.productId
      });

  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {


  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return Card(
      child: Container(
        height: hp*0.35,
        width: hw*0.45,
        child: InkWell(
          onTap: (){
            getProductDelais(widget.productId).then((response) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductDetailsPage(response['product_details'],widget.picture)),
              );
            });

          },
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Image.network(
                      'http://weaverbd.net/ecommerce-api/'
                      // ignore: unnecessary_brace_in_string_interps
                          '${widget.picture}',
                      fit: BoxFit.fill,
                      height: hp * 0.13,
                      width: double.infinity,
                    ),
//                    IconButton(
//                        icon: Icon(
//                          Icons.favorite,
//                          size: 40,
//                          color: _selectedIndex != null && _selectedIndex == wishListProvider.items
//                              ? Colors.redAccent
//                              : Colors.grey,
//                        ),
//                        onPressed: (){
//                          _onSelected(wishListProvider.items);}),
                         // wishListProvider.addItemsToWishList(widget.)

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: Text(
                    widget.name,
                    style:GoogleFonts.josefinSans(fontSize: 22,fontWeight: FontWeight.bold,color:Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  '${widget.price.toString()}',
                  style:GoogleFonts.comfortaa (
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ),
              StarRating(
                starCount: 5,
                rating: 1,
                color: Colors.yellow,
                size: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
