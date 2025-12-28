import 'package:equatable/equatable.dart';

class ViewImageArgs extends Equatable {
  final List<String> images;
  final int index;

  const ViewImageArgs({required this.images, required this.index});

  @override
  List<Object?> get props => [];
}
