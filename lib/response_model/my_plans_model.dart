class MyPlansModel {
  String? text;
  Data? data;

  MyPlansModel({this.text, this.data});

  MyPlansModel.fromJson(Map<String, dynamic> json) {
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
  List<MyPlans>? myPlans;
  PlanCategories? planCategories;
  List<String>? planTypes;
  List<String>? groupCodes;

  Data({this.myPlans, this.planCategories, this.planTypes, this.groupCodes});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['my_plans'] != null) {
      myPlans = <MyPlans>[];
      json['my_plans'].forEach((v) {
        myPlans!.add(new MyPlans.fromJson(v));
      });
    }
    planCategories = json['plan_categories'] != null
        ? new PlanCategories.fromJson(json['plan_categories'])
        : null;
    planTypes = json['plan_types'].cast<String>();
    groupCodes = json['group_codes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.myPlans != null) {
      data['my_plans'] = this.myPlans!.map((v) => v.toJson()).toList();
    }
    if (this.planCategories != null) {
      data['plan_categories'] = this.planCategories!.toJson();
    }
    data['plan_types'] = this.planTypes;
    data['group_codes'] = this.groupCodes;
    return data;
  }
}

class MyPlans {
  String? id;
  String? planName;
  String? customerName;
  String? groupCode;
  String? accountNo;
  String? planAmount;
  String? paidAmount;
  String? planType;

  MyPlans(
      {this.planName,
      this.customerName,
      this.groupCode,
      this.accountNo,
      this.planAmount,
      this.paidAmount,
      this.planType,
      this.id});

  MyPlans.fromJson(Map<String, dynamic> json) {
    planName = json['plan_name'];
    customerName = json['customer_name'];
    groupCode = json['group_code'];
    accountNo = json['account_no'];
    planAmount = json['plan_amount'];
    paidAmount = json['paid_amount'];
    planType = json['plan_type'];
    id=json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan_name'] = this.planName;
    data['customer_name'] = this.customerName;
    data['group_code'] = this.groupCode;
    data['account_no'] = this.accountNo;
    data['plan_amount'] = this.planAmount;
    data['paid_amount'] = this.paidAmount;
    data['plan_type'] = this.planType;
    data['id']=this.id;
    return data;
  }
}

class PlanCategories {
  List<String>? monthly;

  PlanCategories({this.monthly});

  PlanCategories.fromJson(Map<String, dynamic> json) {
    monthly = json['monthly'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['monthly'] = this.monthly;
    return data;
  }
}
