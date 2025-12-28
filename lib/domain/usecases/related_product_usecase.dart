import 'package:dartz/dartz.dart';
import 'package:savomart/data/model/related_product_list_model.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import '../../presentation/core/auth_wrapper/auth_controller.dart';
import '../repository/data_repository.dart';

class RelatedProductUsecase extends UseCase<RelatedProductListModel, RelatedProductParams> {
  final DataRepository _dataRepository;

  RelatedProductUsecase(this._dataRepository);
  @override
  Future<Either<AppError, RelatedProductListModel>> call(RelatedProductParams params) async {
    AuthController authController = Get.find();
   Map<String, dynamic> newParams = {};
    final apiInputParams = authController.getUserDetails();
    newParams.addAll(apiInputParams.toMap());
    newParams.addAll(params.toMap());
    return await _dataRepository.getRelatedProducts(newParams);
  }
}

class RelatedProductParams extends Equatable{
  final String productId;

  const RelatedProductParams({required this.productId});

  Map<String,dynamic> toMap(){
    return{
      "product_id":productId
    };
  }

  @override
  List<Object?> get props => [];

}
