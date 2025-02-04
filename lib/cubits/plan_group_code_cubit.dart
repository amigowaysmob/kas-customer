import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/gift_list_request_model.dart';
import 'package:kasnew/states/plan_group_code_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class PlanGroupCodeCubit extends Cubit<PlanGroupCodeState> {
  AuthRepository authRepository;

 PlanGroupCodeCubit({required this.authRepository})
      : super(PlanGroupCodeState.initial());

  void login(GiftListRequestModel requestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userPlanGroupCode(requestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}