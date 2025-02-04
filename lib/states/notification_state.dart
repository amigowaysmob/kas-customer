import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/notification_model.dart';
import 'package:kasnew/utils/enums.dart';


class NotificationState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final NotificationModel model;



  const NotificationState({
    required this.networkStatusEnum,
    required this.model
  });

  factory NotificationState.initial() => NotificationState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: NotificationModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 NotificationState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     NotificationModel? model}) {
    return NotificationState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
