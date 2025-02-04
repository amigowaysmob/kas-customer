class PaymentStatusModel {
  String? text;
  String? message;
  Data? data;

  PaymentStatusModel({this.text, this.message, this.data});

  PaymentStatusModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? orderId;
  int? navigateGift;
  int? navigateDiwaliPack;
  bool? paymentStatus;
  String? paymentStatusIcon;

  Data(
      {this.orderId,
      this.navigateGift,
      this.navigateDiwaliPack,
      this.paymentStatus,
      this.paymentStatusIcon});

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    navigateGift = json['navigate_gift'];
    navigateDiwaliPack = json['navigate_diwali_pack'];
    paymentStatus = json['payment_status'];
    paymentStatusIcon = json['payment_status_icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['navigate_gift'] = this.navigateGift;
    data['navigate_diwali_pack'] = this.navigateDiwaliPack;
    data['payment_status'] = this.paymentStatus;
    data['payment_status_icon'] = this.paymentStatusIcon;
    return data;
  }
}
