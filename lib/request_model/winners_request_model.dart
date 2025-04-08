class WinnersRequestModel {
  String? userId;
  String? period;

  WinnersRequestModel({this.userId, this.period});

  WinnersRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    period = json['period'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['period'] = this.period;
    return data;
  }
}
