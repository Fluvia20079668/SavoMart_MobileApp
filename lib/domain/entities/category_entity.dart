import 'package:equatable/equatable.dart';
import '../../data/model/categorie_model.dart';

class CategoryEntity extends Equatable {
  final String id;
  final String name;
  final String logo;
  final String icon;
  final String status;
  final List<Category>? subCategory;
  bool isSelected;

   CategoryEntity(
      {required this.id,
      required this.name,
      required this.logo,
      required this.icon,
      required this.status,
      this.subCategory,
      this.isSelected = false});

  @override
  List<Object?> get props => [name, id];

  Map<String, dynamic> toMap() => {"cat_id": id};
}
