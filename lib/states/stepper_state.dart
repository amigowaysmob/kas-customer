import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/stepper_model.dart';

import 'package:kasnew/utils/enums.dart';


class StepperState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final StepperModel model;



  const StepperState({
    required this.networkStatusEnum,
    required this.model
  });

  factory StepperState.initial() =>  StepperState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: StepperModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 StepperState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     StepperModel? model}) {
    return StepperState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
