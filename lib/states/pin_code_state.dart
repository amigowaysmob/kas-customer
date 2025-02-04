import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/pin_code_model.dart';
import 'package:kasnew/utils/enums.dart';


class PincodeState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final PincodeModel model;



  const PincodeState({
    required this.networkStatusEnum,
    required this.model
  });

  factory PincodeState.initial() => PincodeState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: PincodeModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 PincodeState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     PincodeModel? model}) {
    return PincodeState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
