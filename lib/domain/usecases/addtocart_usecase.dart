import 'package:dartz/dartz.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import 'package:get/get.dart';
import '../../presentation/core/auth_wrapper/auth_controller.dart';
import '../params/add_to_cart_params.dart';
import '../repository/data_repository.dart';

class AddToCartUsecase extends UseCase<Map<String, dynamic>, AddToCartParam> {
  final DataRepository _dataRepository;

  AddToCartUsecase(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(AddToCartParam params) async {
    AuthController authController = Get.find();
    authController.getUser();
    return await _dataRepository.addToCart(params.toMap());
  }
}
