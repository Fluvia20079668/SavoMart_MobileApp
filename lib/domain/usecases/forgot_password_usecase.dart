import 'package:dartz/dartz.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import '../../presentation/core/auth_wrapper/auth_controller.dart';
import '../repository/auth_repository.dart';

class ForgotPasswordUsecase
    extends UseCase<Map<String, dynamic>, ForgotPasswordParams> {
  final AuthenticationRepository _authenticationRepository;

  ForgotPasswordUsecase(this._authenticationRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      ForgotPasswordParams params) async {
    AuthController authController = Get.find();
    Map<String, dynamic> newParams = {};
    final apiInputParams = authController.getUserDetails();
    newParams.addAll(apiInputParams.toMap());
    newParams.addAll(params.toMap());
    return await _authenticationRepository.forgotPassword(newParams);
  }
}

class ForgotPasswordParams extends Equatable {
  final String newPassword;
  final String cnfPassword;
  final String phoneNumber;

  const ForgotPasswordParams(
      {required this.newPassword,
      required this.cnfPassword,
      required this.phoneNumber});

  Map<String, dynamic> toMap() {
    return {
      "new_password": newPassword,
      "confirm_password": cnfPassword,
      "phone_number": phoneNumber
    };
  }

  @override
  List<Object?> get props => [];
}
