import 'package:equatable/equatable.dart';

class RemoveCartParam extends Equatable {
  final String productId;

  const RemoveCartParam({
    required this.productId,
  });

  Map<String, dynamic> toMap() {
    return {
      "product_id": productId,
    };
  }

  @override
  List<Object?> get props => [];
}
