import 'package:dartz/dartz.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/params/addaddressparams.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import 'package:get/get.dart';
import '../../presentation/core/auth_wrapper/auth_controller.dart';
import '../repository/data_repository.dart';

class UpdateAddressUsecase
    extends UseCase<Map<String, dynamic>, AddAddressParam> {
  final DataRepository _dataRepository;

  UpdateAddressUsecase(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      AddAddressParam params) async {
    AuthController authController = Get.find();
    authController.getUser();
    return await _dataRepository.updateAddress(params.toMap());
  }
}


