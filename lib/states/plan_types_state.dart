import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/plan_types_model.dart';
import 'package:kasnew/utils/enums.dart';


class PlanTypesState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final PlanTypesModel model;



  const PlanTypesState({
    required this.networkStatusEnum,
    required this.model
  });

  factory PlanTypesState.initial() => PlanTypesState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: PlanTypesModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 PlanTypesState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     PlanTypesModel? model}) {
    return PlanTypesState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
