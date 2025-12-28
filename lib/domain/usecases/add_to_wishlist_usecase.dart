import 'package:dartz/dartz.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import 'package:get/get.dart';
import '../../presentation/core/auth_wrapper/auth_controller.dart';
import '../params/wishlist_params.dart';
import '../repository/data_repository.dart';

class AddToWishListUseCase
    extends UseCase<Map<String, dynamic>, WhishListParam> {
  final DataRepository _dataRepository;

  AddToWishListUseCase(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      WhishListParam params) async {
    AuthController authController = Get.find();
    authController.getUser();
    return await _dataRepository.addToWishlist(params.toMap());
  }
}
