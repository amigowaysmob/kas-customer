import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/mobile_chek_request_model.dart';

import 'package:kasnew/states/mobile_check_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';


class MobileCheckCubit extends Cubit<MobileCheckState> {
  AuthRepository authRepository;

 MobileCheckCubit({required this.authRepository})
      : super(MobileCheckState.initial());

  void login(MobileCheckRequestModel homeRequestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userMobileCheck(homeRequestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}