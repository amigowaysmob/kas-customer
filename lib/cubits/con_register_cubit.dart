import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/con_register_request_model.dart';
import 'package:kasnew/states/con_register_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';


class ConRegisterCubit extends Cubit<ConRegisterState> {
  AuthRepository authRepository;

 ConRegisterCubit({required this.authRepository})
      : super(ConRegisterState.initial());

  void login(ConRegisterRequestModel conRegisterRequestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userRegisterConfirm(conRegisterRequestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}