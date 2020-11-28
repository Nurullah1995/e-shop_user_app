import 'package:ecommerce/model/CategoryWiseProductModel.dart';
import 'package:ecommerce/services/product_services.dart';
import 'package:flutter/material.dart';

import 'SingleProduct.dart';
class CategoryWiseProductBulider extends StatelessWidget {
  final int categoryid;
  CategoryWiseProductBulider(this.categoryid);
//  HomePageTestData homePageTestData = HomePageTestData();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryWiseProductList>>(
        future: getSingleCategoryProduct(categoryid),
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
                rating: snapshot.data[index].ratting,
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