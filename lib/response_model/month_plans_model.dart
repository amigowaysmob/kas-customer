class MonthPlansModel {
  String? text;
  String? message;
  Data? data;

  MonthPlansModel({this.text, this.message, this.data});

  MonthPlansModel.fromJson(Map<String, dynamic> json) {
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
  String? planTypeName;
  String? duration;
  String? payable;

  LangData({this.planTypeName, this.duration, this.payable});

  LangData.fromJson(Map<String, dynamic> json) {
    planTypeName = json['plan_type_name'];
    duration = json['duration'];
    payable = json['payable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan_type_name'] = this.planTypeName;
    data['duration'] = this.duration;
    data['payable'] = this.payable;
    return data;
  }
}

class PlanData {
  List<Ponmagal>? ponmagal;
  List<Ponmagal>? virucham;

  PlanData({this.ponmagal, this.virucham});

  PlanData.fromJson(Map<String, dynamic> json) {
    if (json['ponmagal'] != null) {
      ponmagal = <Ponmagal>[];
      json['ponmagal'].forEach((v) {
        ponmagal!.add(new Ponmagal.fromJson(v));
      });
    }
    if (json['virucham'] != null) {
      virucham = <Ponmagal>[];
      json['virucham'].forEach((v) {
        virucham!.add(new Ponmagal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ponmagal != null) {
      data['ponmagal'] = this.ponmagal!.map((v) => v.toJson()).toList();
    }
    if (this.virucham != null) {
      data['virucham'] = this.virucham!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ponmagal {
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
  String? created;
  String? modified;

  Ponmagal(
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
      this.created,
      this.modified});

  Ponmagal.fromJson(Map<String, dynamic> json) {
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
    data['created'] = this.created;
    data['modified'] = this.modified;
    return data;
  }
}
