import 'package:dartz/dartz.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import '../../presentation/core/auth_wrapper/auth_controller.dart';
import '../repository/auth_repository.dart';

class GenerateOTpUsecase
    extends UseCase<Map<String, dynamic>, GenerateOTPParams> {
  final AuthenticationRepository _authenticationRepository;

  GenerateOTpUsecase(this._authenticationRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      GenerateOTPParams params) async {
    AuthController authController = Get.find();
    Map<String, dynamic> newParams = {};
    final apiInputParams = authController.getUserDetails();
    newParams.addAll(apiInputParams.toMap());
    newParams.addAll(params.toMap());
    return await _authenticationRepository.generateOTP(newParams);
  }
}

class GenerateOTPParams extends Equatable {
  final String phoneNumber;

  const GenerateOTPParams({
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      "phone_number": phoneNumber,
    };
  }

  @override
  List<Object?> get props => [];
}
