import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/view_profile_model.dart';
import 'package:kasnew/utils/enums.dart';

class ViewProfileState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final ViewProfileModel model;



  const ViewProfileState({
    required this.networkStatusEnum,
    required this.model
  });

  factory ViewProfileState.initial() =>  ViewProfileState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: ViewProfileModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 ViewProfileState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     ViewProfileModel? model}) {
    return ViewProfileState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
