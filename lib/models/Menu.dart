import 'package:bresil_burger_app_flutter/constants/app_env.dart';
import 'package:bresil_burger_app_flutter/models/Burger.dart';
import 'package:bresil_burger_app_flutter/models/Complement.dart';
import 'package:bresil_burger_app_flutter/models/product.dart';
import 'dart:convert';

List<Menu> MenuFromJson(String str) => List<Menu>.from(json.decode(str).map((x) => Menu.fromJson(x)));

String MenuToJson(List<Menu> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Menu  extends Product{
  Menu({
     this.burger,
     this.burgerId,
     this.complements,
     this.cookTime,
     this.description,
     this.id,
     this.image,
     this.isAvailable,
     this.isFeatured,
     this.isOfferOfTheDay,
     this.isPopular,
     this.listComplementsId,
     this.name,
     this.price,
     this.slug,
    this.productType,

  }): super(
    id: id,
    name: name,
    price: price,
    image: image,
    description: description,
    slug: slug,
    productType: productType,
    isAvailable: isAvailable,
    isFeatured: isFeatured,
    isOfferOfTheDay: isOfferOfTheDay,
    isPopular: isPopular,
  );

  Burger ?burger;
  int ?burgerId;
  List<Complement> ?complements;
  int ?cookTime;
  String ?description;
  int ?id;
  String ?image;
  bool ?isAvailable;
  bool ?isFeatured;
  bool ?isOfferOfTheDay;
  bool ?isPopular;
  List<int> ?listComplementsId;
  String ?name;
  double ?price;
  String ?slug;
  String ?productType;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
    burger: Burger.fromJson(json["burger"]),
    burgerId: json["burger_id"],
    complements: List<Complement>.from(json["complements"].map((x) => Complement.fromJson(x))),
    cookTime: json["cook_time"],
    description: json["description"],
    id: json["id"],
    image: '${ENV.apiUrl}/' + json["image"],
    isAvailable: json["is_available"],
    listComplementsId: List<int>.from(json["list_complements_id"].map((x) => x)),
    name: json["name"],
    price: json["price"],
    slug: json["slug"],
    productType: json["product_type"],
    isFeatured: json["is_featured"],
    isOfferOfTheDay: json["is_offer_of_the_day"],
    isPopular: json["is_popular"],
  );

  Map<String, dynamic> toJson() => {
    "burger": burger!.toJson(),
    "burger_id": burgerId,
    "complements": List<dynamic>.from(complements!.map((x) => x.toJson())),
    "cook_time": cookTime,
    "description": description,
    "id": id,
    "image": image,
    "is_available": isAvailable,
    "list_complements_id": List<dynamic>.from(listComplementsId!.map((x) => x)),
    "name": name,
    "price": price,
    "slug": slug,
    "product_type": productType,
    "is_offer_of_the_day": isOfferOfTheDay,
    "is_featured": isFeatured,
    "is_popular": isPopular,
  };
}

