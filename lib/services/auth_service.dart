import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:bresil_burger_app_flutter/models/AuthInformation.dart';
import 'package:bresil_burger_app_flutter/constants/app_env.dart';

const apiUrl = '${ENV.apiUrl}/auth';
class AuthService {

  static Future<AuthInformation?> login(String email, String password) async {
    var url = '$apiUrl/login';
    var uri = Uri.parse(url);
    final json0 =  json.encode({
      "login": email,
      "password": password
    });
    var response = await http.post(uri, body: json0, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return AuthInformation.fromJson(json);
    }
    return null;
  }


  static Future<AuthInformation?> register(String email, String password, String username, int phone) async {
    var url = '${ENV.apiUrl}/clients';
    var uri = Uri.parse(url);
    final infos =  json.encode({
      "username": username.toString(),
      "email": email.toString().toLowerCase(),
      "phone": phone.toString(),
      "password": password,
    });
    final headers= {'Content-Type': 'application/json'};
    var response = await http.post(uri, body: infos, headers: headers);
    if (response.statusCode == 201) {
      var json = jsonDecode(response.body);
      return AuthInformation.fromJson(json);
    }
    return null;
  }



}