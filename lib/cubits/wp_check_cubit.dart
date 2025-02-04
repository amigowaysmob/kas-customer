import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/mobile_chek_request_model.dart';


import 'package:kasnew/states/wp_check_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class WpCheckCubit extends Cubit<WpCheckState> {
  AuthRepository authRepository;

 WpCheckCubit({required this.authRepository})
      : super(WpCheckState.initial());

  void login(MobileCheckRequestModel homeRequestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userWp(homeRequestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}