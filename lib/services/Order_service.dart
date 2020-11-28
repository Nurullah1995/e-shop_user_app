import 'package:ecommerce/SharePrefarenc/PrefarenceToken.dart';
import 'package:ecommerce/model/Order/OrderListModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
Future<List<OrderListModel>> fetchOrderList() async {
  var token=await getValue();
  http.Response response = await http.get(
      'http://weaverbd.net/ecommerce-api/api/v1/order/list',
      headers:{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }
  );
  var responseJson = json.decode(response.body);
  print(responseJson);
  return (responseJson  as List)
      .map((p) => OrderListModel.fromJson(p))
      .toList();
}


Future<Map<String,dynamic>> addShippingAddress(String shippingAddress,String phoneNo, int totalAmount,String shippingdate,String paymentMethod,List productList ) async {
  var token = await getValue();
  final http.Response response = await http.post(
    'http://weaverbd.net/ecommerce-api/api/v1/order',
    headers:{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(<String, dynamic>{
      'shipping_address': shippingAddress,
      'shipping_contact_number': phoneNo,
      "order_status":"running",
      "total_amount":totalAmount,
      'shipping_date': shippingdate,
      'payment_method': paymentMethod,
      "order_details":productList,

    }),
  );
  if (response.statusCode == 200) {
    return (json.decode(response.body));

  } else {
    throw Exception('Failed to add Shipping Address.');
  }
}



Future<Map<String,dynamic>> getOrderDetails(int ordereId) async {
  var token = await getValue();
//  print(getValue());
  final response = await http.get('http://weaverbd.net/ecommerce-api/api/v1/order/details/$ordereId',
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
  // print('Bearer $token');
  Map<String,dynamic>  jdata = jsonDecode(response.body);
  //var  product = ProductDetails.fromJson(jdata['product_details']);
  return jdata;
}