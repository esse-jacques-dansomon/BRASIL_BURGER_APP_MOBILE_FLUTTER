import 'dart:convert';
import 'package:bresil_burger_app_flutter/constants/app_env.dart';
import 'package:bresil_burger_app_flutter/models/Menu.dart';
import 'package:http/http.dart' as http;
const url = '${ENV.apiUrl}/menus';

class MenuService {
  static Future<List<Menu>> getMenus() async {
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var data = response.body;
      var complementsJson = json.decode(data);
      return MenuFromJson(complementsJson);
    } else {
      throw Exception('Failed to load complements');
    }
  }
}