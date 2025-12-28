import 'dart:convert';

import 'package:equatable/equatable.dart';

class ApiInputParams extends Equatable {
  final String language;

  const ApiInputParams({required this.language});

  @override
  List<Object?> get props => [language];

  Map<String, dynamic> toMap() {
    return {
      'language_type': language,
    };
  }

  factory ApiInputParams.fromMap(Map<String, dynamic> map) {
    return ApiInputParams(
      language: map['language_type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiInputParams.fromJson(String source) =>
      ApiInputParams.fromMap(json.decode(source));
}
