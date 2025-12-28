import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

import '../../presentation/core/auth_wrapper/auth_controller.dart';
import '../entities/app_error.dart';
import '../repository/data_repository.dart';

class OrderReturnUseCase
    extends UseCase<Map<String, dynamic>, OrderReturnParms> {
  final DataRepository _dataRepository;

  OrderReturnUseCase(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      OrderReturnParms params) async {
    AuthController authController = Get.find();
    Map<String, dynamic> newParams = {};
    final apiInputParams = authController.getUserDetails();
    newParams.addAll(apiInputParams.toMap());
    newParams.addAll(params.toMap());
    return await _dataRepository.orderReturn(newParams, params.images);
  }
}

class OrderReturnParms extends Equatable {
  final String orderItemId;
  final String productId;
  final String location;
  final String reason;
  final List<File>? images;

  const OrderReturnParms(
      {required this.orderItemId,
      required this.productId,
      required this.location,
      required this.reason,
      this.images});

  Map<String, dynamic> toMap() {
    return {
      "order_item_id": orderItemId,
      "product_id": productId,
      "location": location,
      "reason": reason,
    };
  }

  @override
  List<Object?> get props => [orderItemId, productId, location, reason, images];
}
