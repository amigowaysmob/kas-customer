class UserIdRequestModel {
  String? userId;
 String? smsSignature;
 
  UserIdRequestModel({this.userId,this.smsSignature});

  UserIdRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    smsSignature = json['sms_signature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
     data['sms_signature'] = this.smsSignature;
    return data;
  }
}
