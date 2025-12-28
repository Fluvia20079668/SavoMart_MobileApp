import 'package:dartz/dartz.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import 'package:get/get.dart';
import '../../data/model/product_details.dart';
import '../../presentation/core/auth_wrapper/auth_controller.dart';
import '../params/product_params.dart';
import '../repository/data_repository.dart';

class ProductDetailsUsecase
    extends UseCase<ProductDetailsModel, ProductParams> {
  final DataRepository _dataRepository;

  ProductDetailsUsecase(this._dataRepository);
  @override
  Future<Either<AppError, ProductDetailsModel>> call(
      ProductParams params) async {
    AuthController authController = Get.find();

    authController.getUser();
    var languageparam= authController.getUserDetails();
    Map<String, dynamic> newParams = {};
    newParams.addAll(params.toMap());
    newParams.addAll(languageparam.toMap());
    return await _dataRepository.getProductDetails(newParams);
  }
}
