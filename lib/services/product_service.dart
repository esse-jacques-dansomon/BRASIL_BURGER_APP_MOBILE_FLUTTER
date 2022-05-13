import 'package:bresil_burger_app_flutter/constants/app_env.dart';
import 'package:bresil_burger_app_flutter/models/product.dart';
import 'package:http/http.dart' as http;

var url = '${ENV.apiUrl}/products';

class ProductService {
  static Future<List<Product>?> getPopularProducts() async {
    var urll = "$url/popular";
    var uri = Uri.parse(urll);
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      var ps =  ProductFromJson(response.body);
      print(ps);
      return ProductFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<List<Product>?> getFeaturedProducts() async {
    var urll = "$url/featured";
    var uri = Uri.parse(urll);
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      //return response.body List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));;

      return ProductFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<List<Product>?> getMenuOfTheDay() async {
    var urll = "$url/menu_of_the_day";
    var uri = Uri.parse(urll);
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      print(response.body);
      return ProductFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<List<Product>?> getProducts() async {
    var urll = "$url";
    var uri = Uri.parse(urll);
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      print(response.body);
      return ProductFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<List<Product>?> getMenus() async {
    var urll = "$url/menus";
    var uri = Uri.parse(urll);
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      print(response.body);
      return ProductFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<List<Product>?> getComplements() async {
    var urll = "$url/complements";
    var uri = Uri.parse(urll);
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      print(response.body);
      return ProductFromJson(response.body);
    } else {
      return null;
    }
  }

}