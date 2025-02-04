import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/response_model/e_cat_detail_request_model.dart';
import 'package:kasnew/states/ecat_detail_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class ECatDetailCubit extends Cubit<ECatDetailState> {
  AuthRepository authRepository;

 ECatDetailCubit({required this.authRepository})
      : super(ECatDetailState.initial());

  void login(ECatDetailRequestModel requestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userECatDetail(requestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}