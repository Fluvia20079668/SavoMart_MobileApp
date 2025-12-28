import 'package:dartz/dartz.dart';
import 'package:savomart/domain/entities/app_error.dart';

abstract class AuthenticationRepository {
  Future<Either<AppError, Map<String, dynamic>>> login(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> logout(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> register(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> updateUser(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> changePassword(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> generateOTP(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> verifyOTP(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> forgotPassword(
      Map<String, dynamic> params);
  // Future<Either<AppError, VerifyOtpResponse>> verifyOtpLogin(Map<String, dynamic> params);
}
