class DuePaymentStatusModel {
  String? text;
  String? message;
  Data? data;

  DuePaymentStatusModel({this.text, this.message, this.data});

  DuePaymentStatusModel.fromJson(Map<String, dynamic> json) {
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
  bool? paymentStatus;
  String? paymentStatusIcon;

  Data({this.paymentStatus, this.paymentStatusIcon});

  Data.fromJson(Map<String, dynamic> json) {
    paymentStatus = json['payment_status'];
    paymentStatusIcon = json['payment_status_icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_status'] = this.paymentStatus;
    data['payment_status_icon'] = this.paymentStatusIcon;
    return data;
  }
}
