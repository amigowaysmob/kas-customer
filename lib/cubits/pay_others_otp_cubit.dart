import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/pay_others_otp_request_model.dart';
import 'package:kasnew/states/pay_others_otp_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class PayOthersOtpCubit extends Cubit<PayOthersOtpState> {
  AuthRepository authRepository;

 PayOthersOtpCubit({required this.authRepository})
      : super(PayOthersOtpState.initial());

  void login(PayOthersOtpRequestModel requestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userPayOthersOtp(requestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}
