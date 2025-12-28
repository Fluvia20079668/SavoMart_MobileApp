import 'package:dartz/dartz.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/params/register_params.dart';
import 'package:savomart/domain/repository/auth_repository.dart';
import 'package:savomart/domain/usecases/usecase.dart';

class RegisterUsecase extends UseCase<Map<String, dynamic>, RegisterParam> {
  final AuthenticationRepository _authenticationRepository;

  RegisterUsecase(this._authenticationRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(RegisterParam params) async {
    return await _authenticationRepository.register(params.toMap());
  }
}
