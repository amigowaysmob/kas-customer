import 'package:equatable/equatable.dart';

import 'package:kasnew/response_model/mobile_check_model.dart';
import 'package:kasnew/utils/enums.dart';

class WpCheckState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final MobileCheckModel model;



  const WpCheckState({
    required this.networkStatusEnum,
    required this.model
  });

  factory WpCheckState.initial() =>  WpCheckState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: MobileCheckModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 WpCheckState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     MobileCheckModel? model}) {
    return WpCheckState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
