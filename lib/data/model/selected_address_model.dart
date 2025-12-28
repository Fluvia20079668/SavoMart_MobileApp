// To parse this JSON data, do
//
//     final selectedAddressModel = selectedAddressModelFromJson(jsonString);

import 'dart:convert';

SelectedAddressModel selectedAddressModelFromJson(String str) =>
    SelectedAddressModel.fromJson(json.decode(str));

String selectedAddressModelToJson(SelectedAddressModel data) =>
    json.encode(data.toJson());

class SelectedAddressModel {
  final bool status;
  final Address? address;
  final String message;

  SelectedAddressModel({
    required this.status,
    required this.address,
    required this.message,
  });

  factory SelectedAddressModel.fromJson(Map<String, dynamic> json) =>
      SelectedAddressModel(
        status: json["status"],
        address:
            json["address"] != null ? Address.fromJson(json["address"]) : null,
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "address": address!.toJson(),
        "message": message,
      };
}

class Address {
  final String id;
  final String customerId;
  final String street;
  final String addressLine1;
  final String number;

  Address({
    required this.id,
    required this.customerId,
    required this.street,
    required this.addressLine1,
    required this.number,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"].toString(),
        customerId: json["customer_id"].toString(),
        street: json["street"] ?? "",
        addressLine1: json["address_line1"] ?? "",
        number: json["number"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "street": street,
        "address_line1": addressLine1,
        "number": number,
      };
}
