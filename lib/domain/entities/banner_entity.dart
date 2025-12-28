import 'package:equatable/equatable.dart';

class BannerEntity extends Equatable {
  final String image;
  final Function onTap;
  final String id;
  final String type;

  const BannerEntity(
      {required this.image,
      required this.onTap,
      required this.id,
      required this.type});

  @override
  List<Object> get props => [image];
}
