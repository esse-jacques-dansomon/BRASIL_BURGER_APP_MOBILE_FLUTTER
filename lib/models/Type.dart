// To parse this JSON data, do
//
//     final TypeComplement = TypeComplementFromJson(jsonString);

import 'dart:convert';

import 'package:bresil_burger_app_flutter/constants/app_env.dart';

List<TypeComplement> TypeComplementFromJson(String str) => List<TypeComplement>.from(json.decode(str).map((x) => TypeComplement.fromJson(x)));

String TypeComplementToJson(List<TypeComplement> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TypeComplement {
  TypeComplement({
    required this.description,
    required this.id,
    required this.image,
    required this.name,
    required this.slug,
  });

  String description;
  int id;
  String image;
  String name;
  String slug;

  factory TypeComplement.fromJson(Map<String, dynamic> json) => TypeComplement(
    description: json["description"],
    id: json["id"],
    image: '${ENV.apiUrl}/' + json["image"],
    name: json["name"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "id": id,
    "image": image,
    "name": name,
    "slug": slug,
  };
}
