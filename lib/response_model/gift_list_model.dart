class GiftListModel {
  String? text;
  Data? data;

  GiftListModel({this.text, this.data});

  GiftListModel.fromJson(Map<String, dynamic> json) {
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
  List<MyGifts>? myGifts;
  PlanCategories? planCategories;
  List<String>? planTypes;
  List<String>? groupCodes;
  List<Gifts>? gifts;

  Data(
      {this.myGifts,
      this.planCategories,
      this.planTypes,
      this.groupCodes,
      this.gifts});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['my_gifts'] != null) {
      myGifts = <MyGifts>[];
      json['my_gifts'].forEach((v) {
        myGifts!.add(new MyGifts.fromJson(v));
      });
    }
    planCategories = json['plan_categories'] != null
        ? new PlanCategories.fromJson(json['plan_categories'])
        : null;
    planTypes = json['plan_types'].cast<String>();
    groupCodes = json['group_codes'].cast<String>();
    if (json['gifts'] != null) {
      gifts = <Gifts>[];
      json['gifts'].forEach((v) {
        gifts!.add(new Gifts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.myGifts != null) {
      data['my_gifts'] = this.myGifts!.map((v) => v.toJson()).toList();
    }
    if (this.planCategories != null) {
      data['plan_categories'] = this.planCategories!.toJson();
    }
    data['plan_types'] = this.planTypes;
    data['group_codes'] = this.groupCodes;
    if (this.gifts != null) {
      data['gifts'] = this.gifts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyGifts {
  String? orderId;
  String? planName;
  String? groupCode;
  String? accountNo;
  String? planAmount;
  String? giftName;
  String? giftAmount;
  String? giftImage;
  String? giftStatus;

  MyGifts(
      {this.orderId,
      this.planName,
      this.groupCode,
      this.accountNo,
      this.planAmount,
      this.giftName,
      this.giftAmount,
      this.giftImage,
      this.giftStatus});

  MyGifts.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    planName = json['plan_name'];
    groupCode = json['group_code'];
    accountNo = json['account_no'];
    planAmount = json['plan_amount'];
    giftName = json['gift_name'];
    giftAmount = json['gift_amount'];
    giftImage = json['gift_image'];
    giftStatus = json['gift_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['plan_name'] = this.planName;
    data['group_code'] = this.groupCode;
    data['account_no'] = this.accountNo;
    data['plan_amount'] = this.planAmount;
    data['gift_name'] = this.giftName;
    data['gift_amount'] = this.giftAmount;
    data['gift_image'] = this.giftImage;
    data['gift_status'] = this.giftStatus;
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

class Gifts {
  String? giftName;
  String? planName;
  String? groupCode;
  String? planAmount;
  String? giftAmount;
  String? giftImage;

  Gifts(
      {this.giftName,
      this.planName,
      this.groupCode,
      this.planAmount,
      this.giftAmount,
      this.giftImage});

  Gifts.fromJson(Map<String, dynamic> json) {
    giftName = json['gift_name'];
    planName = json['plan_name'];
    groupCode = json['group_code'];
    planAmount = json['plan_amount'];
    giftAmount = json['gift_amount'];
    giftImage = json['gift_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gift_name'] = this.giftName;
    data['plan_name'] = this.planName;
    data['group_code'] = this.groupCode;
    data['plan_amount'] = this.planAmount;
    data['gift_amount'] = this.giftAmount;
    data['gift_image'] = this.giftImage;
    return data;
  }
}
