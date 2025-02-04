class PlanDetailModel {
  String? text;
  String? message;
  Data? data;

  PlanDetailModel({this.text, this.message, this.data});

  PlanDetailModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  LangData? langData;
  PlanData? planData;

  Data({this.langData, this.planData});

  Data.fromJson(Map<String, dynamic> json) {
    langData = json['lang_data'] != null
        ? new LangData.fromJson(json['lang_data'])
        : null;
    planData = json['plan_data'] != null
        ? new PlanData.fromJson(json['plan_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.langData != null) {
      data['lang_data'] = this.langData!.toJson();
    }
    if (this.planData != null) {
      data['plan_data'] = this.planData!.toJson();
    }
    return data;
  }
}

class LangData {
  String? planDetails;
  String? planSubHeading;
  String? welcomePlanDetail;

  LangData({this.planDetails, this.planSubHeading, this.welcomePlanDetail});

  LangData.fromJson(Map<String, dynamic> json) {
    planDetails = json['plan_details'];
    planSubHeading = json['plan_sub_heading'];
    welcomePlanDetail = json['welcome_plan_detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan_details'] = this.planDetails;
    data['plan_sub_heading'] = this.planSubHeading;
    data['welcome_plan_detail'] = this.welcomePlanDetail;
    return data;
  }
}

class PlanData {
  String? id;
  String? planName;
  String? groupCode;
  String? duration;
  String? planType;
  String? category;
  String? planAmount;
  String? dueCountLimit;
  String? description;
  String? gift;
  String? status;
  String? pastDueLimit;
  String? advancedDueLimit;
  String? amountLimit;
  String? issueGift;
  String? created;
  String? modified;

  PlanData(
      {this.id,
      this.planName,
      this.groupCode,
      this.duration,
      this.planType,
      this.category,
      this.planAmount,
      this.dueCountLimit,
      this.description,
      this.gift,
      this.status,
      this.pastDueLimit,
      this.advancedDueLimit,
      this.amountLimit,
      this.issueGift,
      this.created,
      this.modified});

  PlanData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    planName = json['plan_name'];
    groupCode = json['group_code'];
    duration = json['duration'];
    planType = json['plan_type'];
    category = json['category'];
    planAmount = json['plan_amount'];
    dueCountLimit = json['due_count_limit'];
    description = json['description'];
    gift = json['gift'];
    status = json['status'];
    pastDueLimit = json['past_due_limit'];
    advancedDueLimit = json['advanced_due_limit'];
    amountLimit = json['amount_limit'];
    issueGift = json['issue_gift'];
    created = json['created'];
    modified = json['modified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['plan_name'] = this.planName;
    data['group_code'] = this.groupCode;
    data['duration'] = this.duration;
    data['plan_type'] = this.planType;
    data['category'] = this.category;
    data['plan_amount'] = this.planAmount;
    data['due_count_limit'] = this.dueCountLimit;
    data['description'] = this.description;
    data['gift'] = this.gift;
    data['status'] = this.status;
    data['past_due_limit'] = this.pastDueLimit;
    data['advanced_due_limit'] = this.advancedDueLimit;
    data['amount_limit'] = this.amountLimit;
    data['issue_gift'] = this.issueGift;
    data['created'] = this.created;
    data['modified'] = this.modified;
    return data;
  }
}
