import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/plan_group_code_model.dart';
import 'package:kasnew/utils/enums.dart';

class PlanGroupCodeState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final PlanGroupCodeModel model;



  const PlanGroupCodeState({
    required this.networkStatusEnum,
    required this.model
  });

  factory PlanGroupCodeState.initial() =>  PlanGroupCodeState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: PlanGroupCodeModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 PlanGroupCodeState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     PlanGroupCodeModel? model}) {
    return PlanGroupCodeState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
