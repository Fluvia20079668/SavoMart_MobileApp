import 'package:dartz/dartz.dart';
import 'package:savomart/data/model/search_result_list_model.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import '../../presentation/core/auth_wrapper/auth_controller.dart';
import '../repository/data_repository.dart';

class ProductSearchUsecase
    extends UseCase<SearchResultListModel, ProductSearchParams> {
  final DataRepository _dataRepository;

  ProductSearchUsecase(this._dataRepository);
  @override
  Future<Either<AppError, SearchResultListModel>> call(
      ProductSearchParams params) async {
    AuthController authController = Get.find();
    Map<String, dynamic> newParams = {};
    final apiInputParams = authController.getUserDetails();
    newParams.addAll(apiInputParams.toMap());
    newParams.addAll(params.toMap());
    return await _dataRepository.searchResult(newParams);
  }
}

class ProductSearchParams extends Equatable {
  final String searchKey;

  const ProductSearchParams({required this.searchKey});

  Map<String, dynamic> toMap() {
    return {"term": searchKey};
  }

  @override
  List<Object?> get props => [];
}
