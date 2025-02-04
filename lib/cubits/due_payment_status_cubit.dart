import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/due_payment_status_request_model.dart';
import 'package:kasnew/states/pay_due_payment_status_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class DuePaymentStatusCubit extends Cubit<DuePaymentStatusState> {
  AuthRepository authRepository;

 DuePaymentStatusCubit({required this.authRepository})
      : super(DuePaymentStatusState.initial());

  void login(DuePaymentStatusRequestModel requestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userDuePaymentStatus(requestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}