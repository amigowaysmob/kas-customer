import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/about_us_request_model.dart';
import 'package:kasnew/states/about_us_state.dart';
import 'package:kasnew/utils/enums.dart';

import '../utils/auth_repository.dart';


class AboutUsCubit extends Cubit<AboutUsState> {
  AuthRepository authRepository;

 AboutUsCubit({required this.authRepository})
      : super(AboutUsState.initial());

  void login(AboutUsRequestModel termsPrivacyRequestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userAboutUs(termsPrivacyRequestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}
