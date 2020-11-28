// To parse this JSON data, do
//
//     final allProductFetchModel = allProductFetchModelFromJson(jsonString);

import 'dart:convert';

List<AllProductFetchModel> allProductFetchModelFromJson(String str) => List<AllProductFetchModel>.from(json.decode(str).map((x) => AllProductFetchModel.fromJson(x)));

String allProductFetchModelToJson(List<AllProductFetchModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllProductFetchModel {
  AllProductFetchModel({
    this.id,
    this.productName,
    this.productImage,
    this.regularPrice,
    this.salePrice,
    this.rating,
    this.links,
  });

  int id;
  String productName;
  String productImage;
  int regularPrice;
  dynamic salePrice;
  int rating;
  String links;

  factory AllProductFetchModel.fromJson(Map<String, dynamic> json) => AllProductFetchModel(
    id: json["id"],
    productName: json["product name"],
    productImage: json["product image"],
    regularPrice: json["regular price "],
    salePrice: json["sale price"],
    rating: json["rating "],
    links: json["links"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product name": productName,
    "product image": productImage,
    "regular price ": regularPrice,
    "sale price": salePrice,
    "rating ": rating,
    "links": links,
  };
}
