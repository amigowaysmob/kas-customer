import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/e-passbook_model.dart';
import 'package:kasnew/utils/enums.dart';

class EPassBookState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final EPassBookModel model;



  const EPassBookState({
    required this.networkStatusEnum,
    required this.model
  });

  factory EPassBookState.initial() =>  EPassBookState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: EPassBookModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 EPassBookState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     EPassBookModel? model}) {
    return EPassBookState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
