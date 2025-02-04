import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/gift_delivery_request_model.dart';
import 'package:kasnew/states/gift_delivery_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';


class GiftDeliveryCubit extends Cubit<GiftDeliveryState> {
  AuthRepository authRepository;

 GiftDeliveryCubit({required this.authRepository})
      : super(GiftDeliveryState.initial());

  void login(GiftDeliveryRequestModel requestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userGiftDelivery(requestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}