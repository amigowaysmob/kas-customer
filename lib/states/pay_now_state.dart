import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/pay_now_model.dart';
import 'package:kasnew/utils/enums.dart';

class PayNowState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final PayNowModel model;



  const PayNowState({
    required this.networkStatusEnum,
    required this.model
  });

  factory PayNowState.initial() =>  PayNowState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: PayNowModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 PayNowState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     PayNowModel? model}) {
    return PayNowState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
