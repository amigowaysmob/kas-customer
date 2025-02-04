import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/group_code_request_model.dart';
import 'package:kasnew/states/group_code_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class GroupCodeCubit extends Cubit<GroupCodeState> {
  AuthRepository authRepository;

 GroupCodeCubit({required this.authRepository})
      : super(GroupCodeState.initial());

  void login(GroupCodeRequestModel requestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userGroupCode(requestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}