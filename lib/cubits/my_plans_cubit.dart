import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/states/my_plans_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class MyPlansCubit extends Cubit<MyPlansState> {
  AuthRepository authRepository;

 MyPlansCubit({required this.authRepository})
      : super(MyPlansState.initial());

  void login(HomeRequestModel requestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userMyPlans(requestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}