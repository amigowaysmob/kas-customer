import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/stores_model.dart';
import 'package:kasnew/utils/enums.dart';


class StoresState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final StoresModel model;



  const StoresState({
    required this.networkStatusEnum,
    required this.model
  });

  factory StoresState.initial() =>  StoresState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: StoresModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 StoresState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     StoresModel? model}) {
    return StoresState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
