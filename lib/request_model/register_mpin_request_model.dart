class RegisterMpinRequestModel {
  String? userId;
  String? mpin;
  String? confirmMpin;

  RegisterMpinRequestModel({this.userId, this.mpin, this.confirmMpin});

  RegisterMpinRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    mpin = json['mpin'];
    confirmMpin = json['confirm_mpin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['mpin'] = this.mpin;
    data['confirm_mpin'] = this.confirmMpin;
    return data;
  }
}
