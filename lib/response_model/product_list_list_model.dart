class ProductListModel {
  String? text;
  String? message;
  List<Data>? data;

  ProductListModel({this.text, this.message, this.data});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? productId;
  String? userId;
  String? categoryId;
  String? sku;
  String? productName;
  String? seourl;
  String? salePrice;
  String? regPrice;
  String? weight;
  String? proImg;
  String? proSnaps;
  String? shortDescription;
  String? description;
  String? similarProducts;
  String? purchasedCount;
  String? viewCount;
  String? proCreated;
  String? modified;
  String? status;

  Data(
      {this.id,
      this.productId,
      this.userId,
      this.categoryId,
      this.sku,
      this.productName,
      this.seourl,
      this.salePrice,
      this.regPrice,
      this.weight,
      this.proImg,
      this.proSnaps,
      this.shortDescription,
      this.description,
      this.similarProducts,
      this.purchasedCount,
      this.viewCount,
      this.proCreated,
      this.modified,
      this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    sku = json['sku'];
    productName = json['product_name'];
    seourl = json['seourl'];
    salePrice = json['sale_price'];
    regPrice = json['reg_price'];
    weight = json['weight'];
    proImg = json['pro_img'];
    proSnaps = json['pro_snaps'];
    shortDescription = json['short_description'];
    description = json['description'];
    similarProducts = json['similar_products'];
    purchasedCount = json['purchasedCount'];
    viewCount = json['view_count'];
    proCreated = json['pro_created'];
    modified = json['modified'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['sku'] = this.sku;
    data['product_name'] = this.productName;
    data['seourl'] = this.seourl;
    data['sale_price'] = this.salePrice;
    data['reg_price'] = this.regPrice;
    data['weight'] = this.weight;
    data['pro_img'] = this.proImg;
    data['pro_snaps'] = this.proSnaps;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['similar_products'] = this.similarProducts;
    data['purchasedCount'] = this.purchasedCount;
    data['view_count'] = this.viewCount;
    data['pro_created'] = this.proCreated;
    data['modified'] = this.modified;
    data['status'] = this.status;
    return data;
  }
}
