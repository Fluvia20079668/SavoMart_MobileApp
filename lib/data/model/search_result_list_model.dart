// To parse this JSON data, do
//
//     final searchResultListModel = searchResultListModelFromJson(jsonString);

// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:convert';

import 'package:savomart/domain/entities/product_entity.dart';

SearchResultListModel searchResultListModelFromJson(String str) =>
    SearchResultListModel.fromJson(json.decode(str));

String searchResultListModelToJson(SearchResultListModel data) =>
    json.encode(data.toJson());

class SearchResultListModel {
  final bool status;
  final Data data;
  final String message;

  SearchResultListModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory SearchResultListModel.fromJson(Map<String, dynamic> json) =>
      SearchResultListModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  final List<Product> products;

  Data({
    required this.products,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

// ignore: must_be_immutable
class Product extends ProductEntity {
  final String productId;
  final String sku;
  final String productName;
  final String? nameAr;
  final String quantity;
  final String status;
  final String type;
  final String? description;
  final String? descriptionAr;
  final String stockStatus;
  final String productPrice;
  final String thumbnailUrl;
  final String finalPrice;

  Product({
    required this.productId,
    required this.sku,
    required this.productName,
    required this.nameAr,
    required this.quantity,
    required this.status,
    required this.type,
    required this.description,
    required this.descriptionAr,
    required this.stockStatus,
    required this.productPrice,
    required this.thumbnailUrl,
    required this.finalPrice,
  }) : super(
          id: productId,
          name: productName,
          imageUrl: thumbnailUrl,
          price: finalPrice,
          cutPrice: double.parse(finalPrice) < double.parse(productPrice)
              ? productPrice
              : "",
        );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["id"].toString(),
        sku: json["sku"],
        productName: json["name"],
        nameAr: json["name_ar"],
        quantity: json["quantity"],
        status: json["status"],
        type: json["type"],
        description: json["description"],
        descriptionAr: json["description_ar"],
        stockStatus: json["stock_status"],
        productPrice: json["price"],
        thumbnailUrl: json["thumbnail_url"],
        finalPrice: json["final_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": productId,
        "sku": sku,
        "name": productName,
        "name_ar": nameAr,
        "quantity": quantity,
        "status": status,
        "type": type,
        "description": description,
        "description_ar": descriptionAr,
        "stock_status": stockStatus,
        "price": productPrice,
        "thumbnail_url": thumbnailUrl,
        "final_price": finalPrice,
      };
}
