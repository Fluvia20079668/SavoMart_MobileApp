import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String firstname;
  final String? lastName;
  final String userId;
  final String phone;
  final String email;
  final String? sessionId;

  const UserEntity({
    required this.firstname,
    required this.lastName,
    required this.email,
    required this.userId,
    required this.phone,
    required this.sessionId,
  });

  factory UserEntity.fromJson(Map<String, dynamic> userJson) {
    return UserEntity(
      firstname: userJson["first_name"],
      lastName: userJson["last_name"],
      userId: userJson["id"],
      phone: userJson["phone"],
      email: userJson["email"],
      sessionId: userJson["access_token"],
    );
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> userJson = {};
    userJson.addAll({
      "first_name": firstname,
      "last_name": lastName,
      "id": userId,
      "phone": phone,
      "email": email,
      "access_token": sessionId,
    });
    return userJson;
  }

  @override
  List<Object?> get props => [];
}




