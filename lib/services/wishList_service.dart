import 'dart:convert';
import 'dart:io';
import 'package:ecommerce/SharePrefarenc/PrefarenceToken.dart';
import 'package:ecommerce/model/Wishlist/WishListModel.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<Map<String,dynamic>> addWishList(int productId) async {
  var token = await getValue();
  final http.Response response = await http.post(
    'http://weaverbd.net/ecommerce-api/api/v1/wish-list',
    headers:{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(<String, dynamic>{

      'product_id': productId,

    }),
  );
  if (response.statusCode == 201) {
    return (json.decode(response.body));

  } else {
    throw Exception('Failed to create album.');
  }
}



Future<List<WishListModel>> getWishList() async {
  var token = await getValue();
//  print(getValue());
  final response = await http.get('http://weaverbd.net/ecommerce-api/api/v1/wish-list',
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
  // print('Bearer $token');
  var  jdata = jsonDecode(response.body);
  return (jdata as List).map((p) =>WishListModel.fromJson(p)).toList();
}

Future<Map<String,dynamic>> deleteWishlist(String id) async {
  var token = await getValue();
  final http.Response response = await http.delete(
    'http://weaverbd.net/ecommerce-api/api/v1/delete-wish-list/$id',
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
  );
   var jresponse=jsonDecode(response.body);
  return jresponse;
}