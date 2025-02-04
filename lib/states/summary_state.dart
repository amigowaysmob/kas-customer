import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/summary_model.dart';
import 'package:kasnew/utils/enums.dart';

class SummaryState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final SummaryModel model;



  const SummaryState({
    required this.networkStatusEnum,
    required this.model
  });

  factory SummaryState.initial() => SummaryState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: SummaryModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 SummaryState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     SummaryModel? model}) {
    return SummaryState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
