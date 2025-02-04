import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/ledger_detail_model.dart';
import 'package:kasnew/utils/enums.dart';

class LedgerDetailState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final LedgerDetailModel model;



  const LedgerDetailState({
    required this.networkStatusEnum,
    required this.model
  });

  factory LedgerDetailState.initial() =>  LedgerDetailState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: LedgerDetailModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 LedgerDetailState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     LedgerDetailModel? model}) {
    return LedgerDetailState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}