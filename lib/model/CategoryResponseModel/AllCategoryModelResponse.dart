// To parse this JSON data, do
//
//     final allCategoryModel = allCategoryModelFromJson(jsonString);

import 'dart:convert';

AllCategoryModel allCategoryModelFromJson(String str) => AllCategoryModel.fromJson(json.decode(str));

String allCategoryModelToJson(AllCategoryModel data) => json.encode(data.toJson());

class AllCategoryModel {
  AllCategoryModel({
    this.message,
    this.categorye,
  });

  String message;
  List<Categorye> categorye;

  factory AllCategoryModel.fromJson(Map<String, dynamic> json) => AllCategoryModel(
    message: json["message"],
    categorye: List<Categorye>.from(json["categorye"].map((x) => Categorye.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "categorye": List<dynamic>.from(categorye.map((x) => x.toJson())),
  };
}

class Categorye {
  Categorye({
    this.id,
    this.categoryName,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String categoryName;
  DateTime createdAt;
  DateTime updatedAt;

  factory Categorye.fromJson(Map<String, dynamic> json) => Categorye(
    id: json["id"],
    categoryName: json["category_name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_name": categoryName,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}