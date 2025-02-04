import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/trans_model.dart';
import 'package:kasnew/utils/enums.dart';


class TransState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final TransModel model;



  const TransState({
    required this.networkStatusEnum,
    required this.model
  });

  factory TransState.initial() => TransState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: TransModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 TransState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     TransModel? model}) {
    return TransState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
