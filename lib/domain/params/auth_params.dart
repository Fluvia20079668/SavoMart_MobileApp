
import 'package:equatable/equatable.dart';

class AuthParams extends Equatable {
  final String phone;
  final String password;
  final String deviceIdentity;

  const AuthParams(
      {required this.phone,
      required this.password,
      required this.deviceIdentity});

  Map<String, dynamic> toMap() {
    return {
      "deviceIdentity": deviceIdentity,
      "phone": phone,
      "password": password
    };
  }

  @override
  List<Object?> get props => [];
}
