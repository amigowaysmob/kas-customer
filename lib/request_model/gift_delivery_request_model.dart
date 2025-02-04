class GiftDeliveryRequestModel {
  String? userId;
  String? orderId;
  String? giftId;
  String? lang;

  GiftDeliveryRequestModel({this.userId, this.orderId, this.giftId, this.lang});

  GiftDeliveryRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    orderId = json['order_id'];
    giftId = json['gift_id'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['order_id'] = this.orderId;
    data['gift_id'] = this.giftId;
    data['lang'] = this.lang;
    return data;
  }
}
