import 'dart:convert';

CreateID_Response createidResponseFromJson(String str) =>
    CreateID_Response.fromJson(json.decode(str));

String createidResponseToJson(CreateID_Response data) =>
    json.encode(data.toJson());

class CreateID_Response {
  // ignore: non_constant_identifier_names
  String access_token;

  CreateID_Response({
    // ignore: non_constant_identifier_names
    this.access_token,
  });

  factory CreateID_Response.fromJson(Map<String, dynamic> json) =>
      CreateID_Response(
        access_token: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": access_token,
      };
}
