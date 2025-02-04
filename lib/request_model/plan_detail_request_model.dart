class PlanDetailRequestModel {
  String? userId;
  String? planId;
  String? lang;

  PlanDetailRequestModel({this.userId, this.planId, this.lang});

  PlanDetailRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    planId = json['plan_id'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['plan_id'] = this.planId;
    data['lang'] = this.lang;
    return data;
  }
}
