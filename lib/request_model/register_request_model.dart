class RegisterRequestModel {
  String? email;
  String? fullName;
  String? phoneNumber;
   String? smsSignature;

  RegisterRequestModel({this.email, this.fullName, this.phoneNumber,this.smsSignature});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    fullName = json['full_name'];
    phoneNumber = json['phone_number'];
    smsSignature = json['sms_signature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['full_name'] = this.fullName;
    data['phone_number'] = this.phoneNumber;
     data['sms_signature'] = this.smsSignature;
    return data;
  }
}
