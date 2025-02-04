class LedgerModel {
  String? text;
  Data? data;

  LedgerModel({this.text, this.data});

  LedgerModel.fromJson(Map<String, dynamic> json) {
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
  LangData? langData;
  List<LedgerData>? ledgerData;

  Data({this.langData, this.ledgerData});

  Data.fromJson(Map<String, dynamic> json) {
    langData = json['lang_data'] != null
        ? new LangData.fromJson(json['lang_data'])
        : null;
    if (json['ledger_data'] != null) {
      ledgerData = <LedgerData>[];
      json['ledger_data'].forEach((v) {
        ledgerData!.add(new LedgerData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.langData != null) {
      data['lang_data'] = this.langData!.toJson();
    }
    if (this.ledgerData != null) {
      data['ledger_data'] = this.ledgerData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LangData {
  String? viewLedgerDataLoginHere;
  String? myLedger;
  String? name;
  String? ledger;
  String? viewDetails;
  String? planStartDate;
  String? grandTotal;
  String? closechit;

  LangData(
      {this.viewLedgerDataLoginHere,
      this.myLedger,
      this.name,
      this.ledger,
      this.viewDetails,
      this.planStartDate,
      this.grandTotal,
      this.closechit});

  LangData.fromJson(Map<String, dynamic> json) {
    viewLedgerDataLoginHere = json['view_ledger_data_login_here'];
    myLedger = json['my_ledger'];
    name = json['name'];
    ledger = json['ledger'];
    viewDetails = json['view_details'];
    planStartDate = json['plan_start_date'];
    grandTotal = json['grand_total'];
    closechit = json['closechit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['view_ledger_data_login_here'] = this.viewLedgerDataLoginHere;
    data['my_ledger'] = this.myLedger;
    data['name'] = this.name;
    data['ledger'] = this.ledger;
    data['view_details'] = this.viewDetails;
    data['plan_start_date'] = this.planStartDate;
    data['grand_total'] = this.grandTotal;
    data['closechit'] = this.closechit;
    return data;
  }
}

class LedgerData {
  String? id;
  String? planName;
  String? passbookName;
  String? accountNumber;
  String? installments;
  String? paidAmount;
  String? paymentMode;
  String? planStarted;
  String? status;
  String? planAmount;
  String? planType;

  LedgerData(
      {this.id,
      this.planName,
      this.passbookName,
      this.accountNumber,
      this.installments,
      this.paidAmount,
      this.paymentMode,
      this.planStarted,
      this.status,
      this.planAmount,
      this.planType});

  LedgerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    planName = json['plan_name'];
    passbookName = json['passbook_name'];
    accountNumber = json['account_number'];
    installments = json['installments'];
    paidAmount = json['paid_amount'];
    paymentMode = json['payment_mode'];
    planStarted = json['plan_started'];
    status = json['status'];
    planAmount = json['plan_amount'];
    planType = json['plan_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['plan_name'] = this.planName;
    data['passbook_name'] = this.passbookName;
    data['account_number'] = this.accountNumber;
    data['installments'] = this.installments;
    data['paid_amount'] = this.paidAmount;
    data['payment_mode'] = this.paymentMode;
    data['plan_started'] = this.planStarted;
    data['status'] = this.status;
    data['plan_amount'] = this.planAmount;
    data['plan_type'] = this.planType;
    return data;
  }
}

