import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:savomart/data/model/address_list_model.dart';
import 'package:savomart/data/model/cart_list_model.dart';
import 'package:savomart/data/model/oder_details_model.dart';
import 'package:savomart/data/model/order_list.dart';
import 'package:savomart/data/model/product_with_id_category_id_model.dart';
import 'package:savomart/data/model/related_product_list_model.dart';
import 'package:savomart/data/model/search_result_list_model.dart';
import 'package:savomart/data/model/selected_address_model.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:savomart/data/data_sources/remote_data_source.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/repository/data_repository.dart';
import '../model/banner_model.dart';
import '../model/categorie_model.dart';
import '../model/categories_withproduct_model.dart';
import '../model/product_details.dart';
import '../model/wish_list_model.dart';

class DataRepositoryImpl extends DataRepository {
  final RemoteDataSource _remoteDataSource;

  DataRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<AppError, Map<String, dynamic>>> selectAddress(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.selectAddress(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, SelectedAddressModel>> selectedAddress(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.selectedAddress(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, ProductWithCategorieIdModel>>
      getProductWithCategoryId(Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.getProductWithCategoryId(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, OrderDetailsModel>> oderdetails(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.oderdetails(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> cancelOrder(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.cancelOrder(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> addaddress(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.addaddress(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> removeCartItem(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.removeCartItem(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> placeOrder(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.placeOrder(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, CartListModel>> getcartlist(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.getcartlist(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, OrderListModel>> orderList(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.orderList(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, AddressListModel>> getaddress(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.getaddress(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> addToWishlist(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.addToWishlist(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, BannerModel>> getBanner(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.getBanner(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, CategorieModel>> getCategories(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.getCategories(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, CategorieWithProductModel>> getCategoriesWithProduct(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.getCategoriesWithProduct(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, ProductDetailsModel>> getProductDetails(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.getProductDetails(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> addToCart(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.addToCart(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, WhishListModel>> wishList(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.wishList(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> logout(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.logout(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> orderReturn(
      Map<String, dynamic> params, List<File>? images) async {
    try {
      final response =
          await _remoteDataSource.orderReturn(params, images ?? []);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> updateAddress(
      Map<String, dynamic> map) async {
    try {
      final response = await _remoteDataSource.updateAddress(map);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> deleteAddress(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.deleteAddress(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, RelatedProductListModel>> getRelatedProducts(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.getRelatedProducts(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, SearchResultListModel>> searchResult(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.searchResult(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> uploadProfile(
      Map<String, dynamic> newParams, Map<String, File>? images) async {
    try {
      final response =
          await _remoteDataSource.uploadProfile(newParams, images ?? {});
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> termsAndConditions(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.termsAndConditions(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> userInfo(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.userInfo(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
}
