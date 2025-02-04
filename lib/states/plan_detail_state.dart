import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/plan_detail_model.dart';
import 'package:kasnew/utils/enums.dart';

class PlanDetailState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final PlanDetailModel model;



  const PlanDetailState({
    required this.networkStatusEnum,
    required this.model
  });

  factory PlanDetailState.initial() => PlanDetailState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: PlanDetailModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 PlanDetailState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     PlanDetailModel? model}) {
    return PlanDetailState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
