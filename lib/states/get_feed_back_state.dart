import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/get_feedback_model.dart';
import 'package:kasnew/utils/enums.dart';

class GetFeedBackState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final GetFeedBackModel model;



  const GetFeedBackState({
    required this.networkStatusEnum,
    required this.model
  });

  factory GetFeedBackState.initial() =>  GetFeedBackState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: GetFeedBackModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 GetFeedBackState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     GetFeedBackModel? model}) {
    return GetFeedBackState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
