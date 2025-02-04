import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/plan_detail_request_model.dart';
import 'package:kasnew/states/plan_detail_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class PlanDetailCubit extends Cubit<PlanDetailState> {
  AuthRepository authRepository;

 PlanDetailCubit({required this.authRepository})
      : super(PlanDetailState.initial());

  void login(PlanDetailRequestModel requestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userPlanDetail(requestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}