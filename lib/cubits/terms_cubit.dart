import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/about_us_request_model.dart';
import 'package:kasnew/states/terms_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class TermsCubit extends Cubit<TermsState> {
  AuthRepository authRepository;

 TermsCubit({required this.authRepository})
      : super(TermsState.initial());

  void login(AboutUsRequestModel termsPrivacyRequestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userTerms(termsPrivacyRequestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}
