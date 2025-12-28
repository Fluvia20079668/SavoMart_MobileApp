import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ProductEntity extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String price;
  final String? cutPrice;
  bool isSelect;
  final String? qty;

  ProductEntity(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.price,
      this.cutPrice,
      this.isSelect = false,
      this.qty});

  @override
  List<Object?> get props => [];
}

class LabelWithProducts extends Equatable {
  final String id;
  final String label;
  final List<ProductEntity> productEntity;

  const LabelWithProducts(
      {required this.id, required this.label, required this.productEntity});

  @override
  List<Object?> get props => [];
}
