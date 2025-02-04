import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/remove_profile_model.dart';
import 'package:kasnew/utils/enums.dart';

class RemoveProfileState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final RemoveProfileModel model;



  const RemoveProfileState({
    required this.networkStatusEnum,
    required this.model
  });

  factory RemoveProfileState.initial() =>  RemoveProfileState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: RemoveProfileModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 RemoveProfileState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     RemoveProfileModel? model}) {
    return RemoveProfileState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
