import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/ledger_model.dart';
import 'package:kasnew/utils/enums.dart';

class LedgerState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final LedgerModel model;



  const LedgerState({
    required this.networkStatusEnum,
    required this.model
  });

  factory LedgerState.initial() =>  LedgerState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: LedgerModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 LedgerState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     LedgerModel? model}) {
    return LedgerState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
