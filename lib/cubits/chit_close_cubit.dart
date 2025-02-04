import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/chit_close_request%20mode.dart';
import 'package:kasnew/states/chit_close_cubit.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class ChitCloseCubit extends Cubit<ChitCloseState> {
  AuthRepository authRepository;

 ChitCloseCubit({required this.authRepository})
      : super(ChitCloseState.initial());

  void login(ChitCloseRequestModel requestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userChitClose(requestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}