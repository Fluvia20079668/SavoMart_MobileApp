import 'dart:io';

import 'package:savomart/data/core/api_client.dart';
import 'package:savomart/data/core/api_constants.dart';
import 'package:savomart/data/model/address_list_model.dart';
import 'package:savomart/data/model/cart_list_model.dart';
import 'package:savomart/data/model/oder_details_model.dart';
import 'package:savomart/data/model/order_list.dart';
import 'package:savomart/data/model/product_with_id_category_id_model.dart';
import 'package:savomart/data/model/related_product_list_model.dart';
import 'package:savomart/data/model/search_result_list_model.dart';
import 'package:savomart/data/model/selected_address_model.dart';
import '../model/banner_model.dart';
import '../model/categorie_model.dart';
import '../model/categories_withproduct_model.dart';
import '../model/product_details.dart';
import '../model/wish_list_model.dart';

abstract class RemoteDataSource {
  Future<Map<String, dynamic>> selectAddress(Map<String, dynamic> params);
  Future<SelectedAddressModel> selectedAddress(Map<String, dynamic> params);
  Future<Map<String, dynamic>> addToWishlist(Map<String, dynamic> params);
  Future<CartListModel> getcartlist(Map<String, dynamic> params);
  Future<Map<String, dynamic>> addaddress(Map<String, dynamic> params);
  Future<Map<String, dynamic>> placeOrder(Map<String, dynamic> params);
  Future<Map<String, dynamic>> addToCart(Map<String, dynamic> params);
  Future<BannerModel> getBanner(Map<String, dynamic> params);
  Future<CategorieModel> getCategories(Map<String, dynamic> params);
  Future<ProductDetailsModel> getProductDetails(Map<String, dynamic> params);
  Future<CategorieWithProductModel> getCategoriesWithProduct(
      Map<String, dynamic> params);
  Future<ProductWithCategorieIdModel> getProductWithCategoryId(
      Map<String, dynamic> params);
  Future<WhishListModel> wishList(Map<String, dynamic> params);
  Future<AddressListModel> getaddress(Map<String, dynamic> params);
  Future<Map<String, dynamic>> logout(Map<String, dynamic> params);
  Future<Map<String, dynamic>> cancelOrder(Map<String, dynamic> params);
  Future<Map<String, dynamic>> removeCartItem(Map<String, dynamic> params);
  Future<OrderListModel> orderList(Map<String, dynamic> params);
  Future<OrderDetailsModel> oderdetails(Map<String, dynamic> params);
  Future<Map<String, dynamic>> orderReturn(
      Map<String, dynamic> params, List<File>? map);
  Future<Map<String, dynamic>> updateAddress(Map<String, dynamic> params);
  Future<Map<String, dynamic>> deleteAddress(Map<String, dynamic> params);
  Future<RelatedProductListModel> getRelatedProducts(
      Map<String, dynamic> params);
  Future<SearchResultListModel> searchResult(Map<String, dynamic> params);
  Future<Map<String, dynamic>> uploadProfile(
      Map<String, dynamic> newParams, Map<String, File>? map);
  Future<Map<String, dynamic>> termsAndConditions(Map<String, dynamic> params);
  Future<Map<String, dynamic>> userInfo(Map<String, dynamic> params);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final ApiClient _apiClient;

  RemoteDataSourceImpl(this._apiClient);
  @override
  Future<Map<String, dynamic>> selectAddress(
      Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.selectAddress, params);
    return response;
  }

  @override
  Future<SelectedAddressModel> selectedAddress(
      Map<String, dynamic> params) async {
    final response = await _apiClient.get(ApiConstants.selectedAddress);
    return SelectedAddressModel.fromJson(response);
  }

  @override
  Future<Map<String, dynamic>> addaddress(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.addAddress, params);
    return response;
  }

  @override
  Future<Map<String, dynamic>> placeOrder(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.placeOrder, params);
    return response;
  }

  @override
  Future<OrderDetailsModel> oderdetails(Map<String, dynamic> params) async {
    final response = await _apiClient.get(ApiConstants.orderDetails +
        "?order_id=${params["order_id"]}&language_type=${params["language_type"]}");
    return OrderDetailsModel.fromJson(response);
  }

  @override
  Future<Map<String, dynamic>> removeCartItem(
      Map<String, dynamic> params) async {
    final response = await _apiClient.get(
        "${ApiConstants.removeCartItem}?product_id=${params["product_id"]}");
    return response;
  }

  @override
  Future<Map<String, dynamic>> cancelOrder(Map<String, dynamic> params) async {
    final response = await _apiClient
        .get(ApiConstants.cancelorder + "?order_id=${params["order_id"]}");
    return response;
  }

  @override
  Future<CartListModel> getcartlist(Map<String, dynamic> params) async {
    final response = await _apiClient.get(
        ApiConstants.cartlist + "?language_type=${params["language_type"]}");
    return CartListModel.fromJson(response);
  }

  @override
  Future<OrderListModel> orderList(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.orderList, params);
    return OrderListModel.fromJson(response);
  }

  @override
  Future<AddressListModel> getaddress(Map<String, dynamic> params) async {
    final response = await _apiClient.get(ApiConstants.addresslist);
    return AddressListModel.fromJson(response);
  }

  @override
  Future<Map<String, dynamic>> addToWishlist(
      Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.addToWishlist, params);
    return response;
  }

  @override
  Future<ProductWithCategorieIdModel> getProductWithCategoryId(
      Map<String, dynamic> params) async {
    final response =
        await _apiClient.post(ApiConstants.getProductWithCategory, params);
    return ProductWithCategorieIdModel.fromJson(response);
  }

  @override
  Future<Map<String, dynamic>> addToCart(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.addToCart, params);
    return response;
  }

  @override
  Future<BannerModel> getBanner(Map<String, dynamic> params) async {
    final response = await _apiClient.get(ApiConstants.bannerlist);
    return BannerModel.fromJson(response);
  }

  @override
  Future<CategorieModel> getCategories(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.categorielist, params);
    return CategorieModel.fromJson(response);
  }

  @override
  Future<Map<String, dynamic>> logout(Map<String, dynamic> params) async {
    final response = await _apiClient.get(ApiConstants.categorielist);
    return response;
  }

  @override
  Future<CategorieWithProductModel> getCategoriesWithProduct(
      Map<String, dynamic> params) async {
    final response =
        await _apiClient.post(ApiConstants.categoriewithproductlist, params);
    return CategorieWithProductModel.fromJson(response);
  }

  @override
  Future<ProductDetailsModel> getProductDetails(
      Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.productDetails, params);
    return ProductDetailsModel.fromJson(response);
  }

  @override
  Future<WhishListModel> wishList(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.wishlist, params);
    return WhishListModel.fromJson(response);
  }

  @override
  Future<Map<String, dynamic>> orderReturn(
      Map<String, dynamic> params, List<File>? map) async {
    final response = await _apiClient.formDataMultiple(
        data: params, images: map!, path: ApiConstants.returnOrderItem);
    return response;
  }

  @override
  Future<Map<String, dynamic>> updateAddress(
      Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.editAddress, params);
    return response;
  }

  @override
  Future<Map<String, dynamic>> deleteAddress(
      Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.deleteAddress, params);
    return response;
  }

  @override
  Future<RelatedProductListModel> getRelatedProducts(
      Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.relatedProduct, params);
    return RelatedProductListModel.fromJson(response);
  }

  @override
  Future<SearchResultListModel> searchResult(
      Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.productSearch, params);
    return SearchResultListModel.fromJson(response);
  }

  @override
  Future<Map<String, dynamic>> uploadProfile(
      Map<String, dynamic> newParams, Map<String, File>? map) async {
    final response = await _apiClient.formData(
        data: newParams, images: map!, path: ApiConstants.uploadProfilePic);
    return response;
  }

  @override
  Future<Map<String, dynamic>> termsAndConditions(
      Map<String, dynamic> params) async {
    final response =
        await _apiClient.get(ApiConstants.termsAndConditions, params: params);
    return response;
  }

  @override
  Future<Map<String, dynamic>> userInfo(Map<String, dynamic> params) async {
    final response =
        await _apiClient.get(ApiConstants.userInfo, params: params);
    return response;
  }
}
