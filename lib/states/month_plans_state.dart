import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/month_plans_model.dart';
import 'package:kasnew/utils/enums.dart';


class MonthPlansState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final MonthPlansModel model;



  const MonthPlansState({
    required this.networkStatusEnum,
    required this.model
  });

  factory MonthPlansState.initial() =>  MonthPlansState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: MonthPlansModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 MonthPlansState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     MonthPlansModel? model}) {
    return MonthPlansState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
