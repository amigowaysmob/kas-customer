import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/submit_ticket_request_model.dart';
import 'package:kasnew/states/submit_ticket_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';

class SubmitTicketCubit extends Cubit<SubmitTicketState> {
  AuthRepository authRepository;

 SubmitTicketCubit({required this.authRepository})
      : super(SubmitTicketState.initial());

  Future<void >login(SubmitTicketRequestModel homeRequestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userSubmitTicket(homeRequestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}