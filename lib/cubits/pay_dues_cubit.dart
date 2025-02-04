import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/pay_due_request_model.dart';
import 'package:kasnew/states/pay_dues_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class PayDuesCubit extends Cubit<PayDuesState> {
  AuthRepository authRepository;

 PayDuesCubit({required this.authRepository})
      : super(PayDuesState.initial());

  void login(PayDueRequestModel requestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userPayDues(requestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}
