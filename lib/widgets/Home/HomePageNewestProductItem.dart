import 'package:ecommerce/data/HomePageTestData.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/services/product_services.dart';
import 'package:ecommerce/widgets/Home/SingleProduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class NewestProductItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AllProductFetchModel>>(
        future: getProduct(),
        builder: (context, snapshot) {
          //snapshot.connectionState == ConnectionState.done
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Data not found");
            }
            return ListView.builder(
              itemCount: snapshot.data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext contextd, int index) => SingleProduct(
                picture: snapshot.data[index].productImage,
                price: snapshot.data[index].regularPrice,
                name: snapshot.data[index].productName,
                rating: snapshot.data[index].rating,
                productId: snapshot.data[index].id,
              ),
            );
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        });
  }
}
