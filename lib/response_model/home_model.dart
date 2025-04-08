class HomeModel {
  String? text;
  Data? data;

  HomeModel({this.text, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
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
  List<Sections>? sections;
int? feedbackShow;
 LangData? langData;
  Data({this.sections,this.feedbackShow,this.langData});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(new Sections.fromJson(v));
      });
    }
     feedbackShow = json['feedback_show'];
      langData = json['lang_data'] != null
        ? new LangData.fromJson(json['lang_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sections != null) {
      data['sections'] = this.sections!.map((v) => v.toJson()).toList();
    }
    data['feedback_show'] = this.feedbackShow;
     if (this.langData != null) {
      data['lang_data'] = this.langData!.toJson();
    }
    return data;
  }
}

class Sections {
  String? section;
  String? headerImage;
  GoldSilverPrice? goldSilverPrice;
  List<String>? banners;
  List<Carddata>? carddata;
  List<Myplans>? myplans;
  List<HomeIcons>? homeIcons;

  Sections(
      {this.section,
      this.headerImage,
      this.goldSilverPrice,
      this.banners,
      this.carddata,
      this.myplans,
      this.homeIcons});

  Sections.fromJson(Map<String, dynamic> json) {
  section = json['section'];
  headerImage = json['header_image'];
  goldSilverPrice = json['gold_silver_price'] != null
      ? GoldSilverPrice.fromJson(json['gold_silver_price'])
      : null;
  banners = json['banners'] != null ? List<String>.from(json['banners']) : null; // Safe check for null
  if (json['carddata'] != null) {
    carddata = <Carddata>[];
    json['carddata'].forEach((v) {
      carddata!.add(Carddata.fromJson(v));
    });
  }
  if (json['myplans'] != null) {
    myplans = <Myplans>[];
    json['myplans'].forEach((v) {
      myplans!.add(Myplans.fromJson(v));
    });
  }
  if (json['home_icons'] != null) {
    homeIcons = <HomeIcons>[];
    json['home_icons'].forEach((v) {
      homeIcons!.add(HomeIcons.fromJson(v));
    });
  }
}


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['section'] = this.section;
    data['header_image'] = this.headerImage;
    if (this.goldSilverPrice != null) {
      data['gold_silver_price'] = this.goldSilverPrice!.toJson();
    }
    data['banners'] = this.banners;
    if (this.carddata != null) {
      data['carddata'] = this.carddata!.map((v) => v.toJson()).toList();
    }
    if (this.myplans != null) {
      data['myplans'] = this.myplans!.map((v) => v.toJson()).toList();
    }
    if (this.homeIcons != null) {
      data['home_icons'] = this.homeIcons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GoldSilverPrice {
  String? priceUpdatedTime;
  String? goldPrice;
  String? silverPrice;

  GoldSilverPrice({this.priceUpdatedTime, this.goldPrice, this.silverPrice});

  GoldSilverPrice.fromJson(Map<String, dynamic> json) {
    priceUpdatedTime = json['price_updated_time'];
    goldPrice = json['gold_price'];
    silverPrice = json['silver_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price_updated_time'] = this.priceUpdatedTime;
    data['gold_price'] = this.goldPrice;
    data['silver_price'] = this.silverPrice;
    return data;
  }
}

class Carddata {
  String? cardBgPng;
  String? welcome;
  String? fullName;
  String? customerId;
  String? phoneNumber;
  String? status;
  String? date;
  String? totalAccount;
  String? ownSavings;
  String? referralSavings;
  String? totalSavings;
  String? nextDueDate;
  String? nextDueAmount;
  String? time;

  Carddata(
      {this.cardBgPng,
      this.welcome,
      this.fullName,
      this.customerId,
      this.phoneNumber,
      this.status,
      this.date,
      this.totalAccount,
      this.ownSavings,
      this.referralSavings,
      this.totalSavings,
      this.nextDueDate,
      this.nextDueAmount,
      this.time});

  Carddata.fromJson(Map<String, dynamic> json) {
    cardBgPng = json['card_bg_png'];
    welcome = json['welcome'];
    fullName = json['full_name'];
    customerId = json['customer_id'];
    phoneNumber = json['phone_number'];
    status = json['status'];
    date = json['date'];
    totalAccount = json['total_account'];
    ownSavings = json['own_savings'];
    referralSavings = json['referral_savings'];
    totalSavings = json['total_savings'];
    nextDueDate = json['next_due_date'];
    nextDueAmount = json['next_due_amount'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['card_bg_png'] = this.cardBgPng;
    data['welcome'] = this.welcome;
    data['full_name'] = this.fullName;
    data['customer_id'] = this.customerId;
    data['phone_number'] = this.phoneNumber;
    data['status'] = this.status;
    data['date'] = this.date;
    data['total_account'] = this.totalAccount;
    data['own_savings'] = this.ownSavings;
    data['referral_savings'] = this.referralSavings;
    data['total_savings'] = this.totalSavings;
    data['next_due_date'] = this.nextDueDate;
    data['next_due_amount'] = this.nextDueAmount;
    data['time'] = this.time;
    return data;
  }
}

class Myplans {
  String? id;
  String? planCreated;
  String? planType;
  String? planName;
  String? duration;
  String? payable;
  String? progress;
  String? record;
  String? dueDate;

  Myplans(
      {this.id,
      this.planCreated,
      this.planType,
      this.planName,
      this.duration,
      this.payable,
      this.progress,
      this.record,
      this.dueDate});

  Myplans.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    planCreated = json['plan_created'];
    planType = json['plan_type'];
    planName = json['plan_name'];
    duration = json['duration'];
    payable = json['payable'];
    progress = json['progress'];
    record = json['record'];
    dueDate = json['due_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['plan_created'] = this.planCreated;
    data['plan_type'] = this.planType;
    data['plan_name'] = this.planName;
    data['duration'] = this.duration;
    data['payable'] = this.payable;
    data['progress'] = this.progress;
    data['record'] = this.record;
    data['due_date'] = this.dueDate;
    return data;
  }
}


class HomeIcons {
  String? accountLimit;
  String? key;
  String? chitCount;
  String? label;
  String? image;

  HomeIcons(
      {this.accountLimit, this.key, this.chitCount, this.label, this.image});

  HomeIcons.fromJson(Map<String, dynamic> json) {
    accountLimit = json['account_limit'];
    key = json['key'];
    chitCount = json['chit_count'];
    label = json['label'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_limit'] = this.accountLimit;
    data['key'] = this.key;
    data['chit_count'] = this.chitCount;
    data['label'] = this.label;
    data['image'] = this.image;
    return data;
  }
}
class LangData {
  String? todayGoldRate;
  String? todayGoldPrice;
  String? todaySilverPrice;
  String? welcome;
  String? status;
  String? date;
  String? time;
  String? totalAccount;
  String? ownSavings;
  String? referralSavings;
  String? totalSavings;
  String? nextDueDate;
  String? nextDueAmount;
  String? viewAll;
  String? joinPlans;
  String? myLedger;
  String? payDues;
  String? paidAmountDetail;
  String? paidAmountDetails;
  String? duration;
  String? payable;
  String? payNow;
  String? maximumChitCountReached;
  String? cancel;
  String? contactTeam;
  String? viewPassbook;
  String? payForOthers;
  String? myWallet;
  String? othersGift;
  String? eCatalogue;
  String? feedback;
  String? planCreated;

  LangData(
      {this.todayGoldRate,
      this.todayGoldPrice,
      this.todaySilverPrice,
      this.welcome,
      this.status,
      this.date,
      this.time,
      this.totalAccount,
      this.ownSavings,
      this.referralSavings,
      this.totalSavings,
      this.nextDueDate,
      this.nextDueAmount,
      this.viewAll,
      this.joinPlans,
      this.myLedger,
      this.payDues,
      this.paidAmountDetail,
      this.paidAmountDetails,
      this.duration,
      this.payable,
      this.payNow,
      this.maximumChitCountReached,
      this.cancel,
      this.contactTeam,
      this.viewPassbook,
      this.payForOthers,
      this.myWallet,
      this.othersGift,
      this.eCatalogue,
      this.feedback,
      this.planCreated});

  LangData.fromJson(Map<String, dynamic> json) {
    todayGoldRate = json['today_gold_rate'];
    todayGoldPrice = json['today_gold_price'];
    todaySilverPrice = json['today_silver_price'];
    welcome = json['welcome'];
    status = json['status'];
    date = json['date'];
    time = json['time'];
    totalAccount = json['total_account'];
    ownSavings = json['own_savings'];
    referralSavings = json['referral_savings'];
    totalSavings = json['total_savings'];
    nextDueDate = json['next_due_date'];
    nextDueAmount = json['next_due_amount'];
    viewAll = json['view_all'];
    joinPlans = json['join_plans'];
    myLedger = json['my_ledger'];
    payDues = json['pay_dues'];
    paidAmountDetail = json['paid_amount_detail'];
    paidAmountDetails = json['paid_amount_details'];
    duration = json['duration'];
    payable = json['payable'];
    payNow = json['pay_now'];
    maximumChitCountReached = json['maximum_chit_count_reached'];
    cancel = json['cancel'];
    contactTeam = json['contact_team'];
    viewPassbook = json['view_passbook'];
    payForOthers = json['pay_for_others'];
    myWallet = json['my_wallet'];
    othersGift = json['others_gift'];
    eCatalogue = json['e_catalogue'];
    feedback = json['feedback'];
    planCreated = json['plan_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['today_gold_rate'] = this.todayGoldRate;
    data['today_gold_price'] = this.todayGoldPrice;
    data['today_silver_price'] = this.todaySilverPrice;
    data['welcome'] = this.welcome;
    data['status'] = this.status;
    data['date'] = this.date;
    data['time'] = this.time;
    data['total_account'] = this.totalAccount;
    data['own_savings'] = this.ownSavings;
    data['referral_savings'] = this.referralSavings;
    data['total_savings'] = this.totalSavings;
    data['next_due_date'] = this.nextDueDate;
    data['next_due_amount'] = this.nextDueAmount;
    data['view_all'] = this.viewAll;
    data['join_plans'] = this.joinPlans;
    data['my_ledger'] = this.myLedger;
    data['pay_dues'] = this.payDues;
    data['paid_amount_detail'] = this.paidAmountDetail;
    data['paid_amount_details'] = this.paidAmountDetails;
    data['duration'] = this.duration;
    data['payable'] = this.payable;
    data['pay_now'] = this.payNow;
    data['maximum_chit_count_reached'] = this.maximumChitCountReached;
    data['cancel'] = this.cancel;
    data['contact_team'] = this.contactTeam;
    data['view_passbook'] = this.viewPassbook;
    data['pay_for_others'] = this.payForOthers;
    data['my_wallet'] = this.myWallet;
    data['others_gift'] = this.othersGift;
    data['e_catalogue'] = this.eCatalogue;
    data['feedback'] = this.feedback;
    data['plan_created'] = this.planCreated;
    return data;
  }
}