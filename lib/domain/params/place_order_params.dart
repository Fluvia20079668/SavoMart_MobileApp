
import 'package:equatable/equatable.dart';

class OrderParams extends Equatable {
  final String cartid;
  final String addressId;
  final String paymentType;
 
  const OrderParams(
      {required this.cartid,
      required this.addressId,
      required this.paymentType
      });

  Map<String, dynamic> toMap() {
    return {
      "cart_id": cartid,
      "address_id":addressId,
      "payment_type":paymentType
    };
  }

  @override
  List<Object?> get props => [];
}
