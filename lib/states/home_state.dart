import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/home_model.dart';
import 'package:kasnew/utils/enums.dart';


class HomeState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final HomeModel model;



  const HomeState({
    required this.networkStatusEnum,
    required this.model
  });

  factory HomeState.initial() => HomeState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: HomeModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 HomeState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     HomeModel? model}) {
    return HomeState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
