import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/con_register_model.dart';
import 'package:kasnew/utils/enums.dart';


class ConRegisterState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final ConRegisterModel model;



  const ConRegisterState({
    required this.networkStatusEnum,
    required this.model
  });

  factory ConRegisterState.initial() =>  ConRegisterState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: ConRegisterModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 ConRegisterState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     ConRegisterModel? model}) {
    return ConRegisterState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
