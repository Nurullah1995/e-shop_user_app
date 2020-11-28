import 'package:ecommerce/SharePrefarenc/PrefarenceToken.dart';
import 'package:ecommerce/data/login.dart';
import 'package:ecommerce/data/login_response.dart';
import 'package:ecommerce/services/auth_services.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String _token;

  get token => _token;

  void loginWithEmail(Login loginInfo) {
    login(loginInfo).then((loginResponse) {
      _token = loginResponse.access_token;

      notifyListeners();
    });
  }
}
