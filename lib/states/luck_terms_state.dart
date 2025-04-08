import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/lucky_terms_model.dart';
import 'package:kasnew/utils/enums.dart';

class LuckyTermsState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final LuckyTermsModel model;



  const LuckyTermsState({
    required this.networkStatusEnum,
    required this.model
  });

  factory LuckyTermsState.initial() => LuckyTermsState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: LuckyTermsModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 LuckyTermsState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     LuckyTermsModel? model}) {
    return LuckyTermsState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
