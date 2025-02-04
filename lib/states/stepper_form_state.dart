import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/stepper_form_model.dart';

import 'package:kasnew/utils/enums.dart';

class StepperFormState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final StepperFormModel model;



  const StepperFormState({
    required this.networkStatusEnum,
    required this.model
  });

  factory StepperFormState.initial() =>  StepperFormState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: StepperFormModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 StepperFormState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     StepperFormModel? model}) {
    return StepperFormState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
