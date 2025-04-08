import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/winners_request_model.dart';
import 'package:kasnew/states/winners_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class WinnersCubit extends Cubit<WinnersState> {
  AuthRepository authRepository;

 WinnersCubit({required this.authRepository})
      : super(WinnersState.initial());

  Future<void >login(WinnersRequestModel homeRequestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userWinners(homeRequestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}