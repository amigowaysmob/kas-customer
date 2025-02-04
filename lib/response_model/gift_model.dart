class GiftModel {
  String? text;
  Data? data;
  String? link;

  GiftModel({this.text, this.data, this.link});

  GiftModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['link'] = this.link;
    return data;
  }
}

class Data {
  LangData? langData;
  CustomerDetails? customerDetails;
  PlanSummary? planSummary;
  List<GiftData>? giftData;

  Data({this.langData, this.customerDetails, this.planSummary, this.giftData});

  Data.fromJson(Map<String, dynamic> json) {
    langData = json['lang_data'] != null
        ? new LangData.fromJson(json['lang_data'])
        : null;
    customerDetails = json['customer_details'] != null
        ? new CustomerDetails.fromJson(json['customer_details'])
        : null;
    planSummary = json['plan_summary'] != null
        ? new PlanSummary.fromJson(json['plan_summary'])
        : null;
    if (json['gift_data'] != null) {
      giftData = <GiftData>[];
      json['gift_data'].forEach((v) {
        giftData!.add(new GiftData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.langData != null) {
      data['lang_data'] = this.langData!.toJson();
    }
    if (this.customerDetails != null) {
      data['customer_details'] = this.customerDetails!.toJson();
    }
    if (this.planSummary != null) {
      data['plan_summary'] = this.planSummary!.toJson();
    }
    if (this.giftData != null) {
      data['gift_data'] = this.giftData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LangData {
  String? chooseGift;
  String? uploadProof;
  String? skip;
  String? submit;
  String? customerDetails;
  String? customerName;
  String? customerId;
  String? customerAddress;
  String? planSummary;
  String? planName;
  String? duration;
  String? dailyDue;
  String? due;
  String? dueCount;
  String? totalPaid;
  String? gift;
  String? deliveredProof;
  String? passbook;
  String? deliveryProofRequired;
  String? passbookRequired;

  LangData(
      {this.chooseGift,
      this.uploadProof,
      this.skip,
      this.submit,
      this.customerDetails,
      this.customerName,
      this.customerId,
      this.customerAddress,
      this.planSummary,
      this.planName,
      this.duration,
      this.dailyDue,
      this.due,
      this.dueCount,
      this.totalPaid,
      this.gift,
      this.deliveredProof,
      this.passbook,
      this.deliveryProofRequired,
      this.passbookRequired});

  LangData.fromJson(Map<String, dynamic> json) {
    chooseGift = json['choose_gift'];
    uploadProof = json['upload_proof'];
    skip = json['skip'];
    submit = json['submit'];
    customerDetails = json['customer_details'];
    customerName = json['customer_name'];
    customerId = json['customer_id'];
    customerAddress = json['customer_address'];
    planSummary = json['plan_summary'];
    planName = json['plan_name'];
    duration = json['duration'];
    dailyDue = json['daily_due'];
    due = json['due'];
    dueCount = json['due_count'];
    totalPaid = json['total_paid'];
    gift = json['gift'];
    deliveredProof = json['delivered_proof'];
    passbook = json['passbook'];
    deliveryProofRequired = json['delivery_proof_required'];
    passbookRequired = json['passbook_required'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['choose_gift'] = this.chooseGift;
    data['upload_proof'] = this.uploadProof;
    data['skip'] = this.skip;
    data['submit'] = this.submit;
    data['customer_details'] = this.customerDetails;
    data['customer_name'] = this.customerName;
    data['customer_id'] = this.customerId;
    data['customer_address'] = this.customerAddress;
    data['plan_summary'] = this.planSummary;
    data['plan_name'] = this.planName;
    data['duration'] = this.duration;
    data['daily_due'] = this.dailyDue;
    data['due'] = this.due;
    data['due_count'] = this.dueCount;
    data['total_paid'] = this.totalPaid;
    data['gift'] = this.gift;
    data['delivered_proof'] = this.deliveredProof;
    data['passbook'] = this.passbook;
    data['delivery_proof_required'] = this.deliveryProofRequired;
    data['passbook_required'] = this.passbookRequired;
    return data;
  }
}

class CustomerDetails {
  String? name;
  String? customerId;
  String? customerAddress;

  CustomerDetails({this.name, this.customerId, this.customerAddress});

  CustomerDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    customerId = json['customer_id'];
    customerAddress = json['customer_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['customer_id'] = this.customerId;
    data['customer_address'] = this.customerAddress;
    return data;
  }
}

class PlanSummary {
  String? name;
  String? amount;
  String? duration;
  String? dueCount;
  String? paid;

  PlanSummary(
      {this.name, this.amount, this.duration, this.dueCount, this.paid});

  PlanSummary.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amount = json['amount'];
    duration = json['duration'];
    dueCount = json['due_count'];
    paid = json['paid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['duration'] = this.duration;
    data['due_count'] = this.dueCount;
    data['paid'] = this.paid;
    return data;
  }
}

class GiftData {
  String? id;
  String? title;
  String? plan;
  String? price;
  String? image;
  String? barcode;
  String? status;

  GiftData(
      {this.id,
      this.title,
      this.plan,
      this.price,
      this.image,
      this.barcode,
      this.status});

  GiftData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    plan = json['plan'];
    price = json['price'];
    image = json['image'];
    barcode = json['barcode'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['plan'] = this.plan;
    data['price'] = this.price;
    data['image'] = this.image;
    data['barcode'] = this.barcode;
    data['status'] = this.status;
    return data;
  }
}
