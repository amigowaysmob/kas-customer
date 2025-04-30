import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/submit_ticket_model.dart';
import 'package:kasnew/utils/enums.dart';

class SubmitTicketState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final SubmitTicketModel model;



  const SubmitTicketState({
    required this.networkStatusEnum,
    required this.model
  });

  factory SubmitTicketState.initial() => SubmitTicketState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: SubmitTicketModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 SubmitTicketState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     SubmitTicketModel? model}) {
    return SubmitTicketState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
