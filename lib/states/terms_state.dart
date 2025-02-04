import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/about_us_model.dart';
import 'package:kasnew/utils/enums.dart';


class TermsState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final AboutUsModel model;



  const TermsState({
    required this.networkStatusEnum,
    required this.model
  });

  factory TermsState.initial() =>  TermsState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: AboutUsModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 TermsState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     AboutUsModel? model}) {
    return TermsState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
