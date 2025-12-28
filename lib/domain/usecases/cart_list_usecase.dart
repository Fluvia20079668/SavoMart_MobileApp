import 'package:dartz/dartz.dart';
import 'package:savomart/data/model/cart_list_model.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/params/no_params.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import 'package:get/get.dart';
import '../../presentation/core/auth_wrapper/auth_controller.dart';
import '../repository/data_repository.dart';

class CartListUsecase extends UseCase<CartListModel, NoParams> {
  final DataRepository _dataRepository;

  CartListUsecase(this._dataRepository);
  @override
  Future<Either<AppError, CartListModel>> call(NoParams params) async {
    AuthController authController = Get.find();
    var languageparam=authController.getUserDetails();
    authController.getUser();
    Map<String, dynamic> newParams = {};
    newParams.addAll(languageparam.toMap());
    return await _dataRepository.getcartlist(newParams);
  }
}
