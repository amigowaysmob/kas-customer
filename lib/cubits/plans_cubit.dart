import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/response_model/plan_request_model.dart';
import 'package:kasnew/states/plans_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class PlansCubit extends Cubit<PlansState> {
  AuthRepository authRepository;

 PlansCubit({required this.authRepository})
      : super(PlansState.initial());

  void login(PlansRequestModel requestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userPlans(requestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}
