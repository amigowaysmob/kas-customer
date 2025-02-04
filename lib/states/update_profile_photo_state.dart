import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/update_profile_photo_model.dart';
import 'package:kasnew/utils/enums.dart';

class UpdateProfilePhotoState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final UpdateProfilePhotoModel model;



  const UpdateProfilePhotoState({
    required this.networkStatusEnum,
    required this.model
  });

  factory UpdateProfilePhotoState.initial() =>  UpdateProfilePhotoState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: UpdateProfilePhotoModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 UpdateProfilePhotoState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     UpdateProfilePhotoModel? model}) {
    return UpdateProfilePhotoState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
