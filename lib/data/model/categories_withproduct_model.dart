// To parse this JSON data, do
//
//     final categorieWithProductModel = categorieWithProductModelFromJson(jsonString);

import 'dart:convert';

import 'package:savomart/domain/entities/product_entity.dart';

CategorieWithProductModel categorieWithProductModelFromJson(String str) =>
    CategorieWithProductModel.fromJson(json.decode(str));

String categorieWithProductModelToJson(CategorieWithProductModel data) =>
    json.encode(data.toJson());

class CategorieWithProductModel {
  final bool status;
  final List<Category> category;

  CategorieWithProductModel({
    required this.status,
    required this.category,
  });

  factory CategorieWithProductModel.fromJson(Map<String, dynamic> json) =>
      CategorieWithProductModel(
        status: json["status"],
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
      };
}

class Category {
  final int id;
  final String name;
  final int parentCategoryId;
  final String logo;
  final String icon;
  final String status;
  final List<Product> products;

  Category({
    required this.id,
    required this.name,
    required this.parentCategoryId,
    required this.logo,
    required this.icon,
    required this.status,
    required this.products,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        parentCategoryId: json["parent_category_id"],
        logo: json["logo"],
        icon: json["icon"],
        status: json["status"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parent_category_id": parentCategoryId,
        "logo": logo,
        "icon": icon,
        "status": status,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

// ignore: must_be_immutable
class Product extends ProductEntity {
  final String pdtId;
  final String sku;
  final String pdtName;
  final String? quantity;
  final String status;
  final String type;
  final String description;
  final String pdtPrice;
  final String specialPrice;
  final dynamic specialPriceTo;
  final dynamic specialPriceFrom;
  final dynamic discountId;
  final String discountPercentage;
  final String discountAmount;
  final List<Image> image;
  final String thumbnailUrl;
  final String finalPrice;

  Product({
    required this.pdtId,
    required this.sku,
    required this.pdtName,
    required this.quantity,
    required this.status,
    required this.type,
    required this.description,
    required this.pdtPrice,
    required this.specialPrice,
    required this.specialPriceTo,
    required this.specialPriceFrom,
    required this.discountId,
    required this.discountPercentage,
    required this.discountAmount,
    required this.image,
    required this.thumbnailUrl,
    required this.finalPrice,
  }) : super(
          id: pdtId,
          name: pdtName,
          imageUrl: thumbnailUrl,
          price: finalPrice,
          cutPrice:
              double.parse(finalPrice) < double.parse(pdtPrice) ? pdtPrice : "",
        );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        pdtId: json["id"].toString(),
        sku: json["sku"],
        pdtName: json["name"],
        quantity: json["quantity"],
        status: json["status"],
        type: json["type"],
        description: json["description"].toString(),
        pdtPrice: json["price"],
        specialPrice: json["special_price"],
        specialPriceTo: json["special_price_to"],
        specialPriceFrom: json["special_price_from"],
        discountId: json["discount_id"],
        discountPercentage: json["discount_percentage"],
        discountAmount: json["discount_amount"],
        image: json["image"] != null
            ? List<Image>.from(json["image"].map((x) => Image.fromJson(x)))
            : [],
        thumbnailUrl: json["thumbnail_url"] ?? "",
        finalPrice: json["final_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": pdtId,
        "sku": sku,
        "name": pdtName,
        "quantity": quantity,
        "status": status,
        "type": type,
        "description": description,
        "price": pdtPrice,
        "special_price": specialPrice,
        "special_price_to": specialPriceTo,
        "special_price_from": specialPriceFrom,
        "discount_id": discountId,
        "discount_percentage": discountPercentage,
        "discount_amount": discountAmount,
        "image": List<dynamic>.from(image.map((x) => x.toJson())),
        "thumbnail_url": thumbnailUrl,
        "final_price": finalPrice,
      };
}

class Image {
  final String imageRole;
  final String imagePath;
  final dynamic altText;

  Image({
    required this.imageRole,
    required this.imagePath,
    required this.altText,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        imageRole: json["image_role"],
        imagePath: json["image_path"],
        altText: json["alt_text"],
      );

  Map<String, dynamic> toJson() => {
        "image_role": imageRole,
        "image_path": imagePath,
        "alt_text": altText,
      };
}
