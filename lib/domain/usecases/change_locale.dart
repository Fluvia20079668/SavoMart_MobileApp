
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/repository/user_preference_repository.dart';
import 'package:savomart/domain/usecases/usecase.dart';

class ChangeLocale extends UseCase<void,  Locale> {
  final UserPreferencesRepository _userPreferencesRepository;

  ChangeLocale(this._userPreferencesRepository);
  @override
  // ignore: avoid_renaming_method_parameters
  Future<Either<AppError, Unit>> call(Locale locale) async {
     return  _userPreferencesRepository.changeLocale(locale);
  }
}