import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/about_us_model.dart';
import 'package:kasnew/utils/enums.dart';


class AboutUsState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final AboutUsModel model;



  const AboutUsState({
    required this.networkStatusEnum,
    required this.model
  });

  factory AboutUsState.initial() =>  AboutUsState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: AboutUsModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 AboutUsState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     AboutUsModel? model}) {
    return AboutUsState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
