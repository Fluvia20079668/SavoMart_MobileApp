// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:savomart/domain/entities/product_entity.dart';

ProductDetailsModel productDetailsModelFromJson(String str) =>
    ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) =>
    json.encode(data.toJson());

class ProductDetailsModel {
  bool status;
  Product product;

  ProductDetailsModel({
    required this.status,
    required this.product,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        status: json["status"],
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "product": product.toJson(),
      };
}

class Product {
  int id;
  String sku;
  String name;
  String quantity;
  String status;
  String type;
  String? description;
  String price;
  String specialPrice;
  dynamic specialPriceTo;
  dynamic specialPriceFrom;
  dynamic discountId;
  String discountPercentage;
  String discountAmount;
  List<Image>? image;
  final bool isInCart;
  final bool isInWishlist;
  final String stockStatus;
  final List<Variation> variations;
  final String finalPrice;
  final String cartQuantity;

  Product({
    required this.id,
    required this.sku,
    required this.name,
    required this.quantity,
    required this.status,
    required this.type,
    required this.description,
    required this.price,
    required this.specialPrice,
    required this.specialPriceTo,
    required this.specialPriceFrom,
    required this.discountId,
    required this.discountPercentage,
    required this.discountAmount,
    required this.image,
    required this.isInCart,
    required this.isInWishlist,
    required this.stockStatus,
    required this.variations,
    required this.finalPrice,
    required this.cartQuantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        sku: json["sku"],
        name: json["name"],
        quantity: json["quantity"],
        status: json["status"],
        type: json["type"],
        description: json["description"],
        price: json["price"],
        specialPrice: json["special_price"],
        specialPriceTo: json["special_price_to"],
        specialPriceFrom: json["special_price_from"],
        discountId: json["discount_id"],
        discountPercentage: json["discount_percentage"],
        discountAmount: json["discount_amount"],
        image: json["product_images"] != null
            ? List<Image>.from(
                json["product_images"].map((x) => Image.fromJson(x)))
            : [],
        isInCart: json["is_in_cart"] ?? false,
        isInWishlist: json["is_in_wishlist"] ?? false,
        stockStatus: json["stock_status"],
        variations: List<Variation>.from(
            json["variations"].map((x) => Variation.fromJson(x))),
        finalPrice: json["final_price"],
        cartQuantity: json["cart_quantity"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sku": sku,
        "name": name,
        "quantity": quantity,
        "status": status,
        "type": type,
        "description": description,
        "price": price,
        "special_price": specialPrice,
        "special_price_to": specialPriceTo,
        "special_price_from": specialPriceFrom,
        "discount_id": discountId,
        "discount_percentage": discountPercentage,
        "discount_amount": discountAmount,
        "product_images": List<dynamic>.from(image!.map((x) => x.toJson())),
        "is_in_cart": isInCart,
        "is_in_wishlist": isInWishlist,
        "stock_status": stockStatus,
        "variations": List<dynamic>.from(variations.map((x) => x.toJson())),
        "final_price": finalPrice,
        "cart_quantity": cartQuantity,
      };
}

class Image {
  String imageRole;
  String imagePath;
  dynamic altText;

  Image({
    required this.imageRole,
    required this.imagePath,
    required this.altText,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        imageRole: json["image_role"],
        imagePath: json["image_url"],
        altText: json["alt_text"],
      );

  Map<String, dynamic> toJson() => {
        "image_role": imageRole,
        "image_url": imagePath,
        "alt_text": altText,
      };
}

// ignore: must_be_immutable
class Variation extends ProductEntity {
  final String pdtId;
  final String pdtName;
  final String type;
  final String parentId;
  final String stockStatus;
  final String pdtPrice;
  final String thumbnailUrl;
  final String finalPrice;

  Variation({
    required this.pdtId,
    required this.pdtName,
    required this.type,
    required this.parentId,
    required this.stockStatus,
    required this.pdtPrice,
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

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
        pdtId: json["id"].toString(),
        pdtName: json["name"],
        type: json["type"],
        parentId: json["parent_id"].toString(),
        stockStatus: json["stock_status"],
        pdtPrice: json["price"],
        thumbnailUrl: json["thumbnail_url"],
        finalPrice: json["final_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": pdtId,
        "name": pdtName,
        "type": type,
        "parent_id": parentId,
        "stock_status": stockStatus,
        "price": pdtPrice,
        "thumbnail_url": thumbnailUrl,
        "final_price": finalPrice,
      };
}

class ProductAttribute {
  final String id;
  final String productId;
  final String productType;
  final String attributeId;
  final String value;
  final Attribute attribute;

  ProductAttribute({
    required this.id,
    required this.productId,
    required this.productType,
    required this.attributeId,
    required this.value,
    required this.attribute,
  });

  factory ProductAttribute.fromJson(Map<String, dynamic> json) =>
      ProductAttribute(
        id: json["id"].toString(),
        productId: json["product_id"].toString(),
        productType: json["product_type"],
        attributeId: json["attribute_id"].toString(),
        value: json["value"],
        attribute: Attribute.fromJson(json["attribute"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "product_type": productType,
        "attribute_id": attributeId,
        "value": value,
        "attribute": attribute.toJson(),
      };
}

class Attribute {
  final String id;
  final String name;

  Attribute({
    required this.id,
    required this.name,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        id: json["id"].toString(),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
