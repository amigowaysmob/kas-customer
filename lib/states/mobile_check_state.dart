import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/mobile_check_model.dart';
import 'package:kasnew/utils/enums.dart';


class MobileCheckState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final MobileCheckModel model;



  const MobileCheckState({
    required this.networkStatusEnum,
    required this.model
  });

  factory MobileCheckState.initial() =>  MobileCheckState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: MobileCheckModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 MobileCheckState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     MobileCheckModel? model}) {
    return MobileCheckState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
