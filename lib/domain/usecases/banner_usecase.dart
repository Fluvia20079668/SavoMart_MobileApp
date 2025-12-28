import 'package:dartz/dartz.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/params/no_params.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import 'package:get/get.dart';
import '../../data/model/banner_model.dart';
import '../../presentation/core/auth_wrapper/auth_controller.dart';
import '../repository/data_repository.dart';

class BannerUsecase extends UseCase<BannerModel, NoParams> {
  final DataRepository _dataRepository;

  BannerUsecase(this._dataRepository);
  @override
  Future<Either<AppError, BannerModel>> call(NoParams params) async {
    AuthController authController = Get.find();
    authController.getUser();
     Map<String, dynamic> newParams = {};
    return await _dataRepository.getBanner(newParams);
  }
}
