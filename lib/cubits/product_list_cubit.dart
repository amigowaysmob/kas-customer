import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/product_list_request_model.dart';
import 'package:kasnew/states/product_list_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class ProductListCubit extends Cubit<ProductListState> {
  AuthRepository authRepository;

 ProductListCubit({required this.authRepository})
      : super(ProductListState.initial());

  void login(ProductListRequestModel requestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userProductList(requestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}