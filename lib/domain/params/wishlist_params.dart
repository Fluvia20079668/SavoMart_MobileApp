
import 'package:equatable/equatable.dart';

class WhishListParam extends Equatable {
  final String productId;
  final String action;


  const WhishListParam(
      {required this.productId,
      required this.action,});

  Map<String, dynamic> toMap() {
    return {
      "product_id": productId,
      "action": action,
    };
  }

  @override
  List<Object?> get props => [];
}
