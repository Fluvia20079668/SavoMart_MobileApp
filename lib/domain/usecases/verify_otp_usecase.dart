import 'package:dartz/dartz.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import '../../presentation/core/auth_wrapper/auth_controller.dart';
import '../repository/auth_repository.dart';

class VerifyOTPUsecase extends UseCase<Map<String, dynamic>, VerifyOTPParams> {
  final AuthenticationRepository _authenticationRepository;

  VerifyOTPUsecase(this._authenticationRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      VerifyOTPParams params) async {
    AuthController authController = Get.find();
    Map<String, dynamic> newParams = {};
    final apiInputParams = authController.getUserDetails();
    newParams.addAll(apiInputParams.toMap());
    newParams.addAll(params.toMap());
    return await _authenticationRepository.verifyOTP(newParams);
  }
}

class VerifyOTPParams extends Equatable {
  final String phoneNumber;
  final String otp;

  const VerifyOTPParams({
    required this.phoneNumber,
    required this.otp,
  });

  Map<String, dynamic> toMap() {
    return {
      "phone_number": phoneNumber,
      "otp": otp,
    };
  }

  @override
  List<Object?> get props => [];
}
