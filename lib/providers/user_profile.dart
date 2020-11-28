import 'package:ecommerce/data/user.dart';
import 'package:flutter/material.dart';

class UserProfileProvider extends ChangeNotifier{
  String _userName = "";

  void setDisplayText(String text) {
    _userName = text;
    //notifyListeners();
    print(_userName);
  }

  String get userName => _userName;

}