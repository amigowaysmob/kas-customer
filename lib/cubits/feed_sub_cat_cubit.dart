import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/feed_sub_cat_request_model.dart';
import 'package:kasnew/states/feed_sub_cat_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class FeedSubCatCubit extends Cubit<FeedSubCatState> {
  AuthRepository authRepository;

FeedSubCatCubit({required this.authRepository})
      : super(FeedSubCatState.initial());

  Future<void >login(FeedSubCatRequestModel homeRequestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userFeedSubCat(homeRequestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  void clear() {
    emit(FeedSubCatState.initial());
  }
 
}