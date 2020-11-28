import 'dart:convert';

String createidToJson(CreateID data) => json.encode(data.toJson());

class CreateID {
  String name;
  String email;
  String password;
  String password_confirmation;
  String phone;

  CreateID({
    this.name,
    this.email,
    this.password,
    this.password_confirmation,
    this.phone,
  });

  factory CreateID.fromJson(Map<String, dynamic> json) => CreateID(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        password_confirmation: json["password_confirmation"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": password_confirmation,
        "phone": phone,
      };
}
