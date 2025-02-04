import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/contact_model.dart';
import 'package:kasnew/utils/enums.dart';


class ContactState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final ContactModel model;



  const ContactState({
    required this.networkStatusEnum,
    required this.model
  });

  factory ContactState.initial() =>  ContactState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: ContactModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 ContactState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     ContactModel? model}) {
    return ContactState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
