import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/submit_enquiry_model.dart';
import 'package:kasnew/utils/enums.dart';


class SubmitEnquiryState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final SubmitEnquiryModel model;



  const SubmitEnquiryState({
    required this.networkStatusEnum,
    required this.model
  });

  factory SubmitEnquiryState.initial() =>  SubmitEnquiryState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: SubmitEnquiryModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 SubmitEnquiryState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     SubmitEnquiryModel? model}) {
    return SubmitEnquiryState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
