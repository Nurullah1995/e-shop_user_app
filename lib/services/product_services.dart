import 'dart:async' show Future;
import 'dart:convert';
import 'dart:io';
import 'package:ecommerce/SharePrefarenc/PrefarenceToken.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/model/AddToCartModel.dart';
import 'package:ecommerce/model/CategoryWiseProductModel.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/util/constants_config.dart';
import 'package:http/http.dart' as http;

Future<List<AllProductFetchModel>> getProduct() async {
  var token = await getValue();
//  print(getValue());
  final response = await http.get('http://weaverbd.net/ecommerce-api/api/v1/all-product-show',
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
  // print('Bearer $token');
  var  jdata = jsonDecode(response.body);
  return (jdata as List).map((p) =>AllProductFetchModel.fromJson(p)).toList();
}


Future<Map<String,dynamic>> getProductDelais(int productId) async {
  var token = await getValue();
//  print(getValue());
  final response = await http.get('http://weaverbd.net/ecommerce-api/api/v1/product-details/$productId',
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
  // print('Bearer $token');
  Map<String,dynamic>  jdata = jsonDecode(response.body);
  //var  product = ProductDetails.fromJson(jdata['product_details']);
  return jdata;
}

Future<List<CategoryWiseProductList>> getSingleCategoryProduct(int CategoryId) async {
  var token = await getValue();
//  print(getValue());
  final response = await http.get('http://weaverbd.net/ecommerce-api/api/v1/category-wise-product/$CategoryId',
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
  // print('Bearer $token');
  var  jdata = jsonDecode(response.body);
  return (jdata as List).map((p) =>CategoryWiseProductList.fromJson(p)).toList();
}


