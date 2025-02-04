import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/update_profile_photo_request_model.dart';
import 'package:kasnew/states/update_profile_photo_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class UpdateProfilePhotoCubit extends Cubit<UpdateProfilePhotoState> {
  AuthRepository authRepository;

 UpdateProfilePhotoCubit({required this.authRepository})
      : super(UpdateProfilePhotoState.initial());

  void login(UpdateProfilePhotoRequestModel requestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userUpdateProfilePhoto(requestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}