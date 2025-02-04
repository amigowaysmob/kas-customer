import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/token_model.dart';
import 'package:kasnew/utils/enums.dart';

class TokenState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final TokenModel model;



  const TokenState({
    required this.networkStatusEnum,
    required this.model
  });

  factory TokenState.initial() =>  TokenState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: TokenModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 TokenState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     TokenModel? model}) {
    return TokenState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
