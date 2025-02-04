import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/resend_otp_request_model.dart';
import 'package:kasnew/states/resend_otp_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class ResendOtpCubit extends Cubit<ResendOtpState> {
  AuthRepository authRepository;

 ResendOtpCubit({required this.authRepository})
      : super(ResendOtpState.initial());

  void login(ResendOtpRequestModel requestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userResendOtp(requestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}