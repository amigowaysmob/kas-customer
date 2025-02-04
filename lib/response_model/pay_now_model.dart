class PayNowModel {
  String? text;
  String? message;
  Data? data;

  PayNowModel({this.text, this.message, this.data});

  PayNowModel.fromJson(Map<String, dynamic> json) {
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
  String? paymentOrderId;
  Sdkpayload? sdkpayload;

  Data({this.paymentOrderId, this.sdkpayload});

  Data.fromJson(Map<String, dynamic> json) {
    paymentOrderId = json['payment_order_id'];
    sdkpayload = json['sdkpayload'] != null
        ? new Sdkpayload.fromJson(json['sdkpayload'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_order_id'] = this.paymentOrderId;
    if (this.sdkpayload != null) {
      data['sdkpayload'] = this.sdkpayload!.toJson();
    }
    return data;
  }
}

class Sdkpayload {
  String? requestId;
  String? service;
  Payload? payload;
  String? expiry;

  Sdkpayload({this.requestId, this.service, this.payload, this.expiry});

  Sdkpayload.fromJson(Map<String, dynamic> json) {
    requestId = json['requestId'];
    service = json['service'];
    payload =
        json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
    expiry = json['expiry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['requestId'] = this.requestId;
    data['service'] = this.service;
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    data['expiry'] = this.expiry;
    return data;
  }
}

class Payload {
  String? clientId;
  String? customerId;
  String? displayBusinessAs;
  String? orderId;
  String? currency;
  String? customerPhone;
  String? service;
  String? environment;
  String? merchantId;
  String? amount;
  String? clientAuthTokenExpiry;
  String? clientAuthToken;
  String? action;
  bool? collectAvsInfo;

  Payload(
      {this.clientId,
      this.customerId,
      this.displayBusinessAs,
      this.orderId,
      this.currency,
      this.customerPhone,
      this.service,
      this.environment,
      this.merchantId,
      this.amount,
      this.clientAuthTokenExpiry,
      this.clientAuthToken,
      this.action,
      this.collectAvsInfo});

  Payload.fromJson(Map<String, dynamic> json) {
    clientId = json['clientId'];
    customerId = json['customerId'];
    displayBusinessAs = json['displayBusinessAs'];
    orderId = json['orderId'];
    currency = json['currency'];
    customerPhone = json['customerPhone'];
    service = json['service'];
    environment = json['environment'];
    merchantId = json['merchantId'];
    amount = json['amount'];
    clientAuthTokenExpiry = json['clientAuthTokenExpiry'];
    clientAuthToken = json['clientAuthToken'];
    action = json['action'];
    collectAvsInfo = json['collectAvsInfo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clientId'] = this.clientId;
    data['customerId'] = this.customerId;
    data['displayBusinessAs'] = this.displayBusinessAs;
    data['orderId'] = this.orderId;
    data['currency'] = this.currency;
    data['customerPhone'] = this.customerPhone;
    data['service'] = this.service;
    data['environment'] = this.environment;
    data['merchantId'] = this.merchantId;
    data['amount'] = this.amount;
    data['clientAuthTokenExpiry'] = this.clientAuthTokenExpiry;
    data['clientAuthToken'] = this.clientAuthToken;
    data['action'] = this.action;
    data['collectAvsInfo'] = this.collectAvsInfo;
    return data;
  }
}
