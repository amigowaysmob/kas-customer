import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/change_mpin_request_model.dart';
import 'package:kasnew/states/change_mpin_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class ChangeMpinCubit extends Cubit<ChangeMpinState> {
  AuthRepository authRepository;

 ChangeMpinCubit({required this.authRepository})
      : super(ChangeMpinState.initial());

  void login(ChangeMpinRequestModel changeMpinRequestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userChangeMpin(changeMpinRequestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}