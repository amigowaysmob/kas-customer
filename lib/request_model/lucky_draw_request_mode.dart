class LuckyDrawRequestModel {
  String? userId;
  String? lang;
  String? period;

  LuckyDrawRequestModel({this.userId, this.lang, this.period});

  LuckyDrawRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    lang = json['lang'];
    period = json['period'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['lang'] = this.lang;
    data['period'] = this.period;
    return data;
  }
}

