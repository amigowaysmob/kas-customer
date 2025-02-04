import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/group_code_model.dart';
import 'package:kasnew/utils/enums.dart';

class GroupCodeState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final GroupCodeModel model;



  const GroupCodeState({
    required this.networkStatusEnum,
    required this.model
  });

  factory GroupCodeState.initial() =>  GroupCodeState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: GroupCodeModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 GroupCodeState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     GroupCodeModel? model}) {
    return GroupCodeState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
