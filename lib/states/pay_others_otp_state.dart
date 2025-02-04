import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/pay_others_otp_model.dart';
import 'package:kasnew/utils/enums.dart';

class PayOthersOtpState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final PayOthersOtpModel model;



  const PayOthersOtpState({
    required this.networkStatusEnum,
    required this.model
  });

  factory PayOthersOtpState.initial() =>  PayOthersOtpState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: PayOthersOtpModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 PayOthersOtpState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     PayOthersOtpModel? model}) {
    return PayOthersOtpState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
