import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/states/home_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';


class HomeCubit extends Cubit<HomeState> {
  AuthRepository authRepository;

 HomeCubit({required this.authRepository})
      : super(HomeState.initial());

  Future<void >login(HomeRequestModel homeRequestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userHome(homeRequestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}