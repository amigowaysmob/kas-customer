import 'package:equatable/equatable.dart';
import 'package:kasnew/screens/bottom_screens/homescreen/contact_person_model.dart';
import 'package:kasnew/utils/enums.dart';

class ContactPersonState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final ContactPersonModel model;



  const ContactPersonState({
    required this.networkStatusEnum,
    required this.model
  });

  factory ContactPersonState.initial() =>  ContactPersonState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: ContactPersonModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 ContactPersonState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     ContactPersonModel? model}) {
    return ContactPersonState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
