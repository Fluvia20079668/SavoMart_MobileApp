import 'package:equatable/equatable.dart';

class CMSArgs extends Equatable {
  final String cmsTitle;
  final String slug;

  const CMSArgs({required this.cmsTitle, required this.slug});

  @override
  List<Object?> get props => [];
}
