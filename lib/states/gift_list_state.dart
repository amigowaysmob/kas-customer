import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/gift_list_model.dart';
import 'package:kasnew/utils/enums.dart';

class GiftListState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final GiftListModel model;



  const GiftListState({
    required this.networkStatusEnum,
    required this.model
  });

  factory GiftListState.initial() =>  GiftListState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: GiftListModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 GiftListState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     GiftListModel? model}) {
    return GiftListState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
