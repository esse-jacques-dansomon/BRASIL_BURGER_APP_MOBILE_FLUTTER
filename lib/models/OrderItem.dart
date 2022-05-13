

import 'package:bresil_burger_app_flutter/models/product.dart';

class OrderItem {
  int? id;
  double? price;
  int? quantity;
  double? total;
  int? product_id;
  Product? product;

  OrderItem({this.id, this.price, this.quantity, this.total, this.product_id, this.product });

  OrderItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    quantity = json['quantity'];
    total = json['total'];
    product_id = json['product_id'];
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['quantity'] = quantity;
    data['total'] = total;
    data['product_id'] = product_id;
    data['product'] = product;
    return data;
  }
}
