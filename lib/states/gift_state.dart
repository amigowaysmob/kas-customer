import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/gift_model.dart';
import 'package:kasnew/utils/enums.dart';


class GiftState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final GiftModel model;



  const GiftState({
    required this.networkStatusEnum,
    required this.model
  });

  factory GiftState.initial() =>  GiftState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: GiftModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 GiftState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     GiftModel? model}) {
    return GiftState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
