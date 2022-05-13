import 'dart:convert';
import 'package:bresil_burger_app_flutter/models/User.dart';

AuthInformation AuthInformationFromJson(String str) => AuthInformation.fromJson(json.decode(str));

String AuthInformationToJson(AuthInformation data) => json.encode(data.toJson());

class AuthInformation {
  AuthInformation({
    required this.access,
    required this.refresh,
    required this.user,
  });

  final String access;
  final String refresh;
  final User user;

  factory AuthInformation.fromJson(Map<String, dynamic> json) => AuthInformation(
    access: json["access"],
    refresh: json["refresh"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "access": access,
    "refresh": refresh,
    "user": user.toJson(),
  };



}