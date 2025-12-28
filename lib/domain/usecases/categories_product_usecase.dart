import 'package:dartz/dartz.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import 'package:get/get.dart';
import '../../data/model/categories_withproduct_model.dart';
import '../../presentation/core/auth_wrapper/auth_controller.dart';
import '../params/home_category_product_param.dart';
import '../repository/data_repository.dart';

class CategoriesWithProductUsecase
    extends UseCase<CategorieWithProductModel, HomeCategoriesParams> {
  final DataRepository _dataRepository;
  CategoriesWithProductUsecase(this._dataRepository);
  @override
  Future<Either<AppError, CategorieWithProductModel>> call(
      HomeCategoriesParams params) async {
    AuthController authController = Get.find();
    authController.getUser();
    var languageparam = authController.getUserDetails();
    Map<String, dynamic> newParams = {};
    newParams.addAll(params.toMap());
    newParams.addAll(languageparam.toMap());
    return await _dataRepository.getCategoriesWithProduct(newParams);
  }
}
