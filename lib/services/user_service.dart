import 'dart:convert';
import 'dart:io';
import 'package:ecommerce/SharePrefarenc/PrefarenceToken.dart';
import 'package:ecommerce/data/user.dart';
import 'package:ecommerce/util/constants_config.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<User> userProfile() async {
  var token = await getValue();
  final response = await http.post('http://weaverbd.net/ecommerce-api/api/v1/me',
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"});

  if (response.statusCode == 200) {
    return User.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

//Future<http.Response> updateProfile(String name, String email, String phone) async {
//  var token = await getValue();
//  return http.put(
//    '${Constants.url}/registration/1',
//    headers: <String, String>{
//      HttpHeaders.authorizationHeader: "Bearer $token",
//      'Content-Type': 'application/json; charset=UTF-8',
//    },
//    body: jsonEncode(<String, String>{
//      'name': name,
//      'email': email,
//      'phone': phone,
//    }),
//  );
//}
