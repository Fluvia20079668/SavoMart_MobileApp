// To parse this JSON data, do
//
//     final categorieModel = categorieModelFromJson(jsonString);

// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import '../../domain/entities/category_entity.dart';

CategorieModel categorieModelFromJson(String str) =>
    CategorieModel.fromJson(json.decode(str));

String categorieModelToJson(CategorieModel data) => json.encode(data.toJson());

class CategorieModel {
  final bool status;
  final List<Category> category;

  CategorieModel({
    required this.status,
    required this.category,
  });

  factory CategorieModel.fromJson(Map<String, dynamic> json) => CategorieModel(
        status: json["status"],
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
      };
}

class Category extends CategoryEntity {
  @override
  // ignore: overridden_fields
  final String id;
  @override
  // ignore: overridden_fields
  final String name;
  @override
  // ignore: overridden_fields
  final String logo;
  @override
  // ignore: overridden_fields
  final String icon;
  @override
  // ignore: overridden_fields
  final String status;
  @override
  // ignore: overridden_fields
  final List<Category> subCategory;

  Category({
    required this.id,
    required this.name,
    required this.logo,
    required this.icon,
    required this.status,
    required this.subCategory,
  }) : super(
            id: id,
            name: name,
            logo: logo,
            icon: icon,
            status: status,
            subCategory: subCategory);

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"].toString(),
        name: json["name"],
        logo: json["logo"],
        icon: json["icon"],
        status: json["status"],
        subCategory: json["sub_category"] == null
            ? []
            : List<Category>.from(
                json["sub_category"]!.map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "icon": icon,
        "status": status,
        "sub_category": subCategory == null
            ? []
            : List<dynamic>.from(subCategory.map((x) => x.toJson())),
      };
}
