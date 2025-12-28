import 'package:dartz/dartz.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/params/no_params.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import '../../data/model/wish_list_model.dart';
import '../repository/data_repository.dart';

class WishListUseCase extends UseCase<WhishListModel, NoParams> {
  final DataRepository _dataRepository;

  WishListUseCase(this._dataRepository);
  @override
  Future<Either<AppError, WhishListModel>> call(NoParams params) async {
    Map<String, dynamic> newParams = {};

    return await _dataRepository.wishList(newParams);
  }
}
