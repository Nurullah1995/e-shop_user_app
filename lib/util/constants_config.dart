import 'package:ecommerce/SharePrefarenc/PrefarenceToken.dart';
import 'package:flutter/material.dart';

class Constants {
  static final List<String> namesList = [
    "Product",
    "Category",
    "Orders",
    "Notifications",
    "Users",
    "My Profile"
  ];
  static final List<IconData> iconsList = [
    Icons.archive,
    Icons.category,
    Icons.shopping_cart,
    Icons.notifications,
    Icons.people,
    Icons.person
  ];
  static final double primaryTextSize = 18.00;
  static final double normalTextSize = 14.00;
  static final double primaryTitleSize = 24.00;
  static final String url = "http://weaverbd.net/ecommerce-api/api/v1";
  static final String productUrl = "http://weaverbd.net/ecommerce-api/";
  static final List<Widget> dasbordPagelist = [];
}
