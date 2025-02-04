class SummaryModel {
  String? text;
  String? message;
  Data? data;

  SummaryModel({this.text, this.message, this.data});

  SummaryModel.fromJson(Map<String, dynamic> json) {
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
  List<SummaryData>? summaryData;
  String? totalAmount;

  Data({this.summaryData, this.totalAmount});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['summary_data'] != null) {
      summaryData = <SummaryData>[];
      json['summary_data'].forEach((v) {
        summaryData!.add(new SummaryData.fromJson(v));
      });
    }
    totalAmount = json['total_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.summaryData != null) {
      data['summary_data'] = this.summaryData!.map((v) => v.toJson()).toList();
    }
    data['total_amount'] = this.totalAmount;
    return data;
  }
}

class SummaryData {
  String? passbookNumber;
  String? planName;
  List<DueItems>? dueItems;

  SummaryData({this.passbookNumber, this.planName, this.dueItems});

  SummaryData.fromJson(Map<String, dynamic> json) {
    passbookNumber = json['passbook_number'];
    planName = json['plan_name'];
    if (json['due_items'] != null) {
      dueItems = <DueItems>[];
      json['due_items'].forEach((v) {
        dueItems!.add(new DueItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['passbook_number'] = this.passbookNumber;
    data['plan_name'] = this.planName;
    if (this.dueItems != null) {
      data['due_items'] = this.dueItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DueItems {
  String? date;
  String? amount;

  DueItems({this.date, this.amount});

  DueItems.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['amount'] = this.amount;
    return data;
  }
}
