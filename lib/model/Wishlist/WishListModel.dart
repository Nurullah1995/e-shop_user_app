// To parse this JSON data, do
//
//     final wishListModel = wishListModelFromJson(jsonString);

import 'dart:convert';

List<WishListModel> wishListModelFromJson(String str) => List<WishListModel>.from(json.decode(str).map((x) => WishListModel.fromJson(x)));

String wishListModelToJson(List<WishListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WishListModel {
  WishListModel({
    this.wishlisId,
    this.productId,
    this.productName,
    this.productImage,
    this.price,
    this.links,
  });
  int wishlisId;
  int productId;
  String productName;
  String productImage;
  int price;
  String links;

  factory WishListModel.fromJson(Map<String, dynamic> json) => WishListModel(
    wishlisId: json["wishlist_id"],
    productId: json["product_id"],
    productName: json["product_name"],
    productImage: json["product_image"],
    price: json["price "],
    links: json["links"],
  );

  Map<String, dynamic> toJson() => {
    "wishlist_id": wishlisId,
    "product_id": productId,
    "product_name": productName,
    "product_image": productImage,
    "price ": price,
    "links": links,
  };
}
