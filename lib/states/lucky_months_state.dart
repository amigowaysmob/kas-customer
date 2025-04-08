import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/lucky_months_model.dart';
import 'package:kasnew/utils/enums.dart';

class LuckyMonthsState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final LuckyMonthsModel model;



  const LuckyMonthsState({
    required this.networkStatusEnum,
    required this.model
  });

  factory LuckyMonthsState.initial() => LuckyMonthsState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: LuckyMonthsModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 LuckyMonthsState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     LuckyMonthsModel? model}) {
    return LuckyMonthsState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
