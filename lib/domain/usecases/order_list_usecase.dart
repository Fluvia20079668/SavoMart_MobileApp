import 'package:dartz/dartz.dart';
import 'package:savomart/data/model/order_list.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/params/no_params.dart';
import 'package:savomart/domain/usecases/usecase.dart';
import '../repository/data_repository.dart';

class OrderListUseCase extends UseCase<OrderListModel, NoParams> {
  final DataRepository _dataRepository;

  OrderListUseCase(this._dataRepository);
  @override
  Future<Either<AppError, OrderListModel>> call(NoParams params) async {
    Map<String, dynamic> newParams = {};

    return await _dataRepository.orderList(newParams);
  }
}
