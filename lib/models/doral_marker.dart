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

  DoralMarker({
    this.id,
    this.category,
    this.name,
    this.long,
    this.lat,
  });

  factory DoralMarker.fromJson(Map<String, dynamic> json) => DoralMarker(
        id: json["id"],
        category: Category.fromJson(json["category"]),
        name: json["name"],
        long: json["long"],
        lat: json["lat"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category.toJson(),
        "name": name,
        "long": long,
        "lat": lat,
      };
}
