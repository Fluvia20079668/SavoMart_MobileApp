
import 'package:equatable/equatable.dart';

class RegisterParam extends Equatable {
  final String firstname;
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;

  const RegisterParam(
      {required this.firstname,
      required this.email,
      required this.phone,
      required this.password,
      required this.confirmPassword});

  Map<String, dynamic> toMap() {
    return {
      "first_name": firstname,
      "email": email,
      "phone": phone,
      "register_password":password,
      "confirm_password":confirmPassword
    };
  }

  @override
  List<Object?> get props => [];
}
