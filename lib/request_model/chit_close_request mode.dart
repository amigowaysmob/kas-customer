class ChitCloseRequestModel {
  String? userId;
  String? id;
  String? lang;

  ChitCloseRequestModel({this.userId, this.id, this.lang});

  ChitCloseRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    id = json['id'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['id'] = this.id;
    data['lang'] = this.lang;
    return data;
  }
}
