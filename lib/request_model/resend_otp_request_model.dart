class ResendOtpRequestModel {
  String? userId;
  String? phoneNumber;

  ResendOtpRequestModel({this.userId, this.phoneNumber});

  ResendOtpRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}
