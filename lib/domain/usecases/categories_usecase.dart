import 'package:dartz/dartz.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/params/no_params.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import 'package:get/get.dart';
import '../../data/model/categorie_model.dart';
import '../../presentation/core/auth_wrapper/auth_controller.dart';
import '../repository/data_repository.dart';

class CategoriesUsecase extends UseCase<CategorieModel, NoParams> {
  final DataRepository _dataRepository;

  CategoriesUsecase(this._dataRepository);
  @override
  Future<Either<AppError, CategorieModel>> call(NoParams params) async {
    AuthController authController = Get.find();
    authController.getUser();
    var languageParam = authController.getUserDetails();
    Map<String, dynamic> newParams = {};
    newParams.addAll(languageParam.toMap());
    return await _dataRepository.getCategories(newParams);
  }
}
