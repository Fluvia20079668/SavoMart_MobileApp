import 'package:dartz/dartz.dart';
import 'package:savomart/data/model/oder_details_model.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import 'package:get/get.dart';
import '../../presentation/core/auth_wrapper/auth_controller.dart';
import '../params/order_details_params.dart';
import '../repository/data_repository.dart';

class OrderDetailsUsecase
    extends UseCase<OrderDetailsModel, OrderDetailsParams> {
  final DataRepository _dataRepository;

  OrderDetailsUsecase(this._dataRepository);
  @override
  Future<Either<AppError, OrderDetailsModel>> call(
      OrderDetailsParams params) async {
    AuthController authController = Get.find();

    authController.getUser();
    var languageparam= authController.getUserDetails();
    Map<String, dynamic> newParams = {};
    newParams.addAll(params.toMap());
    newParams.addAll(languageparam.toMap());
    return await _dataRepository.oderdetails(newParams);
  }
}
