import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/register_mpin_model.dart';
import 'package:kasnew/utils/enums.dart';

class RegisterMpinState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final RegisterMpinModel model;



  const RegisterMpinState({
    required this.networkStatusEnum,
    required this.model
  });

  factory RegisterMpinState.initial() =>  RegisterMpinState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: RegisterMpinModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 RegisterMpinState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     RegisterMpinModel? model}) {
    return RegisterMpinState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
