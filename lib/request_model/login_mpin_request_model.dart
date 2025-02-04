class LoginMpinRequestModel {
  String? userId;
  String? mpin;
  String? fcmToken;

  LoginMpinRequestModel({this.userId, this.mpin, this.fcmToken});

  LoginMpinRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    mpin = json['mpin'];
    fcmToken = json['fcm_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['mpin'] = this.mpin;
    data['fcm_token'] = this.fcmToken;
    return data;
  }
}
