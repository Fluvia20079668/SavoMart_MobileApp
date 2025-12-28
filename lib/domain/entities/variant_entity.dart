import 'package:savomart/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class VariantEntity extends Equatable {
  final String name;
  final List<VariantProduct> variantProducts;

  const VariantEntity({required this.name, required this.variantProducts});

  @override
  List<Object?> get props => [name, variantProducts];
}

class VariantProduct extends Equatable {
  final String value;
  final ProductEntity productEntity;

  const VariantProduct(
      {
      required this.value,
      required this.productEntity});

  @override
  List<Object?> get props => [value, productEntity];
}
