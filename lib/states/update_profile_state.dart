import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/update_profile_model.dart';
import 'package:kasnew/utils/enums.dart';

class UpdateProfileState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final UpdateProfileModel model;



  const UpdateProfileState({
    required this.networkStatusEnum,
    required this.model
  });

  factory UpdateProfileState.initial() =>  UpdateProfileState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: UpdateProfileModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 UpdateProfileState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     UpdateProfileModel? model}) {
    return UpdateProfileState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
