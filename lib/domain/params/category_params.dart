
import 'package:equatable/equatable.dart';

class CategoriesParams extends Equatable {
  final String categoriesId;
 
  const CategoriesParams(
      {required this.categoriesId,});

  Map<String, dynamic> toMap() {
    return {
      "category_id": categoriesId,
    };
  }

  @override
  List<Object?> get props => [];
}
