class ResendOtpRequestModel {
  String? userId;
  String? phoneNumber;
 String? smsSignature;
  ResendOtpRequestModel({this.userId, this.phoneNumber,this.smsSignature});

  ResendOtpRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    phoneNumber = json['phone_number'];
    smsSignature = json['sms_signature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['phone_number'] = this.phoneNumber;
     data['sms_signature'] = this.smsSignature;
    return data;
  }
}
