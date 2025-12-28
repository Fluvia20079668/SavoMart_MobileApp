import 'package:dartz/dartz.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/params/api_input_params.dart';
import 'package:savomart/domain/params/no_params.dart';
import 'package:savomart/domain/repository/auth_repository.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import 'package:savomart/presentation/core/auth_wrapper/auth_controller.dart';
import 'package:get/get.dart';

class LogoutUserUsecae extends UseCase<void, NoParams> {
  final AuthenticationRepository _authenticationRepository;

  LogoutUserUsecae(this._authenticationRepository);
  @override
  Future<Either<AppError, void>> call(NoParams params) {
    AuthController authController = Get.find();
    ApiInputParams apiInputParams = authController.getUserDetails();
    return _authenticationRepository.logout(apiInputParams.toMap());
  }
}
