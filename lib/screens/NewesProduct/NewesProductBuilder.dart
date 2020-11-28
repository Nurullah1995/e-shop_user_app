import 'package:ecommerce/data/HomePageTestData.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/services/product_services.dart';
import 'package:ecommerce/widgets/Home/SingleProduct.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewesProdutGridBuilder extends StatelessWidget {
//  HomePageTestData homePageTestData = HomePageTestData();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AllProductFetchModel>>(
        future: getProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error");
            }

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (_, index) =>  SingleProduct(
                picture: snapshot.data[index].productImage,
                price: snapshot.data[index].regularPrice,
                name: snapshot.data[index].productName,
                rating: snapshot.data[index].rating,
                productId: snapshot.data[index].id,
              ),
              itemCount: snapshot.data.length,
            );
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        });
  }
}
