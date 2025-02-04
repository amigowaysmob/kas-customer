class PayOthersModel {
  String? text;
  String? message;
  List<Data>? data;

  PayOthersModel({this.text, this.message, this.data});

  PayOthersModel.fromJson(Map<String, dynamic> json) {
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
  String? accountId;
  String? customerId;
  String? accountNo;
  String? customerPhoneNumber;
  String? customerName;
  String? location;
  String? customerIdentifyId;
  String? planName;
  String? planCount;
  String? status;

  Data(
      {this.accountId,
      this.customerId,
      this.accountNo,
      this.customerPhoneNumber,
      this.customerName,
      this.location,
      this.customerIdentifyId,
      this.planName,
      this.planCount,
      this.status});

  Data.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    customerId = json['customer_id'];
    accountNo = json['account_no'];
    customerPhoneNumber = json['customer_phone_number'];
    customerName = json['customer_name'];
    location = json['location'];
    customerIdentifyId = json['customer_identify_id'];
    planName = json['plan_name'];
    planCount = json['plan_count'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_id'] = this.accountId;
    data['customer_id'] = this.customerId;
    data['account_no'] = this.accountNo;
    data['customer_phone_number'] = this.customerPhoneNumber;
    data['customer_name'] = this.customerName;
    data['location'] = this.location;
    data['customer_identify_id'] = this.customerIdentifyId;
    data['plan_name'] = this.planName;
    data['plan_count'] = this.planCount;
    data['status'] = this.status;
    return data;
  }
}
