import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/resend_otp_model.dart';
import 'package:kasnew/utils/enums.dart';

class ResendOtpState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final ResendOtpModel model;



  const ResendOtpState({
    required this.networkStatusEnum,
    required this.model
  });

  factory ResendOtpState.initial() =>  ResendOtpState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: ResendOtpModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 ResendOtpState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     ResendOtpModel? model}) {
    return ResendOtpState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
