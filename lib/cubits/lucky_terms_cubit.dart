import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/about_us_request_model.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/states/luck_terms_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class LuckyTermsCubit extends Cubit<LuckyTermsState> {
  AuthRepository authRepository;

 LuckyTermsCubit({required this.authRepository})
      : super(LuckyTermsState.initial());

  void login(AboutUsRequestModel homeRequestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userLuckyTerms(homeRequestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}