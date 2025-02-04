import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/utils/enums.dart';

class LangState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final LangModel model;



  const LangState({
    required this.networkStatusEnum,
    required this.model
  });

  factory LangState.initial() =>  LangState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: LangModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 LangState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     LangModel? model}) {
    return LangState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
