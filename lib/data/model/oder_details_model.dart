// To parse this JSON data, do
//
//     final orderDetailsModel = orderDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:savomart/domain/entities/oder_entity.dart';

OrderDetailsModel orderDetailsModelFromJson(String str) =>
    OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) =>
    json.encode(data.toJson());

class OrderDetailsModel {
  final bool status;
  final Order? order;

  OrderDetailsModel({
    required this.status,
    required this.order,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        status: json["status"],
        order: Order.fromJson(json["order"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "order": order!.toJson(),
      };
}

class Order {
  final int id;
  final String orderNo;
  final String status;
  final DateTime date;
  final String location;
  final int paymentType;
  final int totalItems;
  final String grandTotal;
  final List<OrderItem> orderItems;
  final DateTime? deliveryDate;

  Order({
    required this.id,
    required this.orderNo,
    required this.status,
    required this.date,
    required this.location,
    required this.paymentType,
    required this.totalItems,
    required this.grandTotal,
    required this.orderItems,
    required this.deliveryDate,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        orderNo: json["order_no"],
        status: json["status"],
        date: DateTime.parse(json["date"]),
        location: json["location"],
        paymentType: json["payment_type"],
        totalItems: json["total_items"],
        grandTotal: json["grand_total"],
        orderItems: List<OrderItem>.from(
            json["order_items"].map((x) => OrderItem.fromJson(x))),
        deliveryDate: json["delivery_date"] != null
            ? DateTime.parse(json["delivery_date"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_no": orderNo,
        "status": status,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "location": location,
        "payment_type": paymentType,
        "total_items": totalItems,
        "grand_total": grandTotal,
        "order_items": List<dynamic>.from(orderItems.map((x) => x.toJson())),
        "delivery_date":
            "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
      };
}

class OrderItem extends OrderEntity {
  final String id;
  @override
  // ignore: overridden_fields
  final String productId;
  @override
  // ignore: overridden_fields
  final String quantity;
  final String unitPrice;
  @override
  // ignore: overridden_fields
  final String totalPrice;
  @override
  // ignore: overridden_fields
  final String name;
  final String type;
  final dynamic description;
  final String price;
  final String specialPrice;
  final dynamic specialPriceTo;
  final dynamic specialPriceFrom;
  final dynamic discountId;
  final String discountPercentage;
  final String discountAmount;
  @override
  // ignore: overridden_fields
  final List<Image> image;
  @override
  // ignore: overridden_fields
  final String returnStatus;

  const OrderItem({
    required this.id,
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
    required this.returnStatus,
  }) : super(
            productId: productId,
            quantity: quantity,
            unitprice: unitPrice,
            totalPrice: totalPrice,
            image: image,
            name: name,
            orderItemId: id,
            returnStatus: returnStatus);

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["id"].toString(),
        productId: json["product_id"].toString(),
        quantity: json["quantity"],
        unitPrice: json["unit_price"],
        totalPrice: json["total_price"],
        name: json["name"],
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
        returnStatus: json["return_status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
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
        "return_status": returnStatus,
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
