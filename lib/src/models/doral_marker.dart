// To parse this JSON data, do
//
//     final doralMarker = doralMarkerFromJson(jsonString);

import 'dart:convert';

import 'category.dart';

DoralMarker doralMarkerFromJson(String str) =>
    DoralMarker.fromJson(json.decode(str));

String doralMarkerToJson(DoralMarker data) => json.encode(data.toJson());

class DoralMarker {
  int id;
  Category category;
  String name;
  String long;
  String lat;
  String image;

  DoralMarker({
    this.id,
    this.category,
    this.name,
    this.long,
    this.lat,
    this.image,
  });

  factory DoralMarker.fromJson(Map<String, dynamic> json) => DoralMarker(
        id: json["id"],
        category: Category.fromJson(json["category"]),
        name: json["name"],
        long: json["long"],
        lat: json["lat"],
        image: json["business_image"],
      );

  Map<String, dynamic> toJson() => {
        "category": category.id,
        "name": name,
        "long": long,
        "lat": lat,
        "business_image": "",
      };
}
