import 'package:dartz/dartz.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import '../../presentation/core/auth_wrapper/auth_controller.dart';
import '../repository/data_repository.dart';

class DeleteAddressUsecase
    extends UseCase<Map<String, dynamic>, DeleteParam> {
  final DataRepository _dataRepository;

  DeleteAddressUsecase(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      DeleteParam params) async {
    AuthController authController = Get.find();
     Map<String, dynamic> newParams = {};
    final apiInputParams = authController.getUserDetails();
    newParams.addAll(apiInputParams.toMap());
    newParams.addAll(params.toMap());
    return await _dataRepository.deleteAddress(newParams);
  }
}

class DeleteParam extends Equatable {
  final String addressId;

  const DeleteParam({required this.addressId});

  @override
  List<Object?> get props => [];

  Map<String, dynamic> toMap() {
    return {'address_id': addressId};
  }
}
