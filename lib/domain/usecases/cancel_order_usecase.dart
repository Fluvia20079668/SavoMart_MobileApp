import 'package:dartz/dartz.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/params/cancel_order_params.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import 'package:get/get.dart';
import '../../presentation/core/auth_wrapper/auth_controller.dart';
import '../repository/data_repository.dart';

class CancelOrderUseCase extends UseCase<Map<String, dynamic>, CancelOrderParam> {
  final DataRepository _dataRepository;

  CancelOrderUseCase(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(CancelOrderParam params) async {
    AuthController authController = Get.find();
    authController.getUser();
    return await _dataRepository.cancelOrder(params.toMap());
  }
}
