import 'package:dartz/dartz.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/params/remove_cart_param.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import '../repository/data_repository.dart';

class RemoveCartItemUseCase extends UseCase<Map<String, dynamic>, RemoveCartParam> {
  final DataRepository _dataRepository;

  RemoveCartItemUseCase(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(RemoveCartParam params) async {
    Map<String, dynamic> newParams = {};
    newParams.addAll(params.toMap());
    return await _dataRepository.removeCartItem(newParams);
  }
}
