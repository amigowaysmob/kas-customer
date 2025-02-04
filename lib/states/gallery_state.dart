import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/gallery_model.dart';
import 'package:kasnew/utils/enums.dart';


class GalleryState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final GalleryModel model;



  const GalleryState({
    required this.networkStatusEnum,
    required this.model
  });

  factory GalleryState.initial() =>  GalleryState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: GalleryModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 GalleryState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     GalleryModel? model}) {
    return GalleryState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
