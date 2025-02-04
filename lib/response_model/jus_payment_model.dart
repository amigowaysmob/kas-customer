class JusPayPaymentModel {
  bool? paymentSuccess;
  String? orderId;

  JusPayPaymentModel({this.paymentSuccess, this.orderId});

  JusPayPaymentModel.fromJson(Map<String, dynamic> json) {
    paymentSuccess = json['paymentSuccess'];
    orderId = json['orderId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paymentSuccess'] = this.paymentSuccess;
    data['orderId'] = this.orderId;
    return data;
  }

  @override
  String toString() {
    return 'JusPayPaymentModel(paymentSuccess: $paymentSuccess, orderId: $orderId)';
  }
}