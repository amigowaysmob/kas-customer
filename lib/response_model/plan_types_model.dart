class PlanTypesModel {
  String? text;
  String? message;
  Data? data;

  PlanTypesModel({this.text, this.message, this.data});

  PlanTypesModel.fromJson(Map<String, dynamic> json) {
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
  List<PlanData>? planData;

  Data({this.langData, this.planData});

  Data.fromJson(Map<String, dynamic> json) {
    langData = json['lang_data'] != null
        ? new LangData.fromJson(json['lang_data'])
        : null;
    if (json['plan_data'] != null) {
      planData = <PlanData>[];
      json['plan_data'].forEach((v) {
        planData!.add(new PlanData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.langData != null) {
      data['lang_data'] = this.langData!.toJson();
    }
    if (this.planData != null) {
      data['plan_data'] = this.planData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LangData {
  String? ourPlans;

  LangData({this.ourPlans});

  LangData.fromJson(Map<String, dynamic> json) {
    ourPlans = json['our_plans'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['our_plans'] = this.ourPlans;
    return data;
  }
}

class PlanData {
  String? type;
  String? title;
  String? image;

  PlanData({this.type, this.title, this.image});

  PlanData.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }
}
