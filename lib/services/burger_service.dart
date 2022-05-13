import 'dart:convert';
import 'package:bresil_burger_app_flutter/models/Burger.dart';
import 'package:http/http.dart' as http;
import '../constants/app_env.dart';
var url = '${ENV.apiUrl}/burgers';

class BurgerService {
  static Future<List<Burger>> getBurgers() async {
    var uri = Uri.parse(url);
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
     return BurgerFromJson(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }


  static Future<Burger> getBurger(int id) async {
    var uri = Uri.parse('$url/$id');
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      return Burger.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

}