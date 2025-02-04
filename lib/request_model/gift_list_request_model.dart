class GiftListRequestModel {
  String? userId;
  String? groupCode;
  String? lang;

  GiftListRequestModel({this.userId, this.groupCode, this.lang});

  GiftListRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    groupCode = json['group_code'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['group_code'] = this.groupCode;
    data['lang'] = this.lang;
    return data;
  }
}
