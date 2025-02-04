class MobileCheckRequestModel {
  String? userId;
  String? lang;
  String? number;

  MobileCheckRequestModel({this.userId, this.lang, this.number});

  MobileCheckRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    lang = json['lang'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['lang'] = this.lang;
    data['number'] = this.number;
    return data;
  }
}
