import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/invite_model.dart';
import 'package:kasnew/utils/enums.dart';

class InviteState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final InviteModel model;



  const InviteState({
    required this.networkStatusEnum,
    required this.model
  });

  factory InviteState.initial() =>  InviteState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: InviteModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 InviteState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     InviteModel? model}) {
    return InviteState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
