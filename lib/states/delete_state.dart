import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/delete_model.dart';
import 'package:kasnew/utils/enums.dart';


class DeleteState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final DeleteModel model;



  const DeleteState({
    required this.networkStatusEnum,
    required this.model
  });

  factory DeleteState.initial() =>  DeleteState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: DeleteModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 DeleteState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     DeleteModel? model}) {
    return DeleteState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
