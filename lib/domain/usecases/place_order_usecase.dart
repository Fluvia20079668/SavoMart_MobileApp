import 'package:dartz/dartz.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import 'package:savomart/presentation/core/auth_wrapper/auth_controller.dart';
import 'package:get/get.dart';

import '../params/place_order_params.dart';
import '../repository/data_repository.dart';

class PlaceOrderUseCase extends UseCase<Map<String, dynamic>, OrderParams> {
  final DataRepository _dataRepository;

  PlaceOrderUseCase(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(OrderParams params) {
    AuthController authController = Get.find();
    authController.getUser();
    return _dataRepository.placeOrder(params.toMap());
  }
}
