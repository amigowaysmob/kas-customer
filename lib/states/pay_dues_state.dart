import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/pay_dues_model.dart';
import 'package:kasnew/utils/enums.dart';

class PayDuesState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final PayDuesModel model;



  const PayDuesState({
    required this.networkStatusEnum,
    required this.model
  });

  factory PayDuesState.initial() =>  PayDuesState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: PayDuesModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 PayDuesState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     PayDuesModel? model}) {
    return PayDuesState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
