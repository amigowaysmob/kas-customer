import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/payment_status_request_model.dart';
import 'package:kasnew/states/payment_status_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class PaymentStatusCubit extends Cubit<PaymentStatusState> {
  AuthRepository authRepository;

 PaymentStatusCubit({required this.authRepository})
      : super(PaymentStatusState.initial());

  void login(PaymentStatusRequestModel requestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userPaymentStatus(requestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}