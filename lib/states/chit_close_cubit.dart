import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/chit_close_model.dart';
import 'package:kasnew/utils/enums.dart';

class ChitCloseState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final ChitCloseModel model;



  const ChitCloseState({
    required this.networkStatusEnum,
    required this.model
  });

  factory ChitCloseState.initial() =>  ChitCloseState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: ChitCloseModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 ChitCloseState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     ChitCloseModel? model}) {
    return ChitCloseState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
