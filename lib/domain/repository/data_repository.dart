import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:savomart/data/model/address_list_model.dart';
import 'package:savomart/data/model/order_list.dart';
import 'package:savomart/data/model/related_product_list_model.dart';
import 'package:savomart/data/model/selected_address_model.dart';
import 'package:savomart/domain/entities/app_error.dart';

import '../../data/model/banner_model.dart';
import '../../data/model/cart_list_model.dart';
import '../../data/model/categorie_model.dart';
import '../../data/model/categories_withproduct_model.dart';
import '../../data/model/oder_details_model.dart';
import '../../data/model/product_details.dart';
import '../../data/model/product_with_id_category_id_model.dart';
import '../../data/model/search_result_list_model.dart';
import '../../data/model/wish_list_model.dart';

abstract class DataRepository {
  Future<Either<AppError, Map<String, dynamic>>> selectAddress(
      Map<String, dynamic> params);
  Future<Either<AppError, SelectedAddressModel>> selectedAddress(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> addToWishlist(
      Map<String, dynamic> params);
  Future<Either<AppError, CartListModel>> getcartlist(
      Map<String, dynamic> params);
  Future<Either<AppError, OrderListModel>> orderList(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> placeOrder(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> addaddress(
      Map<String, dynamic> params);
  Future<Either<AppError, BannerModel>> getBanner(Map<String, dynamic> params);
  Future<Either<AppError, CategorieModel>> getCategories(
      Map<String, dynamic> params);
  Future<Either<AppError, CategorieWithProductModel>> getCategoriesWithProduct(
      Map<String, dynamic> params);
  Future<Either<AppError, ProductDetailsModel>> getProductDetails(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> addToCart(
      Map<String, dynamic> params);
  Future<Either<AppError, WhishListModel>> wishList(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> logout(
      Map<String, dynamic> params);
  Future<Either<AppError, AddressListModel>> getaddress(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> removeCartItem(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> cancelOrder(
      Map<String, dynamic> params);
  Future<Either<AppError, ProductWithCategorieIdModel>>
      getProductWithCategoryId(Map<String, dynamic> params);
  Future<Either<AppError, OrderDetailsModel>> oderdetails(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> orderReturn(
      Map<String, dynamic> params, List<File>? images);
  Future<Either<AppError, Map<String, dynamic>>> updateAddress(
      Map<String, dynamic> map);
  Future<Either<AppError, Map<String, dynamic>>> deleteAddress(
      Map<String, dynamic> params);
  Future<Either<AppError, RelatedProductListModel>> getRelatedProducts(
      Map<String, dynamic> params);
  Future<Either<AppError, SearchResultListModel>> searchResult(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> uploadProfile(
      Map<String, dynamic> newParams, Map<String, File>? images);
  Future<Either<AppError, Map<String, dynamic>>> termsAndConditions(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String, dynamic>>> userInfo(
      Map<String, dynamic> params);
}
