import 'package:equatable/equatable.dart';

class CancelOrderParam extends Equatable {
  final String id;

  const CancelOrderParam({
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      "order_id": id,
    };
  }

  @override
  List<Object?> get props => [];
}
