import 'package:dartz/dartz.dart';
import 'package:savomart/data/model/selected_address_model.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/params/no_params.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import '../repository/data_repository.dart';

class SelectedAddressUseCase extends UseCase<SelectedAddressModel, NoParams> {
  final DataRepository _dataRepository;

  SelectedAddressUseCase(this._dataRepository);
  @override
  Future<Either<AppError, SelectedAddressModel>> call(NoParams params) async {
    Map<String, dynamic> newParams = {};
    return await _dataRepository.selectedAddress(newParams);
  }
}
