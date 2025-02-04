import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/payment_status_model.dart';
import 'package:kasnew/utils/enums.dart';

class PaymentStatusState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final PaymentStatusModel model;



  const PaymentStatusState({
    required this.networkStatusEnum,
    required this.model
  });

  factory PaymentStatusState.initial() =>  PaymentStatusState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: PaymentStatusModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 PaymentStatusState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     PaymentStatusModel? model}) {
    return PaymentStatusState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
