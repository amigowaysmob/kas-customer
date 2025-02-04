import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/pin_code_request_model.dart';
import 'package:kasnew/states/pin_code_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';


class PincodeCubit extends Cubit<PincodeState> {
  AuthRepository authRepository;

 PincodeCubit({required this.authRepository})
      : super(PincodeState.initial());

  void login(PincodeRequestModel requestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userPincode(requestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}