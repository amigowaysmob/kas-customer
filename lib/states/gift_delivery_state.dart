import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/gift_delivery_model.dart';
import 'package:kasnew/utils/enums.dart';
class GiftDeliveryState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final GiftDeliveryModel model;



  const GiftDeliveryState({
    required this.networkStatusEnum,
    required this.model
  });

  factory GiftDeliveryState.initial() =>  GiftDeliveryState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: GiftDeliveryModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 GiftDeliveryState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     GiftDeliveryModel? model}) {
    return GiftDeliveryState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
