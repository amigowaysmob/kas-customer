import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/receipt_model.dart';

import 'package:kasnew/utils/enums.dart';

class ReceiptState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final ReceiptModel model;



  const ReceiptState({
    required this.networkStatusEnum,
    required this.model
  });

  factory ReceiptState.initial() => ReceiptState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: ReceiptModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 ReceiptState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     ReceiptModel? model}) {
    return ReceiptState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
