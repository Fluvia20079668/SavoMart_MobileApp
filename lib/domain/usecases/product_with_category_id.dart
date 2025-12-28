import 'package:dartz/dartz.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import 'package:get/get.dart';
import '../../data/model/product_with_id_category_id_model.dart';
import '../../presentation/core/auth_wrapper/auth_controller.dart';
import '../params/category_params.dart';
import '../repository/data_repository.dart';

class ProductWithCategoryIdUseCase
    extends UseCase<ProductWithCategorieIdModel, CategoriesParams> {
  final DataRepository _dataRepository;
  ProductWithCategoryIdUseCase(this._dataRepository);
  @override
  Future<Either<AppError, ProductWithCategorieIdModel>> call(
      CategoriesParams params) async {
    AuthController authController = Get.find();
    authController.getUser();
    var languageparam=authController.getUserDetails();
    Map<String, dynamic> newParams = {};
    newParams.addAll(params.toMap());
    newParams.addAll(languageparam.toMap());
    return await _dataRepository.getProductWithCategoryId(newParams);
  }
}
