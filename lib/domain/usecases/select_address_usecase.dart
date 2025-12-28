import 'package:dartz/dartz.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/params/select_address_params.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import '../repository/data_repository.dart';

class SelectAddressUseCase extends UseCase<Map<String,dynamic>, SelectAddressParam> {
  final DataRepository _dataRepository;

  SelectAddressUseCase(this._dataRepository);
  @override
  Future<Either<AppError, Map<String,dynamic>>> call(SelectAddressParam params) async {
    Map<String, dynamic> newParams = {};
    newParams.addAll(params.toMap());
    return await _dataRepository.selectAddress(newParams);
  }
}
