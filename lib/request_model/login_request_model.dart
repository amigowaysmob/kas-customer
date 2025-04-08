class LoginRequestModel {
  String? phoneNumber;
  String? smsSignature;

  LoginRequestModel({this.phoneNumber, this.smsSignature});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    smsSignature = json['sms_signature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone_number'] = this.phoneNumber;
    data['sms_signature'] = this.smsSignature;
    return data;
  }
}

