// To parse this JSON data, do
//
//     final orderListModel = orderListModelFromJson(jsonString);

import 'dart:convert';

OrderListModel orderListModelFromJson(String str) =>
    OrderListModel.fromJson(json.decode(str));

String orderListModelToJson(OrderListModel data) => json.encode(data.toJson());

class OrderListModel {
  final bool status;
  final List<Order> order;

  OrderListModel({
    required this.status,
    required this.order,
  });

  factory OrderListModel.fromJson(Map<String, dynamic> json) => OrderListModel(
        status: json["status"],
        order: List<Order>.from(json["order"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "order": List<dynamic>.from(order.map((x) => x.toJson())),
      };
}

class Order {
  final int id;
  final String orderNo;
  final String location;
  final String status;
  final DateTime date;
  final int paymentType;
  final int totalItems;
  final String grandTotal;
  final DateTime? deliveryDate;

  Order({
    required this.id,
    required this.orderNo,
    required this.location,
    required this.status,
    required this.date,
    required this.paymentType,
    required this.totalItems,
    required this.grandTotal,
    required this.deliveryDate,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        orderNo: json["order_no"],
        location: json["location"],
        status: json["status"],
        date: DateTime.parse(json["date"]),
        paymentType: json["payment_type"],
        totalItems: json["total_items"],
        grandTotal: json["grand_total"],
        deliveryDate: json["delivery_date"] == null
            ? null
            : DateTime.parse(json["delivery_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_no": orderNo,
        "location": location,
        "status": status,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "payment_type": paymentType,
        "total_items": totalItems,
        "grand_total": grandTotal,
        "delivery_date":
            "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
      };
}
