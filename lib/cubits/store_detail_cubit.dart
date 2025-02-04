import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/store_detail_request_model.dart';
import 'package:kasnew/states/store_detail_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';


class StoreDetailCubit extends Cubit<StoreDetailState> {
  AuthRepository authRepository;

 StoreDetailCubit({required this.authRepository})
      : super(StoreDetailState.initial());

  void login(StoreDetailRequestModel requestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userStoreDetail(requestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}
