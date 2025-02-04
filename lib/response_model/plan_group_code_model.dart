class PlanGroupCodeModel {
  String? text;
  Data? data;

  PlanGroupCodeModel({this.text, this.data});

  PlanGroupCodeModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  PlanData? planData;

  Data({this.planData});

  Data.fromJson(Map<String, dynamic> json) {
    planData = json['plan_data'] != null
        ? new PlanData.fromJson(json['plan_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.planData != null) {
      data['plan_data'] = this.planData!.toJson();
    }
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
  String? bonusEligiblePercent;
  String? startingBonus;
  String? bonusPercent;
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
      this.bonusEligiblePercent,
      this.startingBonus,
      this.bonusPercent,
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
    bonusEligiblePercent = json['bonus_eligible_percent'];
    startingBonus = json['starting_bonus'];
    bonusPercent = json['bonus_percent'];
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
    data['bonus_eligible_percent'] = this.bonusEligiblePercent;
    data['starting_bonus'] = this.startingBonus;
    data['bonus_percent'] = this.bonusPercent;
    data['created'] = this.created;
    data['modified'] = this.modified;
    return data;
  }
}
