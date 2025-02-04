import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/lang_list_model.dart';
import 'package:kasnew/utils/enums.dart';

class LangListState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final LangListModel model;



  const LangListState({
    required this.networkStatusEnum,
    required this.model
  });

  factory LangListState.initial() =>  LangListState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: LangListModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 LangListState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     LangListModel? model}) {
    return LangListState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
