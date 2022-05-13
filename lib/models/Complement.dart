// To parse this JSON data, do
//
//     final Complement = ComplementFromJson(jsonString);

import 'dart:convert';

import 'package:bresil_burger_app_flutter/constants/app_env.dart';
import 'package:bresil_burger_app_flutter/models/Type.dart';
import 'package:bresil_burger_app_flutter/models/product.dart';

List<Complement> ComplementFromJson(String str) => List<Complement>.from(json.decode(str).map((x) => Complement.fromJson(x)));

String ComplementToJson(List<Complement> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Complement  extends Product{
  Complement({
    required this.description,
    required this.id,
    required this.image,
    required this.isAvailable,
    required this.isFeatured,
    required this.isOfferOfTheDay,
    required this.isPopular,
    required this.name,
    required this.price,
    required this.slug,
    required this.type,
    required this.typeId,
    required this.productType,
  }):super(
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

  String ?description;
  int ?id;
  String ?image;
  bool ?isAvailable;
  bool ?isFeatured;
  bool ?isOfferOfTheDay;
  bool ?isPopular;
  String ?productType;
  String ?name;
  double ?price;
  String ?slug;
  TypeComplement type;
  int typeId;

  factory Complement.fromJson(Map<String, dynamic> json) => Complement(
    description: json["description"],
    id: json["id"],
    image: '${ENV.apiUrl}/' + json["image"],
    isAvailable: json["is_available"],
    isFeatured: json["is_featured"],
    isOfferOfTheDay: json["is_offer_of_the_day"],
    isPopular: json["is_popular"],
    name: json["name"],
    price: json["price"],
    slug: json["slug"],
    type: TypeComplement.fromJson(json["type"]),
    typeId: json["type_id"],
    productType: json["product_type"],
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "id": id,
    "image": image,
    "is_available": isAvailable,
    "is_featured": isFeatured,
    "is_offer_of_the_day": isOfferOfTheDay,
    "is_popular": isPopular,
    "name": name,
    "price": price,
    "slug": slug,
    "type": type.toJson(),
    "type_id": typeId,
    "product_type": productType,
  };
}