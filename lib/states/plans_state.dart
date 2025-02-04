import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/plans_model.dart';
import 'package:kasnew/utils/enums.dart';

class PlansState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final PlansModel model;



  const PlansState({
    required this.networkStatusEnum,
    required this.model
  });

  factory PlansState.initial() =>  PlansState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: PlansModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 PlansState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     PlansModel? model}) {
    return PlansState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
