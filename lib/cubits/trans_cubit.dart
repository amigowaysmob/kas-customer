import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/trans_request_model.dart';
import 'package:kasnew/states/trans_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';


class TransCubit extends Cubit<TransState> {
  AuthRepository authRepository;

 TransCubit({required this.authRepository})
      : super(TransState.initial());

    Future<void > login(TransRequestModel homeRequestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userTrans(homeRequestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}