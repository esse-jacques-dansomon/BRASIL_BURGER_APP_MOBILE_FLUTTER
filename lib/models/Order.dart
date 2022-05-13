import 'dart:convert';

import './User.dart';
import './OrderItem.dart';
import './Payment.dart';
List<Order>  orderFromJson(String str) => List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String oderToJson(List<Order> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
  User? client;
  String? createdAt;
  int? customerId;
  int? id;
  String? moreInformation;
  List<OrderItem>? orderItems;
  Payment? payment;
  String? status;
  double? total;
  String? updatedAt;

  Order(
      {this.client,
      this.createdAt,
      this.customerId,
      this.id,
      this.moreInformation,
      this.orderItems,
      this.payment,
      this.status,
      this.total,
      this.updatedAt});

  Order.fromJson(Map<String, dynamic> json) {
    client = json['client'] != null ? User.fromJson(json['client']) : null;
    createdAt = json['created_at'];
    customerId = json['customer_id'];
    id = json['id'];
    moreInformation = json['more_information'];
    if (json['order_items'] != null) {
      orderItems = <OrderItem>[];
      json['order_items'].forEach((v) {
        orderItems!.add(OrderItem.fromJson(v));
      });
    }
    payment =
        json['payment'] != null ? Payment.fromJson(json['payment']) : null;
    status = json['status'];
    total = json['total'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (client != null) {
      data['client'] = client!.toJson();
    }
    data['created_at'] = createdAt;
    data['customer_id'] = customerId;
    data['id'] = id;
    data['more_information'] = moreInformation;
    if (orderItems != null) {
      data['order_items'] = orderItems!.map((v) => v.toJson()).toList();
    }
    if (payment != null) {
      data['payment'] = payment!.toJson();
    }
    data['status'] = status;
    data['total'] = total;
    data['updated_at'] = updatedAt;
    return data;
  }
}
