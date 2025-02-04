class ECatDetailRequestModel {
  String? userId;
  String? productId;
  String? lang;

  ECatDetailRequestModel({this.userId, this.productId, this.lang});

  ECatDetailRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    productId = json['product_id'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['lang'] = this.lang;
    return data;
  }
}
