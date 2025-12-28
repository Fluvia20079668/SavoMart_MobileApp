
import 'package:equatable/equatable.dart';

class ProductParams extends Equatable {
  final String id;
 
  const ProductParams(
      {required this.id,});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
    };
  }

  @override
  List<Object?> get props => [];
}
