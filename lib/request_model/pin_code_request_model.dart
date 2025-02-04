class PincodeRequestModel {
  String? userId;
  String? pincode;
  String? lang;

  PincodeRequestModel({this.userId, this.pincode, this.lang});

  PincodeRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    pincode = json['pincode'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['pincode'] = this.pincode;
    data['lang'] = this.lang;
    return data;
  }
}
