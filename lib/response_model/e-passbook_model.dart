class EPassBookModel {
  String? text;
  List<Data>? data;

  EPassBookModel({this.text, this.data});

  EPassBookModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
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
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? planName;
  String? accountNo;
  String? groupCode;
  String? planAmount;
  String? downloadLink;

  Data(
      {this.planName,
      this.accountNo,
      this.groupCode,
      this.planAmount,
      this.downloadLink});

  Data.fromJson(Map<String, dynamic> json) {
    planName = json['plan_name'];
    accountNo = json['account_no'];
    groupCode = json['group_code'];
    planAmount = json['plan_amount'];
    downloadLink = json['download_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan_name'] = this.planName;
    data['account_no'] = this.accountNo;
    data['group_code'] = this.groupCode;
    data['plan_amount'] = this.planAmount;
    data['download_link'] = this.downloadLink;
    return data;
  }
}
