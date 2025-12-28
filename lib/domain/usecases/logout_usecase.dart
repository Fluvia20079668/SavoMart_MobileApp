import 'package:dartz/dartz.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/params/no_params.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import '../repository/data_repository.dart';

class LogOutUseCase extends UseCase<Map<String, dynamic>, NoParams> {
  final DataRepository _dataRepository;

  LogOutUseCase(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(NoParams params) async {
    Map<String, dynamic> newParams = {};
    return await _dataRepository.logout(newParams);
  }
}
