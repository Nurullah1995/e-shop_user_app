import 'dart:io';
import 'package:ecommerce/SharePrefarenc/PrefarenceToken.dart';
import 'package:ecommerce/data/CreateID.dart';
import 'package:ecommerce/data/CreateID_response.dart';
import 'package:ecommerce/data/login.dart';
import 'package:ecommerce/data/login_response.dart';
import 'package:ecommerce/util/constants_config.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

//Login user with username and password
Future<Response> _login(Login loginInfo) async {
  return await http.post(
    '${Constants.url}/login',
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    },
    body: loginToJson(loginInfo),
  );
}

Future<LoginResponse> login(Login loginInfo) async {
  final response = await _login(loginInfo);

  return loginResponseFromJson(response.body);
}
///////////////////////// close login service////////////////////////
/////////////////////////Start Signup service///////////////////////

Future<Response> _createid(CreateID createidinfo) async {
  return await http.post(
    'http://weaverbd.net/ecommerce-api/api/v1/regi',
      headers:{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    body: createidToJson(createidinfo),
  );
}

Future<CreateID_Response> createid(CreateID createidInfo) async {
  final response = await _createid(createidInfo);

  return createidResponseFromJson(response.body);
}

////////////////////////Close Signup Service ///////////////////////////
