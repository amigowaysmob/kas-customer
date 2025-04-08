import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/winners_model.dart';
import 'package:kasnew/utils/enums.dart';

class WinnersState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final WinnersModel model;



  const WinnersState({
    required this.networkStatusEnum,
    required this.model
  });

  factory WinnersState.initial() => WinnersState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: WinnersModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 WinnersState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     WinnersModel? model}) {
    return WinnersState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
