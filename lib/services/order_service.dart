import 'dart:convert';
import 'package:bresil_burger_app_flutter/services/cartService.dart';
import 'package:bresil_burger_app_flutter/services/secure_storage_service.dart';
import 'package:http/http.dart' as http;
import 'package:bresil_burger_app_flutter/constants/app_env.dart';
import 'package:bresil_burger_app_flutter/models/Order.dart';

var API_URL = '${ENV.apiUrl}/orders';

class OrderService {
  static Future<List<Order>> getOrderByClient() async {
    String? user = await SecureStorageService.getAccess();
    //print(user);
    var token = await SecureStorageService.getAccess();
    var uri = Uri.parse('$API_URL/filter/user/6');
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token}',
    });
    if (response.statusCode == 200) {
      var orders =  orderFromJson(response.body);
      //print(response.body);
      return orders;
    } else {
      throw Exception('Failed to load post');
    }
  }


  static Future<Order?> makeOrder() async {
    var carSerice  = CartService();
    var order =carSerice.createOrder();
     Future<String?> token = SecureStorageService.getAccess();
     var t = await token;
    var uri = Uri.parse('$API_URL');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${t}'
    };
    var orderJson = order.toJson();
    var jsono = json.encode(orderJson);
    //print(orderJson);
    var response = await http.post(uri, body: jsono, headers: headers);
    if (response.statusCode == 201) {
      var json = jsonDecode(response.body);
       var order =  Order.fromJson(json);
       print(order);
      return order;
    } else {
      return null;
    }
  }
}
