// To parse this JSON data, do
//
//     final addressListModel = addressListModelFromJson(jsonString);

import 'dart:convert';

AddressListModel addressListModelFromJson(String str) =>
    AddressListModel.fromJson(json.decode(str));

String addressListModelToJson(AddressListModel data) =>
    json.encode(data.toJson());

class AddressListModel {
  final bool status;
  final List<Address> address;

  AddressListModel({
    required this.status,
    required this.address,
  });

  factory AddressListModel.fromJson(Map<String, dynamic> json) =>
      AddressListModel(
        status: json["status"],
        address:
            List<Address>.from(json["address"].map((x) => Address.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "address": List<dynamic>.from(address.map((x) => x.toJson())),
      };
}

class Address {
  final int id;
  final String street;
  final String addressLine1;
  final String number;
  final bool isSelected;

  Address({
    required this.id,
    required this.street,
    required this.addressLine1,
    required this.number,
    required this.isSelected,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        street: json["street"] ?? "",
        addressLine1: json["address_line1"] ?? "",
        number: json["number"] ?? "",
        isSelected: json["is_selected"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "street": street,
        "address_line1": addressLine1,
        "number": number,
        "is_selected": isSelected,
      };
}
