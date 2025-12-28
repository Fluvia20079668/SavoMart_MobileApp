import 'package:dartz/dartz.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/params/auth_params.dart';
import 'package:savomart/domain/repository/auth_repository.dart';
import 'package:savomart/domain/usecases/usecase.dart';

class LoginUserUsecase extends UseCase<Map<String, dynamic>, AuthParams> {
  final AuthenticationRepository _authenticationRepository;

  LoginUserUsecase(this._authenticationRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(AuthParams params) async {
    return await _authenticationRepository.login(params.toMap());
  }
}
