import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/ledger_detail_request_model.dart';
import 'package:kasnew/states/ledger_detail_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class LedgerDetailCubit extends Cubit<LedgerDetailState> {
  AuthRepository authRepository;

 LedgerDetailCubit({required this.authRepository})
      : super(LedgerDetailState.initial());

    Future<void > login(LedgerDetailRequestModel requestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userLedgerDetail(requestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}