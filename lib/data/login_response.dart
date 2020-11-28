import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  String access_token;

  LoginResponse({
    this.access_token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        access_token: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": access_token,
      };
}
