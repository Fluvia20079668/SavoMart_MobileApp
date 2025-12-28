import 'package:dartz/dartz.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import '../../presentation/core/auth_wrapper/auth_controller.dart';
import '../repository/auth_repository.dart';

class ChangePasswordUsecase
    extends UseCase<Map<String, dynamic>, ChangePasswordParams> {
  final AuthenticationRepository _authenticationRepository;

  ChangePasswordUsecase(this._authenticationRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      ChangePasswordParams params) async {
    AuthController authController = Get.find();
    Map<String, dynamic> newParams = {};
    final apiInputParams = authController.getUserDetails();
    newParams.addAll(apiInputParams.toMap());
    newParams.addAll(params.toMap());
    return await _authenticationRepository.changePassword(newParams);
  }
}

class ChangePasswordParams extends Equatable {
  final String oldPassword;
  final String newPassword;
  final String cnfPassword;

  const ChangePasswordParams(
      {required this.oldPassword,
      required this.newPassword,
      required this.cnfPassword});

  Map<String, dynamic> toMap() {
    return {
      "current_password": oldPassword,
      "new_password": newPassword,
      "confirm_password": cnfPassword
    };
  }

  @override
  List<Object?> get props => [];
}
