class PlansRequestModel {
  String? userId;
  String? type;
  String? lang;

  PlansRequestModel({this.userId, this.type, this.lang});

  PlansRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    type = json['type'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['type'] = this.type;
    data['lang'] = this.lang;
    return data;
  }
}
