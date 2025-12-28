// To parse this JSON data, do
//
//     final cartListModel = cartListModelFromJson(jsonString);

import 'dart:convert';

CartListModel cartListModelFromJson(String str) =>
    CartListModel.fromJson(json.decode(str));

String cartListModelToJson(CartListModel data) => json.encode(data.toJson());

class CartListModel {
  final bool status;
  final Cart cart;

  CartListModel({
    required this.status,
    required this.cart,
  });

  factory CartListModel.fromJson(Map<String, dynamic> json) => CartListModel(
        status: json["status"],
        cart: Cart.fromJson(json["cart"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "cart": cart.toJson(),
      };
}

class Cart {
  final String cartId;
  // final DateTime date;
  final String totalItems;
  final String grandTotal;
  final List<CartItem> cartItems;

  Cart({
    required this.cartId,
    // required this.date,
    required this.totalItems,
    required this.grandTotal,
    required this.cartItems,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        cartId: json["cart_id"].toString(),
        // date: DateTime.parse(json["date"]),
        totalItems: json["total_items"].toString(),
        grandTotal: json["grand_total"].toString(),
        cartItems: List<CartItem>.from(
            json["cart_items"].map((x) => CartItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cart_id": cartId,
        // "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "total_items": totalItems,
        "grand_total": grandTotal,
        "cart_items": List<dynamic>.from(cartItems.map((x) => x.toJson())),
      };
}

class CartItem {
  final int productId;
  final String quantity;
  final String unitPrice;
  final String totalPrice;
  final String name;
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
  final String stockStatus;
  final String finalPrice;

  CartItem({
    required this.productId,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
    required this.name,
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
    required this.stockStatus,
    required this.finalPrice,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        productId: json["product_id"],
        quantity: json["quantity"],
        unitPrice: json["unit_price"],
        totalPrice: json["total_price"],
        name: json["name"],
        type: json["type"],
        description: json["description"] ?? "",
        price: json["price"],
        specialPrice: json["special_price"],
        specialPriceTo: json["special_price_to"],
        specialPriceFrom: json["special_price_from"],
        discountId: json["discount_id"],
        discountPercentage: json["discount_percentage"],
        discountAmount: json["discount_amount"],
        image: List<Image>.from(json["image"].map((x) => Image.fromJson(x))),
        stockStatus: json["stock_status"],
        finalPrice: json["final_price"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "quantity": quantity,
        "unit_price": unitPrice,
        "total_price": totalPrice,
        "name": name,
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
        "stock_status": stockStatus,
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
