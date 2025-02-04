import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/stepper_form_request_model.dart';
import 'package:kasnew/states/update_profile_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  AuthRepository authRepository;

 UpdateProfileCubit({required this.authRepository})
      : super(UpdateProfileState.initial());

  void login(StepperFormRequestModel stepperFormRequestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userUpdateProfile(stepperFormRequestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}