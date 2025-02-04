import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/total_pay_due_model.dart';
import 'package:kasnew/utils/enums.dart';

class TotalPayDueState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final TotalPayDueModel model;



  const TotalPayDueState({
    required this.networkStatusEnum,
    required this.model
  });

  factory TotalPayDueState.initial() =>  TotalPayDueState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: TotalPayDueModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 TotalPayDueState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     TotalPayDueModel? model}) {
    return TotalPayDueState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
