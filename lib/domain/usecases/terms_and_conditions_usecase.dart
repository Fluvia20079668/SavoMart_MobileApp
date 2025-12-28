import 'package:dartz/dartz.dart';
import 'package:savomart/domain/params/no_params.dart';
import 'package:get/get.dart';

import '../../presentation/core/auth_wrapper/auth_controller.dart';
import '../entities/app_error.dart';
import '../repository/data_repository.dart';
import 'usecase.dart';

class TermsAndConditionsUseCase
    extends UseCase<Map<String, dynamic>, NoParams> {
  final DataRepository _dataRepository;

  TermsAndConditionsUseCase(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(NoParams params) async {
    AuthController authController = Get.find();
    Map<String, dynamic> newParams = {};
    final apiInputParams = authController.getUserDetails();
    newParams.addAll(apiInputParams.toMap());
    return await _dataRepository.termsAndConditions(newParams);
  }
}
