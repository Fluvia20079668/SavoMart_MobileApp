// To parse this JSON data, do
//
//     final productWithCategorieIdModel = productWithCategorieIdModelFromJson(jsonString);

import 'dart:convert';

ProductWithCategorieIdModel productWithCategorieIdModelFromJson(String str) =>
    ProductWithCategorieIdModel.fromJson(json.decode(str));

String productWithCategorieIdModelToJson(ProductWithCategorieIdModel data) =>
    json.encode(data.toJson());

class ProductWithCategorieIdModel {
  final bool status;
  final Items items;

  ProductWithCategorieIdModel({
    required this.status,
    required this.items,
  });

  factory ProductWithCategorieIdModel.fromJson(Map<String, dynamic> json) =>
      ProductWithCategorieIdModel(
        status: json["status"],
        items: Items.fromJson(json["items"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "items": items.toJson(),
      };
}

class Items {
  final int id;
  final String name;
  final int parentCategoryId;
  final String logo;
  final String icon;
  final String status;
  final List<Product> products;

  Items({
    required this.id,
    required this.name,
    required this.parentCategoryId,
    required this.logo,
    required this.icon,
    required this.status,
    required this.products,
  });

  factory Items.fromJson(Map<String, dynamic> json) => Items(
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

class Product {
  final int id;
  final String sku;
  final String name;
  final String quantity;
  final String status;
  final String type;
  final String description;
  final String price;
  final String specialPrice;
  final dynamic specialPriceTo;
  final dynamic specialPriceFrom;
  final dynamic discountId;
  final String discountPercentage;
  final String discountAmount;
  final List<Image> image;
  final String finalPrice;

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
    required this.finalPrice,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        sku: json["sku"],
        name: json["name"],
        quantity: json["quantity"],
        status: json["status"],
        type: json["type"],
        description: json["description"].toString(),
        price: json["price"],
        specialPrice: json["special_price"],
        specialPriceTo: json["special_price_to"],
        specialPriceFrom: json["special_price_from"],
        discountId: json["discount_id"],
        discountPercentage: json["discount_percentage"],
        discountAmount: json["discount_amount"],
        image: List<Image>.from(json["image"].map((x) => Image.fromJson(x))),
        finalPrice: json["final_price"],
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
        "image": List<dynamic>.from(image.map((x) => x.toJson())),
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
