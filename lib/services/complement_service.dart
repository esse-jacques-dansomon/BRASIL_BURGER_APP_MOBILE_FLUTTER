import 'dart:convert';
import 'package:bresil_burger_app_flutter/constants/app_env.dart';
import 'package:bresil_burger_app_flutter/models/Complement.dart';
import 'package:http/http.dart' as http;
 const url = '${ENV.apiUrl}/complements';

class ComplementService {
  static Future<List<Complement>> getComplements() async {
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var data = response.body;
      print(data);
      var complementsJson = json.decode(data);
      var complements = ComplementFromJson(complementsJson);
      return complements;
    } else {
      throw Exception('Failed to load complements');
    }
  }
}