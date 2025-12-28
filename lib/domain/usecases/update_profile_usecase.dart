import 'package:dartz/dartz.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import '../../presentation/core/auth_wrapper/auth_controller.dart';
import '../repository/auth_repository.dart';


class UpdateProfileUsecase extends UseCase<Map<String, dynamic>, UpdateProfileParams> {
  final AuthenticationRepository _authenticationRepository;

  UpdateProfileUsecase(this._authenticationRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(UpdateProfileParams params) async {
    AuthController authController = Get.find();
    Map<String, dynamic> newParams = {};
    final apiInputParams = authController.getUserDetails();
    newParams.addAll(apiInputParams.toMap());
    newParams.addAll(params.toMap());
    return await _authenticationRepository.updateUser(newParams);
  }
}


class UpdateProfileParams extends Equatable {
  final String firstName;
  final String email;
  final String phone;

  const UpdateProfileParams(
      {required this.firstName, required this.email, required this.phone});

  Map<String, dynamic> toMap() {
    return {"first_name": firstName, "email": email, "phone": phone};
  }

  @override
  List<Object?> get props => [];
}
