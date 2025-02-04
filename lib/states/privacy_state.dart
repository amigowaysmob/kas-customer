import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/about_us_model.dart';
import 'package:kasnew/utils/enums.dart';


class PrivacyState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final AboutUsModel model;



  const PrivacyState({
    required this.networkStatusEnum,
    required this.model
  });

  factory PrivacyState.initial() =>  PrivacyState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: AboutUsModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 PrivacyState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     AboutUsModel? model}) {
    return PrivacyState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
