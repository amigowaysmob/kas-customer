class PaymentStatusRequestModel {
  String? userId;
  String? orderId;
  String? paymentOrderId;
  String? transactionData;
  String? lang;

  PaymentStatusRequestModel(
      {this.userId,
      this.orderId,
      this.paymentOrderId,
      this.transactionData,
      this.lang});

  PaymentStatusRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    orderId = json['order_id'];
    paymentOrderId = json['payment_order_id'];
    transactionData = json['transaction_data'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['order_id'] = this.orderId;
    data['payment_order_id'] = this.paymentOrderId;
    data['transaction_data'] = this.transactionData;
    data['lang'] = this.lang;
    return data;
  }
}
