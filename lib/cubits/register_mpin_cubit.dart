import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/register_mpin_request_model.dart';
import 'package:kasnew/states/register_mpin_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class RegisterMpinCubit extends Cubit<RegisterMpinState> {
  AuthRepository authRepository;

 RegisterMpinCubit({required this.authRepository})
      : super(RegisterMpinState.initial());

  void login(RegisterMpinRequestModel registerMpinRequestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userRegisterMpin(registerMpinRequestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}