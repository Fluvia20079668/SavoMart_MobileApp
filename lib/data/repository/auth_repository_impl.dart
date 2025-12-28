import 'dart:io';
import 'package:savomart/domain/entities/user_entity.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:savomart/data/data_sources/auth_local_data_source.dart';
import 'package:savomart/data/data_sources/auth_remote_data_source.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/repository/auth_repository.dart';

import '../../presentation/core/auth_wrapper/auth_controller.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource _authenticationRemoteDataSource;
  final AuthenticationLocalDataSource _authenticationLocalDataSource;

  AuthenticationRepositoryImpl(this._authenticationRemoteDataSource,
      this._authenticationLocalDataSource);

  @override
  Future<Either<AppError, Map<String, dynamic>>> login(
      Map<String, dynamic> params) async {
    try {
      final response = await _authenticationRemoteDataSource.login(params);
      if (response['status'] && response['data'] != null) {
        UserEntity? user = UserEntity(
            firstname: response["data"]["customer"]["first_name"],
            email: response["data"]["customer"]["email"] != null
                ? response["data"]["customer"]["email"].toString()
                : "",
            lastName: response["data"]["customer"]["last_name"],
            phone: response["data"]["customer"]["phone"],
            sessionId: response["data"]["access_token"],
            userId: response["data"]["customer"]["id"].toString());
        _authenticationLocalDataSource.saveUser(user);
      }
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> register(
      Map<String, dynamic> params) async {
    try {
      final response = await _authenticationRemoteDataSource.register(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> logout(
      Map<String, dynamic> params) async {
    try {
      final response = await _authenticationRemoteDataSource.logout(params);
      _authenticationLocalDataSource.deleteUser();
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> updateUser(
      Map<String, dynamic> params) async {
    try {
      AuthController authController = Get.find();
      final response = await _authenticationRemoteDataSource.updateUser(params);
      if (response['status'] && response['data'] != null) {
        UserEntity? user = UserEntity(
            firstname: response["data"]["customer"]["first_name"],
            email: response["data"]["customer"]["email"] != null
                ? response["data"]["customer"]["email"].toString()
                : "",
            lastName: response["data"]["customer"]["last_name"],
            phone: response["data"]["customer"]["phone"],
            sessionId: authController.user!.sessionId,
            userId: response["data"]["customer"]["id"].toString());
        _authenticationLocalDataSource.saveUser(user);
      }
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> changePassword(
      Map<String, dynamic> params) async {
    try {
      final response =
          await _authenticationRemoteDataSource.changePassword(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> generateOTP(
      Map<String, dynamic> params) async {
    try {
      final response =
          await _authenticationRemoteDataSource.generateOTP(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> verifyOTP(
      Map<String, dynamic> params) async {
    try {
      final response = await _authenticationRemoteDataSource.verifyOTP(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> forgotPassword(
      Map<String, dynamic> params) async {
    try {
      final response =
          await _authenticationRemoteDataSource.forgotPassword(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  // @override
  // Future<Either<AppError, VerifyOtpResponse>> verifyOtpLogin(
  //     Map<String, dynamic> params) async {
  //   try {
  //     final response =
  //         await _authenticationRemoteDataSource.verifyOtpLogin(params);
  //     UserEntity? user = response.data;
  //     if (user != null &&
  //         RegistrationStatus.values[user.registrationStatus] ==
  //             RegistrationStatus.verified) {
  //       _authenticationLocalDataSource.saveUser(user);
  //     }
  //     return Right(response);
  //   } on SocketException {
  //     return Left(AppError(AppErrorType.network));
  //   } on UnauthorizedException {
  //     return Left(AppError(AppErrorType.unauthorised));
  //   } on Exception {
  //     return Left(AppError(AppErrorType.api));
  //   }
  // }
}
