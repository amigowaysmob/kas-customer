import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/states/contact_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';


class ContactCubit extends Cubit<ContactState> {
  AuthRepository authRepository;

 ContactCubit({required this.authRepository})
      : super(ContactState.initial());

  void login(HomeRequestModel homeRequestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userContact(homeRequestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}