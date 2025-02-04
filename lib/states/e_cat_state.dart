import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/e_cat_model.dart';
import 'package:kasnew/utils/enums.dart';

class ECatState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final ECatModel model;



  const ECatState({
    required this.networkStatusEnum,
    required this.model
  });

  factory ECatState.initial() =>  ECatState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: ECatModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 ECatState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     ECatModel? model}) {
    return ECatState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
