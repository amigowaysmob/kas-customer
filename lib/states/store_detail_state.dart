import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/store_detail_model.dart';
import 'package:kasnew/utils/enums.dart';


class StoreDetailState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final StoreDetailModel model;



  const StoreDetailState({
    required this.networkStatusEnum,
    required this.model
  });

  factory StoreDetailState.initial() =>  StoreDetailState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: StoreDetailModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 StoreDetailState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     StoreDetailModel? model}) {
    return StoreDetailState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
