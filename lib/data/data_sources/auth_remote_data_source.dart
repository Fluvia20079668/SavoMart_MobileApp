import 'package:savomart/data/core/api_client.dart';
import 'package:savomart/data/core/api_constants.dart';

abstract class AuthenticationRemoteDataSource {
  Future<Map<String, dynamic>> login(Map<String, dynamic> params);
  logout(Map<String, dynamic> params);
  Future<Map<String, dynamic>> register(Map<String, dynamic> params);
  Future<Map<String, dynamic>> updateUser(Map<String, dynamic> params);
  Future<Map<String, dynamic>> changePassword(Map<String, dynamic> params);
  Future<Map<String, dynamic>> generateOTP(Map<String, dynamic> params);
  Future<Map<String, dynamic>> verifyOTP(Map<String, dynamic> params);
  Future<Map<String, dynamic>> forgotPassword(Map<String, dynamic> params);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final ApiClient _apiClient;
  AuthenticationRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Map<String, dynamic>> login(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.login, params);
    return response;
  }

  @override
  logout(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.logout, params);
    return response;
  }

  @override
  register(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.register, params);
    return response;
  }

  @override
  Future<Map<String, dynamic>> updateUser(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.updateProfile, params);
    return response;
  }

  @override
  Future<Map<String, dynamic>> changePassword(
      Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.changePassword, params);
    return response;
  }

  @override
  Future<Map<String, dynamic>> generateOTP(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.generateOtp, params);
    return response;
  }

  @override
  Future<Map<String, dynamic>> verifyOTP(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.verifyOtp, params);
    return response;
  }

  @override
  Future<Map<String, dynamic>> forgotPassword(
      Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.forgotPassword, params);
    return response;
  }

  // @override
  // Future<VerifyOtpResponse> verifyOtpLogin(Map<String, dynamic> params) async {
  //   final response = await _apiClient.post(ApiConstants.verifyOtpLogin, params);
  //   if (response["status"] == 1) {
  //     return VerifyOtpResponse.fromJson(response);
  //   } else {
  //     return VerifyOtpResponse(status: 0, message: response["message"]);
  //   }
  // }
}
