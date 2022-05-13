// To parse this JSON data, do
//
//     final Product = ProductFromJson(jsonString);

import 'dart:convert';

import 'package:bresil_burger_app_flutter/constants/app_env.dart';

List<Product> ProductFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String ProductToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.cookTime,
    this.description,
    this.id,
    this.image,
    this.isAvailable,
    this.isFeatured,
    this.isOfferOfTheDay,
    this.isPopular,
    this.name,
    this.price,
    this.productType,
    this.slug,
  });

  int ?cookTime;
  String ?description;
  int ?id;
  String ?image;
  bool ?isAvailable;
  bool ?isFeatured;
  bool ?isOfferOfTheDay;
  bool ?isPopular;
  String ?name;
  double ?price;
  String ?productType;
  String ?slug;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    cookTime: json["cook_time"] == null ? null : json["cook_time"],
    description: json["description"] == null ? null : json["description"],
    id: json["id"] == null ? null : json["id"],
    image: json["image"] == null ? null : "${ENV.apiUrl}/" + json["image"],
    isAvailable: json["is_available"] == null ? null : json["is_available"],
    isFeatured: json["is_featured"] == null ? null : json["is_featured"],
    isOfferOfTheDay: json["is_offer_of_the_day"] == null ? null : json["is_offer_of_the_day"],
    isPopular: json["is_popular"] == null ? null : json["is_popular"],
    name: json["name"] == null ? null : json["name"],
    price: json["price"] == null ? null : json["price"],
    productType: json["product_type"] == null ? null : json["product_type"],
    slug: json["slug"] == null ? null : json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "cook_time": cookTime == null ? null : cookTime,
    "description": description == null ? null : description,
    "id": id == null ? null : id,
    "image": image == null ? null : image,
    "is_available": isAvailable == null ? null : isAvailable,
    "is_featured": isFeatured == null ? null : isFeatured,
    "is_offer_of_the_day": isOfferOfTheDay == null ? null : isOfferOfTheDay,
    "is_popular": isPopular == null ? null : isPopular,
    "name": name == null ? null : name,
    "price": price == null ? null : price,
    "product_type": productType == null ? null : productType,
    "slug": slug == null ? null : slug,
  };
}
