import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/remove_profile_request_model.dart';
import 'package:kasnew/states/remove_profile_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class RemoveProfileCubit extends Cubit<RemoveProfileState> {
  AuthRepository authRepository;

 RemoveProfileCubit({required this.authRepository})
      : super(RemoveProfileState.initial());

  void login(RemoveProfileRequestModel requestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userRemoveProfile(requestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}