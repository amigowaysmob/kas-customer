class StoreDetailRequestModel {
  String? userId;
  String? storeId;
  String? lang;

  StoreDetailRequestModel({this.userId, this.storeId, this.lang});

  StoreDetailRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    storeId = json['store_id'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['store_id'] = this.storeId;
    data['lang'] = this.lang;
    return data;
  }
}
