// To parse this JSON data, do
//
//     final categoryWiseProductList = categoryWiseProductListFromJson(jsonString);

import 'dart:convert';

List<CategoryWiseProductList> categoryWiseProductListFromJson(String str) => List<CategoryWiseProductList>.from(json.decode(str).map((x) => CategoryWiseProductList.fromJson(x)));

String categoryWiseProductListToJson(List<CategoryWiseProductList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryWiseProductList {
  CategoryWiseProductList({
    this.id,
    this.productName,
    this.productDescription,
    this.categoryId,
    this.colorId,
    this.sizeId,
    this.regularPrice,
    this.salePrice,
    this.quantity,
    this.ratting,
    this.productImage,
    this.flag,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String productName;
  String productDescription;
  int categoryId;
  int colorId;
  int sizeId;
  int regularPrice;
  int salePrice;
  int quantity;
  int ratting;
  String productImage;
  int flag;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  factory CategoryWiseProductList.fromJson(Map<String, dynamic> json) => CategoryWiseProductList(
    id: json["id"],
    productName: json["product_name"],
    productDescription: json["product_description"],
    categoryId: json["category_id"],
    colorId: json["color_id"],
    sizeId: json["size_id"],
    regularPrice: json["regular_price"],
    salePrice: json["sale_price"],
    quantity: json["quantity"],
    ratting: json["ratting"],
    productImage: json["product_image"],
    flag: json["flag"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_name": productName,
    "product_description": productDescription,
    "category_id": categoryId,
    "color_id": colorId,
    "size_id": sizeId,
    "regular_price": regularPrice,
    "sale_price": salePrice,
    "quantity": quantity,
    "ratting": ratting,
    "product_image": productImage,
    "flag": flag,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
