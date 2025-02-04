import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/pay_now_request_model.dart';
import 'package:kasnew/states/total_pay_due_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class TotalPayDueCubit extends Cubit<TotalPayDueState> {
  AuthRepository authRepository;

 TotalPayDueCubit({required this.authRepository})
      : super(TotalPayDueState.initial());

  void login(PayNowRequestModel requestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userTotalPayDue(requestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}