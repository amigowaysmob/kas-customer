import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/my_plans_model.dart';
import 'package:kasnew/utils/enums.dart';

class MyPlansState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final MyPlansModel model;



  const MyPlansState({
    required this.networkStatusEnum,
    required this.model
  });

  factory MyPlansState.initial() =>  MyPlansState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: MyPlansModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 MyPlansState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     MyPlansModel? model}) {
    return MyPlansState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
