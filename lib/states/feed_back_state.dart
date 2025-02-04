import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/feed_back_model.dart';
import 'package:kasnew/utils/enums.dart';

class FeedBackState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final FeedBackModel model;



  const FeedBackState({
    required this.networkStatusEnum,
    required this.model
  });

  factory FeedBackState.initial() =>  FeedBackState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: FeedBackModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 FeedBackState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     FeedBackModel? model}) {
    return FeedBackState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
