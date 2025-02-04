class RemoveProfileRequestModel {
  String? userId;
  String? field;
  String? lang;

  RemoveProfileRequestModel({this.userId, this.field, this.lang});

  RemoveProfileRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    field = json['field'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['field'] = this.field;
    data['lang'] = this.lang;
    return data;
  }
}
