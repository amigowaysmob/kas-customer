import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/feedback_request_model.dart';
import 'package:kasnew/states/feed_back_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class FeedBackCubit extends Cubit<FeedBackState> {
  AuthRepository authRepository;

 FeedBackCubit({required this.authRepository})
      : super(FeedBackState.initial());

  void login(FeedBackRequestModel requestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userFeedBack(requestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}