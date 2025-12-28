// To parse this JSON data, do
//
//     final relatedProductListModel = relatedProductListModelFromJson(jsonString);

import 'dart:convert';

import 'package:savomart/domain/entities/product_entity.dart';

RelatedProductListModel relatedProductListModelFromJson(String str) =>
    RelatedProductListModel.fromJson(json.decode(str));

String relatedProductListModelToJson(RelatedProductListModel data) =>
    json.encode(data.toJson());

class RelatedProductListModel {
  final bool status;
  final Data data;
  final String message;

  RelatedProductListModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory RelatedProductListModel.fromJson(Map<String, dynamic> json) =>
      RelatedProductListModel(
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
  final List<ProductElement> products;

  Data({
    required this.products,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        products: List<ProductElement>.from(
            json["products"].map((x) => ProductElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

// ignore: must_be_immutable
class ProductElement extends ProductEntity {
  final String elementId;
  final String productId;
  final String relatedProductId;
  final ProductProduct product;

  ProductElement({
    required this.elementId,
    required this.productId,
    required this.relatedProductId,
    required this.product,
  }) : super(
          id: product.productId,
          name: product.productName,
          imageUrl: product.thumbnailUrl!,
          price: product.finalPrice,
          cutPrice: double.parse(product.finalPrice) <
                  double.parse(product.productPrice)
              ? product.productPrice
              : "",
        );

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        elementId: json["id"].toString(),
        productId: json["product_id"].toString(),
        relatedProductId: json["related_product_id"].toString(),
        product: ProductProduct.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": elementId,
        "product_id": productId,
        "related_product_id": relatedProductId,
        "product": product.toJson(),
      };
}

class ProductProduct {
  final String productId;
  final String sku;
  final String productName;
  final String nameAr;
  final String quantity;
  final String status;
  final String type;
  final String? description;
  final String? descriptionAr;
  final String stockStatus;
  final String productPrice;
  final String? thumbnailUrl;
  final String finalPrice;

  ProductProduct({
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
  });

  factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
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
