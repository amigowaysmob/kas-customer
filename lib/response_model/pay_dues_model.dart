class PayDuesModel {
  String? text;
  String? message;
  List<Data>? data;

  PayDuesModel({this.text, this.message, this.data});

  PayDuesModel.fromJson(Map<String, dynamic> json) {
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
  String? orderId;
  String? planName;
  String? accountNo;
  String? passbookName;
  String? planGroup;
  String? paymentAmount;
  String? planAmount;
  String? planType;
  String? maximumPartialAmount;
  List<Dues>? dues;

  Data(
      {this.orderId,
      this.planName,
      this.accountNo,
      this.passbookName,
      this.planGroup,
      this.paymentAmount,
      this.planAmount,
      this.planType,
      this.maximumPartialAmount,
      this.dues});

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    planName = json['plan_name'];
    accountNo = json['account_no'];
    passbookName = json['passbook_name'];
    planGroup = json['plan_group'];
    paymentAmount = json['payment_amount'];
    planAmount = json['plan_amount'];
    planType = json['plan_type'];
    maximumPartialAmount = json['maximum_partial_amount'];
    if (json['dues'] != null) {
      dues = <Dues>[];
      json['dues'].forEach((v) {
        dues!.add(new Dues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['plan_name'] = this.planName;
    data['account_no'] = this.accountNo;
    data['passbook_name'] = this.passbookName;
    data['plan_group'] = this.planGroup;
    data['payment_amount'] = this.paymentAmount;
    data['plan_amount'] = this.planAmount;
    data['plan_type'] = this.planType;
    data['maximum_partial_amount'] = this.maximumPartialAmount;
    if (this.dues != null) {
      data['dues'] = this.dues!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dues {
  bool? checkable;
  String? installmentNo;
  int? paidStatus;
  String? dateValue;
  String? date;
  String? amount;
  String? paidAmount;
  String? progress;
  String? payableAmount;
  String? maxAmountToPay;

  Dues(
      {this.checkable,
      this.installmentNo,
      this.paidStatus,
      this.dateValue,
      this.date,
      this.amount,
      this.paidAmount,
      this.progress,
      this.payableAmount,
      this.maxAmountToPay});

  Dues.fromJson(Map<String, dynamic> json) {
    checkable = json['checkable'];
    installmentNo = json['installment_no'];
    paidStatus = json['paid_status'];
    dateValue = json['date_value'];
    date = json['date'];
    amount = json['amount'];
    paidAmount = json['paid_amount'];
    progress = json['progress'];
    payableAmount = json['payable_amount'];
    maxAmountToPay = json['max_amount_to_pay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['checkable'] = this.checkable;
    data['installment_no'] = this.installmentNo;
    data['paid_status'] = this.paidStatus;
    data['date_value'] = this.dateValue;
    data['date'] = this.date;
    data['amount'] = this.amount;
    data['paid_amount'] = this.paidAmount;
    data['progress'] = this.progress;
    data['payable_amount'] = this.payableAmount;
    data['max_amount_to_pay'] = this.maxAmountToPay;
    return data;
  }
}
