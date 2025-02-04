import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/cat_list_model.dart';

import 'package:kasnew/utils/enums.dart';

class CatListState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final CatListModel model;



  const CatListState({
    required this.networkStatusEnum,
    required this.model
  });

  factory CatListState.initial() =>  CatListState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: CatListModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 CatListState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     CatListModel? model}) {
    return CatListState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
