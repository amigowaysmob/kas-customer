class GroupCodeRequestModel {
  String? userId;
  String? planType;
  String? planCategory;
  String? lang;

  GroupCodeRequestModel(
      {this.userId, this.planType, this.planCategory, this.lang});

  GroupCodeRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    planType = json['plan_type'];
    planCategory = json['plan_category'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['plan_type'] = this.planType;
    data['plan_category'] = this.planCategory;
    data['lang'] = this.lang;
    return data;
  }
}

