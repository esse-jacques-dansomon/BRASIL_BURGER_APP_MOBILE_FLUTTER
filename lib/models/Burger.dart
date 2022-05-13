// To parse this JSON data, do
//
//     final Burger = BurgerFromJson(jsonString);

import 'dart:convert';

import 'package:bresil_burger_app_flutter/constants/app_env.dart';
import 'package:bresil_burger_app_flutter/models/product.dart';
List<Burger> BurgerFromJson(String str) => List<Burger>.from(json.decode(str).map((x) => Burger.fromJson(x)));

String BurgerToJson(List<Burger> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Burger extends Product{
  Burger({
    required this.cookTime,
    required this.description,
    required this.id,
    required this.image,
    required this.isAvailable,
    required this.isFeatured,
    required this.isOfferOfTheDay,
    required this.isPopular,
    required this.name,
    required this.price,
    required this.productType,
    required this.slug,
  }) :super(
    id: id,
    name: name,
    price: price,
    image: image,
    description: description,
    slug: slug,
    isAvailable: isAvailable,
    productType: productType,
    isFeatured: isFeatured,
    isOfferOfTheDay: isOfferOfTheDay,
    isPopular: isPopular,
  );

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

  factory Burger.fromJson(Map<String, dynamic> json) => Burger(
    cookTime: json["cook_time"],
    description: json["description"],
    id: json["id"],
    image: '${ENV.apiUrl}/' + json["image"],
    isAvailable: json["is_available"],
    isFeatured: json["is_featured"],
    isOfferOfTheDay: json["is_offer_of_the_day"],
    isPopular: json["is_popular"],
    name: json["name"],
    price: json["price"],
    productType: json["product_type"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "cook_time": cookTime,
    "description": description,
    "id": id,
    "image": image,
    "is_available": isAvailable,
    "is_featured": isFeatured,
    "is_offer_of_the_day": isOfferOfTheDay,
    "is_popular": isPopular,
    "name": name,
    "price": price,
    "product_type": productType,
    "slug": slug,
  };
}
