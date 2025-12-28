
import 'package:equatable/equatable.dart';

class OrderDetailsParams extends Equatable {
  final String orderId;
 
  const OrderDetailsParams(
      {required this.orderId,});

  Map<String, dynamic> toMap() {
    return {
      "order_id": orderId,
    };
  }

  @override
  List<Object?> get props => [];
}
