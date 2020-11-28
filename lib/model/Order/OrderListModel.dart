// To parse this JSON data, do
//
//     final orderListModel = orderListModelFromJson(jsonString);

import 'dart:convert';

List<OrderListModel> orderListModelFromJson(String str) => List<OrderListModel>.from(json.decode(str).map((x) => OrderListModel.fromJson(x)));

String orderListModelToJson(List<OrderListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderListModel {
  OrderListModel({
    this.id,
    this.totalAmount,
    this.paymentMethod,
    this.orderStatus,
    this.userName,
    this.links,
  });

  int id;
  int totalAmount;
  String paymentMethod;
  String orderStatus;
  String userName;
  String links;

  factory OrderListModel.fromJson(Map<String, dynamic> json) => OrderListModel(
    id: json["id"],
    totalAmount: json["total_amount"],
    paymentMethod: json["payment_method"],
    orderStatus: json["order_status"],
    userName: json["user name"],
    links: json["links"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "total_amount": totalAmount,
    "payment_method": paymentMethod,
    "order_status": orderStatus,
    "user name": userName,
    "links": links,
  };
}
