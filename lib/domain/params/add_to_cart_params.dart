import 'package:equatable/equatable.dart';
class AddToCartParam extends Equatable {
  final String productId;
  final String quantity;

  const AddToCartParam(
      {required this.productId,
      required this.quantity});

  Map<String, dynamic> toMap() {
    return {
      "product_id": productId,
      "quantity": quantity,
    };
  }

  @override
  List<Object?> get props => [];
}
