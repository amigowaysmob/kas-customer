import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/lucky_draw_model.dart';
import 'package:kasnew/utils/enums.dart';

class LuckyDrawState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final LuckyDrawModel model;



  const LuckyDrawState({
    required this.networkStatusEnum,
    required this.model
  });

  factory LuckyDrawState.initial() => LuckyDrawState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: LuckyDrawModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 LuckyDrawState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     LuckyDrawModel? model}) {
    return LuckyDrawState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
