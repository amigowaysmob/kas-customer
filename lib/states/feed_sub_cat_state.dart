import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/feed_sub_cat_model.dart';
import 'package:kasnew/utils/enums.dart';

class FeedSubCatState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final FeedSubCatModel model;



  const FeedSubCatState({
    required this.networkStatusEnum,
    required this.model
  });

  factory FeedSubCatState.initial() => FeedSubCatState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: FeedSubCatModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 FeedSubCatState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     FeedSubCatModel? model}) {
    return FeedSubCatState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
