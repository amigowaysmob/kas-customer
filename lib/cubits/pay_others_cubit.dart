import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/pay_others_request_model.dart';
import 'package:kasnew/states/pay_others_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class PayOthersCubit extends Cubit<PayOthersState> {
  AuthRepository authRepository;

 PayOthersCubit({required this.authRepository})
      : super(PayOthersState.initial());

  void login(PayOthersRequestModel requestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userPayOthers(requestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}
