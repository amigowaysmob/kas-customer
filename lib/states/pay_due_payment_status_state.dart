import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/pay_due_payment_status.dart';
import 'package:kasnew/utils/enums.dart';

class DuePaymentStatusState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final DuePaymentStatusModel model;



  const DuePaymentStatusState({
    required this.networkStatusEnum,
    required this.model
  });

  factory DuePaymentStatusState.initial() =>  DuePaymentStatusState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: DuePaymentStatusModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 DuePaymentStatusState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     DuePaymentStatusModel? model}) {
    return DuePaymentStatusState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
