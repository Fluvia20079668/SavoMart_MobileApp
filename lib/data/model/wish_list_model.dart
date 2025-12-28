// To parse this JSON data, do
//
//     final whishListModel = whishListModelFromJson(jsonString);

import 'dart:convert';

WhishListModel whishListModelFromJson(String str) =>
    WhishListModel.fromJson(json.decode(str));

String whishListModelToJson(WhishListModel data) => json.encode(data.toJson());

class WhishListModel {
  bool status;
  List<Datum> data;
  String message;

  WhishListModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory WhishListModel.fromJson(Map<String, dynamic> json) => WhishListModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
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
  List<Image> image;
  final String finalPrice;

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        imagePath: json["image_path"],
        altText: json["alt_text"],
      );

  Map<String, dynamic> toJson() => {
        "image_role": imageRole,
        "image_path": imagePath,
        "alt_text": altText,
      };
}
