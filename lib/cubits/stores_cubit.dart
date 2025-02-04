import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/user_id_request_model.dart';
import 'package:kasnew/states/stores_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';


class StoresCubit extends Cubit<StoresState> {
  AuthRepository authRepository;

 StoresCubit({required this.authRepository})
      : super(StoresState.initial());

  void login(UserIdRequestModel requestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userStores(requestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}
