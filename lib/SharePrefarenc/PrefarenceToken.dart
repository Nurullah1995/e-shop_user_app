import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> setValue(String access_token) async {
  SharedPreferences myprefarence = await SharedPreferences.getInstance();
  myprefarence.setString('access_token', access_token);

  //print("access:${access_token}");
}

Future<void> eraseValue() async {
  SharedPreferences myprefarence = await SharedPreferences.getInstance();
  myprefarence.setString('access_token', null);
  //myprefarence.clear();

  //print("access:${access_token}");
}

Future<String> getValue() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final String toKen = sharedPreferences.getString('access_token');
  // print('Getting Token: $toKen');
  return toKen;
}
