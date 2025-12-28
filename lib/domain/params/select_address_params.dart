import 'package:equatable/equatable.dart';

class SelectAddressParam extends Equatable {
  final String addressId;

  const SelectAddressParam({
    required this.addressId,
  });

  Map<String, dynamic> toMap() {
    return {
      "address_id": addressId,
    };
  }

  @override
  List<Object?> get props => [];
}
