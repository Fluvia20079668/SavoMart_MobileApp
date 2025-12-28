

import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:savomart/domain/entities/app_error.dart';

abstract class UserPreferencesRepository {
  Future<Either<AppError, Unit>> changeLocale(Locale locale);
}