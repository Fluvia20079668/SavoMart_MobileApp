import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

import '../../presentation/core/auth_wrapper/auth_controller.dart';
import '../entities/app_error.dart';
import '../repository/data_repository.dart';
import 'usecase.dart';

class UploadProfilePictureUseCase
    extends UseCase<Map<String, dynamic>, UploadProfilePictureParams> {
  final DataRepository _dataRepository;

  UploadProfilePictureUseCase(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      UploadProfilePictureParams params) async {
    AuthController authController = Get.find();
    Map<String, dynamic> newParams = {};
    final apiInputParams = authController.getUserDetails();
    newParams.addAll(apiInputParams.toMap());
    newParams.addAll(params.toMap());
    return await _dataRepository.uploadProfile(newParams, params.images);
  }
}

class UploadProfilePictureParams extends Equatable {
  final Map<String, File>? images;

  const UploadProfilePictureParams({required this.images});

  Map<String, dynamic> toMap() {
    return {};
  }

  @override
  List<Object?> get props => [];
}
