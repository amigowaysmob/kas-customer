import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/e_cat_detail_model.dart';
import 'package:kasnew/utils/enums.dart';

class ECatDetailState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final ECatDetailModel model;



  const ECatDetailState({
    required this.networkStatusEnum,
    required this.model
  });

  factory ECatDetailState.initial() =>  ECatDetailState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: ECatDetailModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 ECatDetailState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     ECatDetailModel? model}) {
    return ECatDetailState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
