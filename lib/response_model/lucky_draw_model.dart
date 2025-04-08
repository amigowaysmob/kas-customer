class LuckyDrawModel {
  String? text;
  Data? data;

  LuckyDrawModel({this.text, this.data});

  LuckyDrawModel.fromJson(Map<String, dynamic> json) {
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
  List<LedgerData>? ledgerData;

  Data({this.ledgerData});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['ledger_data'] != null) {
      ledgerData = <LedgerData>[];
      json['ledger_data'].forEach((v) {
        ledgerData!.add(new LedgerData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ledgerData != null) {
      data['ledger_data'] = this.ledgerData!.map((v) => v.toJson()).toList();
    }
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
  String? pendingAmount;
  String? payableAmount;
  String? planStarted;
  String? maturityDate;
  String? lapseDate;
  String? status;
  String? giftStatus;
  String? paymentMode;
  String? planAmount;
  String? planType;
  List<LuckyDrawDetails>? luckyDrawDetails;
  String? luckyDrawEligible;
  String? win;
  String? content;
  String? nextLuckyDrawDate;

  LedgerData(
      {this.id,
      this.planName,
      this.passbookName,
      this.accountNumber,
      this.installments,
      this.paidAmount,
      this.pendingAmount,
      this.payableAmount,
      this.planStarted,
      this.maturityDate,
      this.lapseDate,
      this.status,
      this.giftStatus,
      this.paymentMode,
      this.planAmount,
      this.planType,
      this.luckyDrawDetails,
      this.luckyDrawEligible,
      this.win,
      this.content,
      this.nextLuckyDrawDate});

  LedgerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    planName = json['plan_name'];
    passbookName = json['passbook_name'];
    accountNumber = json['account_number'];
    installments = json['installments'];
    paidAmount = json['paid_amount'];
    pendingAmount = json['pending_amount'];
    payableAmount = json['payable_amount'];
    planStarted = json['plan_started'];
    maturityDate = json['maturity_date'];
    lapseDate = json['lapse_date'];
    status = json['status'];
    giftStatus = json['gift_status'];
    paymentMode = json['payment_mode'];
    planAmount = json['plan_amount'];
    planType = json['plan_type'];
    if (json['lucky_draw_details'] != null) {
      luckyDrawDetails = <LuckyDrawDetails>[];
      json['lucky_draw_details'].forEach((v) {
        luckyDrawDetails!.add(new LuckyDrawDetails.fromJson(v));
      });
    }
    luckyDrawEligible = json['lucky_draw_eligible'];
    win = json['win'];
    content = json['content'];
    nextLuckyDrawDate = json['next_lucky_draw_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['plan_name'] = this.planName;
    data['passbook_name'] = this.passbookName;
    data['account_number'] = this.accountNumber;
    data['installments'] = this.installments;
    data['paid_amount'] = this.paidAmount;
    data['pending_amount'] = this.pendingAmount;
    data['payable_amount'] = this.payableAmount;
    data['plan_started'] = this.planStarted;
    data['maturity_date'] = this.maturityDate;
    data['lapse_date'] = this.lapseDate;
    data['status'] = this.status;
    data['gift_status'] = this.giftStatus;
    data['payment_mode'] = this.paymentMode;
    data['plan_amount'] = this.planAmount;
    data['plan_type'] = this.planType;
    if (this.luckyDrawDetails != null) {
      data['lucky_draw_details'] =
          this.luckyDrawDetails!.map((v) => v.toJson()).toList();
    }
    data['lucky_draw_eligible'] = this.luckyDrawEligible;
    data['win'] = this.win;
    data['content'] = this.content;
    data['next_lucky_draw_date'] = this.nextLuckyDrawDate;
    return data;
  }
}

class LuckyDrawDetails {
  String? sNo;
  String? saturday;
  String? sunday;
  String? payableDate;
  String? paidDate;
  String? paidAmount;
  String? eligible;
  String? reason;

  LuckyDrawDetails(
      {this.sNo,
      this.saturday,
      this.sunday,
      this.payableDate,
      this.paidDate,
      this.paidAmount,
      this.eligible,
      this.reason});

  LuckyDrawDetails.fromJson(Map<String, dynamic> json) {
    sNo = json['s_no'];
    saturday = json['saturday'];
    sunday = json['sunday'];
    payableDate = json['payable_date'];
    paidDate = json['paid_date'];
    paidAmount = json['paid_amount'];
    eligible = json['eligible'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['s_no'] = this.sNo;
    data['saturday'] = this.saturday;
    data['sunday'] = this.sunday;
    data['payable_date'] = this.payableDate;
    data['paid_date'] = this.paidDate;
    data['paid_amount'] = this.paidAmount;
    data['eligible'] = this.eligible;
    data['reason'] = this.reason;
    return data;
  }
}
