import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/pay_othres_model.dart';
import 'package:kasnew/utils/enums.dart';

class PayOthersState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final PayOthersModel model;



  const PayOthersState({
    required this.networkStatusEnum,
    required this.model
  });

  factory PayOthersState.initial() =>  PayOthersState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: PayOthersModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 PayOthersState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     PayOthersModel? model}) {
    return PayOthersState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
