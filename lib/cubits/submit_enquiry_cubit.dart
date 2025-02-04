import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/request_model/submit_enquiry_request_model.dart';
import 'package:kasnew/states/submit_enquiry_state.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/enums.dart';


class SubmitEnquiryCubit extends Cubit<SubmitEnquiryState> {
  AuthRepository authRepository;

 SubmitEnquiryCubit({required this.authRepository})
      : super(SubmitEnquiryState.initial());

  void login(SubmitEnquiryRequestModel submitEnquiryRequestModel) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userSubmitEnquiry(submitEnquiryRequestModel);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}
