import 'package:equatable/equatable.dart';
import 'package:kasnew/response_model/product_list_list_model.dart';
import 'package:kasnew/utils/enums.dart';

class ProductListState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final ProductListModel model;



  const ProductListState({
    required this.networkStatusEnum,
    required this.model
  });

  factory ProductListState.initial() =>  ProductListState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: ProductListModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 ProductListState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     ProductListModel? model}) {
    return ProductListState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
