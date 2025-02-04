class LedgerDetailModel {
  String? text;
  Data? data;

  LedgerDetailModel({this.text, this.data});

  LedgerDetailModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  LedgerData? ledgerData;
  List<TransactionData>? transactionData;
  String? totalAmount;

  Data({this.ledgerData, this.transactionData, this.totalAmount});

  Data.fromJson(Map<String, dynamic> json) {
    ledgerData = json['ledger_data'] != null
        ? new LedgerData.fromJson(json['ledger_data'])
        : null;
    if (json['transaction_data'] != null) {
      transactionData = <TransactionData>[];
      json['transaction_data'].forEach((v) {
        transactionData!.add(new TransactionData.fromJson(v));
      });
    }
    totalAmount = json['total_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ledgerData != null) {
      data['ledger_data'] = this.ledgerData!.toJson();
    }
    if (this.transactionData != null) {
      data['transaction_data'] =
          this.transactionData!.map((v) => v.toJson()).toList();
    }
    data['total_amount'] = this.totalAmount;
    return data;
  }
}

class LedgerData {
  String? id;
  String? customerName;
  String? planName;
  String? passbookName;
  String? accountNumber;
  String? paymentMode;
  String? installmentsPaid;
  String? planAmount;
  String? planType;
  String? paidAmount;
  String? pendingAmount;
  String? payableAmount;
  String? planStarted;
  String? maturityDate;
  String? lapseDate;
  String? status;
  String? giftStatus;
  String? chitStatus;
  String? giftName;
  String? giftAmount;
  String? diwaliStatus;
  String? diwaliAmount;
  String? addition;
  String? deduction;
  String? closingAmount;

  LedgerData(
      {this.id,
      this.customerName,
      this.planName,
      this.passbookName,
      this.accountNumber,
      this.paymentMode,
      this.installmentsPaid,
      this.planAmount,
      this.planType,
      this.paidAmount,
      this.pendingAmount,
      this.payableAmount,
      this.planStarted,
      this.maturityDate,
      this.lapseDate,
      this.status,
      this.giftStatus,
      this.chitStatus,
      this.giftName,
      this.giftAmount,
      this.diwaliStatus,
      this.diwaliAmount,
      this.addition,
      this.deduction,
      this.closingAmount});

  LedgerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerName = json['customer_name'];
    planName = json['plan_name'];
    passbookName = json['passbook_name'];
    accountNumber = json['account_number'];
    paymentMode = json['payment_mode'];
    installmentsPaid = json['installments_paid'];
    planAmount = json['plan_amount'];
    planType = json['plan_type'];
    paidAmount = json['paid_amount'];
    pendingAmount = json['pending_amount'];
    payableAmount = json['payable_amount'];
    planStarted = json['plan_started'];
    maturityDate = json['maturity_date'];
    lapseDate = json['lapse_date'];
    status = json['status'];
    giftStatus = json['gift_status'];
    chitStatus = json['chit_status'];
    giftName = json['gift_name'];
    giftAmount = json['gift_amount'];
    diwaliStatus = json['diwali_status'];
    diwaliAmount = json['diwali_amount'];
    addition = json['addition'];
    deduction = json['deduction'];
    closingAmount = json['closing_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_name'] = this.customerName;
    data['plan_name'] = this.planName;
    data['passbook_name'] = this.passbookName;
    data['account_number'] = this.accountNumber;
    data['payment_mode'] = this.paymentMode;
    data['installments_paid'] = this.installmentsPaid;
    data['plan_amount'] = this.planAmount;
    data['plan_type'] = this.planType;
    data['paid_amount'] = this.paidAmount;
    data['pending_amount'] = this.pendingAmount;
    data['payable_amount'] = this.payableAmount;
    data['plan_started'] = this.planStarted;
    data['maturity_date'] = this.maturityDate;
    data['lapse_date'] = this.lapseDate;
    data['status'] = this.status;
    data['gift_status'] = this.giftStatus;
    data['chit_status'] = this.chitStatus;
    data['gift_name'] = this.giftName;
    data['gift_amount'] = this.giftAmount;
    data['diwali_status'] = this.diwaliStatus;
    data['diwali_amount'] = this.diwaliAmount;
    data['addition'] = this.addition;
    data['deduction'] = this.deduction;
    data['closing_amount'] = this.closingAmount;
    return data;
  }
}

class TransactionData {
  String? sNo;
  String? installmentNo;
  int? paidStatus;
  String? paidAmount;
  String? balanceAmount;
  String? date;
  String? amount;

  TransactionData(
      {this.sNo,
      this.installmentNo,
      this.paidStatus,
      this.paidAmount,
      this.balanceAmount,
      this.date,
      this.amount});

  TransactionData.fromJson(Map<String, dynamic> json) {
    sNo = json['s_no'];
    installmentNo = json['installment_no'];
    paidStatus = json['paid_status'];
    paidAmount = json['paid_amount'];
    balanceAmount = json['balance_amount'];
    date = json['date'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['s_no'] = this.sNo;
    data['installment_no'] = this.installmentNo;
    data['paid_status'] = this.paidStatus;
    data['paid_amount'] = this.paidAmount;
    data['balance_amount'] = this.balanceAmount;
    data['date'] = this.date;
    data['amount'] = this.amount;
    return data;
  }
}
