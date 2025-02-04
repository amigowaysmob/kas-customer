class PayOthersOtpRequestModel {
  String? userId;
  String? phoneNumber;
  String? lang;

  PayOthersOtpRequestModel({this.userId, this.phoneNumber, this.lang});

  PayOthersOtpRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    phoneNumber = json['phone_number'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['phone_number'] = this.phoneNumber;
    data['lang'] = this.lang;
    return data;
  }
}
