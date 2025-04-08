import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/lucky_draw_request_mode.dart';
import 'package:kasnew/states/lucky_draw_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class LuckyDrawCubit extends Cubit<LuckyDrawState> {
  AuthRepository authRepository;

 LuckyDrawCubit({required this.authRepository})
      : super(LuckyDrawState.initial());

  Future<void >login(LuckyDrawRequestModel homeRequestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userLuckyDraw(homeRequestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}