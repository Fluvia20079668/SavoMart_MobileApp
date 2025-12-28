import 'package:equatable/equatable.dart';

class AddAddressParam extends Equatable {
  final String address;
  final String street;
  final String phone;
  final String? addressId;

  const AddAddressParam(
      {required this.address,
      required this.street,
      required this.phone,
      this.addressId});

  @override
  List<Object?> get props => [];

  Map<String, dynamic> toMap() {
    if (addressId != null) {
      return {
        'customer_address_id': addressId,
        'address': address,
        "street": street,
        "phone": phone
      };
    } else {
      return {'address': address, "street": street, "phone": phone};
    }
  }
}
