class HomeRequestModel {
  String? userId;
  String? lang;

  HomeRequestModel({this.userId, this.lang});

  HomeRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['lang'] = this.lang;
    return data;
  }
}
