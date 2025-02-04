class GiftRequestModel {
  String? userId;
  String? orderId;
  String? lang;

  GiftRequestModel({this.userId, this.orderId, this.lang});

  GiftRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    orderId = json['order_id'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['order_id'] = this.orderId;
    data['lang'] = this.lang;
    return data;
  }
}
