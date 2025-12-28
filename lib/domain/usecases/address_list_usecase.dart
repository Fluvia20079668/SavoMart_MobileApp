import 'package:dartz/dartz.dart';
import 'package:savomart/data/model/address_list_model.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/params/no_params.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import 'package:get/get.dart';
import '../../presentation/core/auth_wrapper/auth_controller.dart';
import '../repository/data_repository.dart';

class AddressListUseCase extends UseCase<AddressListModel, NoParams> {
  final DataRepository _dataRepository;

  AddressListUseCase(this._dataRepository);
  @override
  Future<Either<AppError, AddressListModel>> call(NoParams params) async {
    
    AuthController authController = Get.find();
    authController.getUser();
   
    Map<String, dynamic> newParams = {};
    return await _dataRepository.getaddress(newParams);
  }
}
