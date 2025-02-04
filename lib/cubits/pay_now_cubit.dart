import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/pay_now_request_model.dart';
import 'package:kasnew/states/pay_now_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class PayNowCubit extends Cubit<PayNowState> {
  AuthRepository authRepository;

 PayNowCubit({required this.authRepository})
      : super(PayNowState.initial());

  void login(PayNowRequestModel requestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userPayNow(requestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}