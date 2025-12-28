import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final String productId;
  final String quantity;
  final String unitprice;
  final String totalPrice;
  final List image;
  final String name;
  final String? orderItemId;
  final String? returnStatus;

  const OrderEntity(
      {required this.productId,
      required this.quantity,
      required this.unitprice,
      required this.totalPrice,
      required this.image,
      required this.name,
      this.orderItemId,
      this.returnStatus
      });

  @override
  List<Object?> get props => [];

  Map<String, dynamic> toMap() => {};
}
