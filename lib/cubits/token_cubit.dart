import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/states/token_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class TokenCubit extends Cubit<TokenState> {
  AuthRepository authRepository;

 TokenCubit({required this.authRepository})
      : super(TokenState.initial());

  void login() async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.generateToken();

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}