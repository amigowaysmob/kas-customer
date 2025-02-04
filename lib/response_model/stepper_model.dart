class StepperModel {
  String? text;
  Data? data;

  StepperModel({this.text, this.data});

  StepperModel.fromJson(Map<String, dynamic> json) {
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
  LangData? langData;
  CustomerData? customerData;
  List<DistrictData>? districtData;
  List<PlanData>? planData;
  List<QrData>? qrData;

  Data(
      {this.langData,
      this.customerData,
      this.districtData,
      this.planData,
      this.qrData});

  Data.fromJson(Map<String, dynamic> json) {
    langData = json['lang_data'] != null
        ? new LangData.fromJson(json['lang_data'])
        : null;
    customerData = json['customer_data'] != null
        ? new CustomerData.fromJson(json['customer_data'])
        : null;
    if (json['district_data'] != null) {
      districtData = <DistrictData>[];
      json['district_data'].forEach((v) {
        districtData!.add(new DistrictData.fromJson(v));
      });
    }
    if (json['plan_data'] != null) {
      planData = <PlanData>[];
      json['plan_data'].forEach((v) {
        planData!.add(new PlanData.fromJson(v));
      });
    }
    if (json['qr_data'] != null) {
      qrData = <QrData>[];
      json['qr_data'].forEach((v) {
        qrData!.add(new QrData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.langData != null) {
      data['lang_data'] = this.langData!.toJson();
    }
    if (this.customerData != null) {
      data['customer_data'] = this.customerData!.toJson();
    }
    if (this.districtData != null) {
      data['district_data'] =
          this.districtData!.map((v) => v.toJson()).toList();
    }
    if (this.planData != null) {
      data['plan_data'] = this.planData!.map((v) => v.toJson()).toList();
    }
    if (this.qrData != null) {
      data['qr_data'] = this.qrData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LangData {
  String? customerRegistrationForm;
  String? customerForm;
  String? fullName;
  String? guardianName;
  String? mobileNumber;
  String? whatsappNumber;
  String? email;
  String? gender;
  String? dateOfBirth;
  String? pincode;
  String? state;
  String? city;
  String? district;
  String? circle;
  String? area;
  String? division;
  String? postalCode;
  String? address1;
  String? address2;
  String? landmark;
  String? customerPhoto;
  String? idProofPhoto;
  String? idProofPhotoFront;
  String? idProofPhotoBack;
  String? aadharCard;
  String? panCard;
  String? next;
  String? nomineeRegistrationForm;
  String? nomineeForm;
  String? nomineeName;
  String? relationship;
  String? nomineePhoto;
  String? plan;
  String? selectYourPlan;
  String? dailyGoldPlan;
  String? weeklyGoldPlan;
  String? monthlyGoldPlan;
  String? duration;
  String? payableInDays;
  String? payableInWeeks;
  String? payableInMonths;
  String? paymentMode;
  String? customerDetails;
  String? customerName;
  String? customerId;
  String? customerAddress;
  String? planSummary;
  String? planName;
  String? dailyDue;
  String? dueCount;
  String? totalPayable;
  String? termsAndConditions;
  String? orderSummary;
  String? upiDetails;
  String? uploadScreenshot;
  String? yourPaymentScreenshot;
  String? addTransactionId;
  String? paymentTransactionId;
  String? male;
  String? female;
  String? others;
  String? nameRequired;
  String? whatsappRequired;
  String? genderRequired;
  String? pincodeRequired;
  String? cityRequired;
  String? dobRequired;
  String? addressRequired;
  String? photoRequired;
  String? aadhaarFrontRequired;
  String? aadhaarBackRequired;
  String? panFrontRequired;
  String? panBackRequired;
  String? planRequired;
  String? paymentModeRequired;
  String? termsAgreementRequired;
  String? customerPhotoRequired;
  String? aadhaarCardRequired;
  String? panCardRequired;
  String? paymentScreenshotRequired;
  String? idProofFrontRequired;
  String? idProofBackRequired;
  String? idTypeRequired;
  String? join;
  String? joined;
  String? close;
  String? change;
  String? online;
  String? cash;
  String? numberValidatedRequired;
  String? back;
  String? submit;
  String? downloadReceipt;
  String? clickHereMoreDetails;
  String? leaveCustomerForm;
  String? yes;
  String? no;
  String? weeklyDue;
  String? monthlyDue;
  String? gift;
  String? doYouWantGift;
  String? chooseGift;
  String? uploadProof;
  String? skip;
  String? homeCollection;

  LangData(
      {this.customerRegistrationForm,
      this.customerForm,
      this.fullName,
      this.guardianName,
      this.mobileNumber,
      this.whatsappNumber,
      this.email,
      this.gender,
      this.dateOfBirth,
      this.pincode,
      this.state,
      this.city,
      this.district,
      this.circle,
      this.area,
      this.division,
      this.postalCode,
      this.address1,
      this.address2,
      this.landmark,
      this.customerPhoto,
      this.idProofPhoto,
      this.idProofPhotoFront,
      this.idProofPhotoBack,
      this.aadharCard,
      this.panCard,
      this.next,
      this.nomineeRegistrationForm,
      this.nomineeForm,
      this.nomineeName,
      this.relationship,
      this.nomineePhoto,
      this.plan,
      this.selectYourPlan,
      this.dailyGoldPlan,
      this.weeklyGoldPlan,
      this.monthlyGoldPlan,
      this.duration,
      this.payableInDays,
      this.payableInWeeks,
      this.payableInMonths,
      this.paymentMode,
      this.customerDetails,
      this.customerName,
      this.customerId,
      this.customerAddress,
      this.planSummary,
      this.planName,
      this.dailyDue,
      this.dueCount,
      this.totalPayable,
      this.termsAndConditions,
      this.orderSummary,
      this.upiDetails,
      this.uploadScreenshot,
      this.yourPaymentScreenshot,
      this.addTransactionId,
      this.paymentTransactionId,
      this.male,
      this.female,
      this.others,
      this.nameRequired,
      this.whatsappRequired,
      this.genderRequired,
      this.pincodeRequired,
      this.cityRequired,
      this.dobRequired,
      this.addressRequired,
      this.photoRequired,
      this.aadhaarFrontRequired,
      this.aadhaarBackRequired,
      this.panFrontRequired,
      this.panBackRequired,
      this.planRequired,
      this.paymentModeRequired,
      this.termsAgreementRequired,
      this.customerPhotoRequired,
      this.aadhaarCardRequired,
      this.panCardRequired,
      this.paymentScreenshotRequired,
      this.idProofFrontRequired,
      this.idProofBackRequired,
      this.idTypeRequired,
      this.join,
      this.joined,
      this.close,
      this.change,
      this.online,
      this.cash,
      this.numberValidatedRequired,
      this.back,
      this.submit,
      this.downloadReceipt,
      this.clickHereMoreDetails,
      this.leaveCustomerForm,
      this.yes,
      this.no,
      this.weeklyDue,
      this.monthlyDue,
      this.gift,
      this.doYouWantGift,
      this.chooseGift,
      this.uploadProof,
      this.skip,
      this.homeCollection});

  LangData.fromJson(Map<String, dynamic> json) {
    customerRegistrationForm = json['customer_registration_form'];
    customerForm = json['customer_form'];
    fullName = json['full_name'];
    guardianName = json['guardian_name'];
    mobileNumber = json['mobile_number'];
    whatsappNumber = json['whatsapp_number'];
    email = json['email'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    pincode = json['pincode'];
    state = json['state'];
    city = json['city'];
    district = json['district'];
    circle = json['circle'];
    area = json['area'];
    division = json['division'];
    postalCode = json['postal_code'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    landmark = json['landmark'];
    customerPhoto = json['customer_photo'];
    idProofPhoto = json['id_proof_photo'];
    idProofPhotoFront = json['id_proof_photo_front'];
    idProofPhotoBack = json['id_proof_photo_back'];
    aadharCard = json['aadhar_card'];
    panCard = json['pan_card'];
    next = json['next'];
    nomineeRegistrationForm = json['nominee_registration_form'];
    nomineeForm = json['nominee_form'];
    nomineeName = json['nominee_name'];
    relationship = json['relationship'];
    nomineePhoto = json['nominee_photo'];
    plan = json['plan'];
    selectYourPlan = json['select_your_plan'];
    dailyGoldPlan = json['daily_gold_plan'];
    weeklyGoldPlan = json['weekly_gold_plan'];
    monthlyGoldPlan = json['monthly_gold_plan'];
    duration = json['duration'];
    payableInDays = json['payable_(in_days)'];
    payableInWeeks = json['payable_(in_weeks)'];
    payableInMonths = json['payable_(in_months)'];
    paymentMode = json['payment_mode'];
    customerDetails = json['customer_details'];
    customerName = json['customer_name'];
    customerId = json['customer_id'];
    customerAddress = json['customer_address'];
    planSummary = json['plan_summary'];
    planName = json['plan_name'];
    dailyDue = json['daily_due'];
    dueCount = json['due_count'];
    totalPayable = json['total_payable'];
    termsAndConditions = json['terms_and_conditions'];
    orderSummary = json['order_summary'];
    upiDetails = json['upi_details'];
    uploadScreenshot = json['upload_screenshot'];
    yourPaymentScreenshot = json['your_payment_screenshot'];
    addTransactionId = json['add_transaction_id'];
    paymentTransactionId = json['payment_transaction_id'];
    male = json['male'];
    female = json['female'];
    others = json['others'];
    nameRequired = json['name_required'];
    whatsappRequired = json['whatsapp_required'];
    genderRequired = json['gender_required'];
    pincodeRequired = json['pincode_required'];
    cityRequired = json['city_required'];
    dobRequired = json['dob_required'];
    addressRequired = json['address_required'];
    photoRequired = json['photo_required'];
    aadhaarFrontRequired = json['aadhaar_front_required'];
    aadhaarBackRequired = json['aadhaar_back_required'];
    panFrontRequired = json['pan_front_required'];
    panBackRequired = json['pan_back_required'];
    planRequired = json['plan_required'];
    paymentModeRequired = json['payment_mode_required'];
    termsAgreementRequired = json['terms_agreement_required'];
    customerPhotoRequired = json['customer_photo_required'];
    aadhaarCardRequired = json['aadhaar_card_required'];
    panCardRequired = json['pan_card_required'];
    paymentScreenshotRequired = json['payment_screenshot_required'];
    idProofFrontRequired = json['id_proof_front_required'];
    idProofBackRequired = json['id_proof_back_required'];
    idTypeRequired = json['id_type_required'];
    join = json['join'];
    joined = json['joined'];
    close = json['close'];
    change = json['change'];
    online = json['online'];
    cash = json['cash'];
    numberValidatedRequired = json['number_validated_required'];
    back = json['back'];
    submit = json['submit'];
    downloadReceipt = json['download_receipt'];
    clickHereMoreDetails = json['click_here_more_details'];
    leaveCustomerForm = json['leave_customer_form'];
    yes = json['yes'];
    no = json['no'];
    weeklyDue = json['weekly_due'];
    monthlyDue = json['monthly_due'];
    gift = json['gift'];
    doYouWantGift = json['do_you_want_gift'];
    chooseGift = json['choose_gift'];
    uploadProof = json['upload_proof'];
    skip = json['skip'];
    homeCollection = json['home_collection'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_registration_form'] = this.customerRegistrationForm;
    data['customer_form'] = this.customerForm;
    data['full_name'] = this.fullName;
    data['guardian_name'] = this.guardianName;
    data['mobile_number'] = this.mobileNumber;
    data['whatsapp_number'] = this.whatsappNumber;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['pincode'] = this.pincode;
    data['state'] = this.state;
    data['city'] = this.city;
    data['district'] = this.district;
    data['circle'] = this.circle;
    data['area'] = this.area;
    data['division'] = this.division;
    data['postal_code'] = this.postalCode;
    data['address_1'] = this.address1;
    data['address_2'] = this.address2;
    data['landmark'] = this.landmark;
    data['customer_photo'] = this.customerPhoto;
    data['id_proof_photo'] = this.idProofPhoto;
    data['id_proof_photo_front'] = this.idProofPhotoFront;
    data['id_proof_photo_back'] = this.idProofPhotoBack;
    data['aadhar_card'] = this.aadharCard;
    data['pan_card'] = this.panCard;
    data['next'] = this.next;
    data['nominee_registration_form'] = this.nomineeRegistrationForm;
    data['nominee_form'] = this.nomineeForm;
    data['nominee_name'] = this.nomineeName;
    data['relationship'] = this.relationship;
    data['nominee_photo'] = this.nomineePhoto;
    data['plan'] = this.plan;
    data['select_your_plan'] = this.selectYourPlan;
    data['daily_gold_plan'] = this.dailyGoldPlan;
    data['weekly_gold_plan'] = this.weeklyGoldPlan;
    data['monthly_gold_plan'] = this.monthlyGoldPlan;
    data['duration'] = this.duration;
    data['payable_(in_days)'] = this.payableInDays;
    data['payable_(in_weeks)'] = this.payableInWeeks;
    data['payable_(in_months)'] = this.payableInMonths;
    data['payment_mode'] = this.paymentMode;
    data['customer_details'] = this.customerDetails;
    data['customer_name'] = this.customerName;
    data['customer_id'] = this.customerId;
    data['customer_address'] = this.customerAddress;
    data['plan_summary'] = this.planSummary;
    data['plan_name'] = this.planName;
    data['daily_due'] = this.dailyDue;
    data['due_count'] = this.dueCount;
    data['total_payable'] = this.totalPayable;
    data['terms_and_conditions'] = this.termsAndConditions;
    data['order_summary'] = this.orderSummary;
    data['upi_details'] = this.upiDetails;
    data['upload_screenshot'] = this.uploadScreenshot;
    data['your_payment_screenshot'] = this.yourPaymentScreenshot;
    data['add_transaction_id'] = this.addTransactionId;
    data['payment_transaction_id'] = this.paymentTransactionId;
    data['male'] = this.male;
    data['female'] = this.female;
    data['others'] = this.others;
    data['name_required'] = this.nameRequired;
    data['whatsapp_required'] = this.whatsappRequired;
    data['gender_required'] = this.genderRequired;
    data['pincode_required'] = this.pincodeRequired;
    data['city_required'] = this.cityRequired;
    data['dob_required'] = this.dobRequired;
    data['address_required'] = this.addressRequired;
    data['photo_required'] = this.photoRequired;
    data['aadhaar_front_required'] = this.aadhaarFrontRequired;
    data['aadhaar_back_required'] = this.aadhaarBackRequired;
    data['pan_front_required'] = this.panFrontRequired;
    data['pan_back_required'] = this.panBackRequired;
    data['plan_required'] = this.planRequired;
    data['payment_mode_required'] = this.paymentModeRequired;
    data['terms_agreement_required'] = this.termsAgreementRequired;
    data['customer_photo_required'] = this.customerPhotoRequired;
    data['aadhaar_card_required'] = this.aadhaarCardRequired;
    data['pan_card_required'] = this.panCardRequired;
    data['payment_screenshot_required'] = this.paymentScreenshotRequired;
    data['id_proof_front_required'] = this.idProofFrontRequired;
    data['id_proof_back_required'] = this.idProofBackRequired;
    data['id_type_required'] = this.idTypeRequired;
    data['join'] = this.join;
    data['joined'] = this.joined;
    data['close'] = this.close;
    data['change'] = this.change;
    data['online'] = this.online;
    data['cash'] = this.cash;
    data['number_validated_required'] = this.numberValidatedRequired;
    data['back'] = this.back;
    data['submit'] = this.submit;
    data['download_receipt'] = this.downloadReceipt;
    data['click_here_more_details'] = this.clickHereMoreDetails;
    data['leave_customer_form'] = this.leaveCustomerForm;
    data['yes'] = this.yes;
    data['no'] = this.no;
    data['weekly_due'] = this.weeklyDue;
    data['monthly_due'] = this.monthlyDue;
    data['gift'] = this.gift;
    data['do_you_want_gift'] = this.doYouWantGift;
    data['choose_gift'] = this.chooseGift;
    data['upload_proof'] = this.uploadProof;
    data['skip'] = this.skip;
    data['home_collection'] = this.homeCollection;
    return data;
  }
}

class CustomerData {
  String? name;
  String? guardianName;
  String? email;
  String? whatsappNumber;
  String? phoneNumber;

  CustomerData(
      {this.name,
      this.guardianName,
      this.email,
      this.whatsappNumber,
      this.phoneNumber});

  CustomerData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    guardianName = json['guardian_name'];
    email = json['email'];
    whatsappNumber = json['whatsapp_number'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['guardian_name'] = this.guardianName;
    data['email'] = this.email;
    data['whatsapp_number'] = this.whatsappNumber;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}

class DistrictData {
  String? id;
  String? stateId;
  String? districtCode;
  String? name;
  String? seourl;
  String? status;
  String? featured;
  String? description;
  String? dateAdded;

  DistrictData(
      {this.id,
      this.stateId,
      this.districtCode,
      this.name,
      this.seourl,
      this.status,
      this.featured,
      this.description,
      this.dateAdded});

  DistrictData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stateId = json['state_id'];
    districtCode = json['district_code'];
    name = json['name'];
    seourl = json['seourl'];
    status = json['status'];
    featured = json['featured'];
    description = json['description'];
    dateAdded = json['dateAdded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['state_id'] = this.stateId;
    data['district_code'] = this.districtCode;
    data['name'] = this.name;
    data['seourl'] = this.seourl;
    data['status'] = this.status;
    data['featured'] = this.featured;
    data['description'] = this.description;
    data['dateAdded'] = this.dateAdded;
    return data;
  }
}

class PlanData {
  String? title;
  List<Values>? values;

  PlanData({this.title, this.values});

  PlanData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(new Values.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.values != null) {
      data['values'] = this.values!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Values {
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

  Values(
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

  Values.fromJson(Map<String, dynamic> json) {
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

class QrData {
  String? image;

  QrData({this.image});

  QrData.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    return data;
  }
}
