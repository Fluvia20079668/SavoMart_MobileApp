import 'package:equatable/equatable.dart';

class HomeCategoriesParams extends Equatable {
  final String productLimit;

  final String categoryLimit;

  const HomeCategoriesParams(
      {required this.productLimit, required this.categoryLimit});

  Map<String, dynamic> toMap() {
    return {
      "product_limit": productLimit,
      "category_limit": categoryLimit,
    };
  }

  @override
  List<Object?> get props => [];
}
