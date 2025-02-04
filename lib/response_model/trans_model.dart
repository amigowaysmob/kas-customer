class TransModel {
  String? text;
  String? message;
  Data? data;

  TransModel({this.text, this.message, this.data});

  TransModel.fromJson(Map<String, dynamic> json) {
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
  LangData? langData;
  List<TransactionsData>? transactionsData;

  Data({this.langData, this.transactionsData});

  Data.fromJson(Map<String, dynamic> json) {
    langData = json['lang_data'] != null
        ? new LangData.fromJson(json['lang_data'])
        : null;
    if (json['transactions_data'] != null) {
      transactionsData = <TransactionsData>[];
      json['transactions_data'].forEach((v) {
        transactionsData!.add(new TransactionsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.langData != null) {
      data['lang_data'] = this.langData!.toJson();
    }
    if (this.transactionsData != null) {
      data['transactions_data'] =
          this.transactionsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LangData {
  String? transactionId;
  String? paidAt;
  String? groupCode;
  String? amount;
  String? grandTotal;
  String? closechit;
  String? acNumber;
  String? passbook;
  String? noTransactionData;
  String? viewTransactionDataLoginHere;

  LangData(
      {this.transactionId,
      this.paidAt,
      this.groupCode,
      this.amount,
      this.grandTotal,
      this.closechit,
      this.acNumber,
      this.passbook,
      this.noTransactionData,
      this.viewTransactionDataLoginHere});

  LangData.fromJson(Map<String, dynamic> json) {
    transactionId = json['transaction_id'];
    paidAt = json['paid_at'];
    groupCode = json['group_code'];
    amount = json['amount'];
    grandTotal = json['grand_total'];
    closechit = json['closechit'];
    acNumber = json['ac_number'];
    passbook = json['passbook'];
    noTransactionData = json['no_transaction_data'];
    viewTransactionDataLoginHere = json['view_transaction_data_login_here'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transaction_id'] = this.transactionId;
    data['paid_at'] = this.paidAt;
    data['group_code'] = this.groupCode;
    data['amount'] = this.amount;
    data['grand_total'] = this.grandTotal;
    data['closechit'] = this.closechit;
    data['ac_number'] = this.acNumber;
    data['passbook'] = this.passbook;
    data['no_transaction_data'] = this.noTransactionData;
    data['view_transaction_data_login_here'] =
        this.viewTransactionDataLoginHere;
    return data;
  }
}

class TransactionsData {
  String? passbookNumber;
  String? planName;
  String? transactionId;
  String? amount;
  String? groupCode;
  String? paymentStatus;
  String? date;

  TransactionsData(
      {this.passbookNumber,
      this.planName,
      this.transactionId,
      this.amount,
      this.groupCode,
      this.paymentStatus,
      this.date});

  TransactionsData.fromJson(Map<String, dynamic> json) {
    passbookNumber = json['passbook_number'];
    planName = json['plan_name'];
    transactionId = json['transaction_id'];
    amount = json['amount'];
    groupCode = json['group_code'];
    paymentStatus = json['payment_status'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['passbook_number'] = this.passbookNumber;
    data['plan_name'] = this.planName;
    data['transaction_id'] = this.transactionId;
    data['amount'] = this.amount;
    data['group_code'] = this.groupCode;
    data['payment_status'] = this.paymentStatus;
    data['date'] = this.date;
    return data;
  }
}
