import 'package:equatable/equatable.dart';

import '../entities/oder_entity.dart';

class OrderReturnArgs extends Equatable {
  final String orderId;
  final OrderEntity orderItem;

  const OrderReturnArgs({
    required this.orderId,
    required this.orderItem,
  });

  @override
  List<Object?> get props => [];
}
