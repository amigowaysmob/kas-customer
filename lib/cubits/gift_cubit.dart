import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/gift_request_model.dart';
import 'package:kasnew/states/gift_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';


class GiftCubit extends Cubit<GiftState> {
  AuthRepository authRepository;

 GiftCubit({required this.authRepository})
      : super(GiftState.initial());

  void login(GiftRequestModel requestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userGift(requestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}