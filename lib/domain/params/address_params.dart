import 'package:equatable/equatable.dart';

class AddressParams extends Equatable {
  final String addressId;
  final String? address;
  final String? street;
  final String? phone;

  const AddressParams(
      {required this.addressId, this.address, this.street, this.phone});

  @override
  List<Object?> get props => [];
}

class ChangeAddressParam extends Equatable {
  final String? from;
  final AddressParams? addressParams;

  const ChangeAddressParam({this.from, this.addressParams});

  @override
  List<Object?> get props => [];
}
