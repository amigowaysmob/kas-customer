class ViewProfileModel {
  String? text;
  String? message;
  Data? data;

  ViewProfileModel({this.text, this.message, this.data});

  ViewProfileModel.fromJson(Map<String, dynamic> json) {
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
  UserData? userData;
  LangData? langData;

  Data({this.userData, this.langData});

  Data.fromJson(Map<String, dynamic> json) {
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
    langData = json['lang_data'] != null
        ? new LangData.fromJson(json['lang_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    if (this.langData != null) {
      data['lang_data'] = this.langData!.toJson();
    }
    return data;
  }
}

class UserData {
  String? id;
  String? userRole;
  String? customerId;
  String? memberType;
  String? loginUserType;
  String? fullName;
  String? guardianName;
  String? userName;
  String? lastName;
  String? aboutUs;
  String? group;
  String? email;
  String? password;
  String? mpinStatus;
  String? status;
  String? isVerified;
  String? created;
  String? modified;
  String? lastLoginDate;
  String? lastLogoutDate;
  String? lastLoginIp;
  String? thumbnail;
  String? address;
  String? locality;
  String? city;
  String? division;
  String? area;
  String? district;
  String? state;
  String? country;
  String? postalCode;
  String? landmark;
  String? phoneNumber;
  String? whatsappNumber;
  String? otp;
  String? verifyCode;
  String? phoneVerificationCode;
  String? birthday;
  String? about;
  String? age;
  String? gender;
  String? referralKey;
  String? referBy;
  String? aadharNumber;
  String? panNumber;
  String? photo;
  String? aadharCardFront;
  String? aadharCardBack;
  String? panCardFront;
  String? panCardBack;
  String? bankAcountHolderName;
  String? bankName;
  String? bankIfscCode;
  String? bankAccountNumber;
  String? bankUpiId;
  String? chequeNo;
  String? chequeLeaf;
  String? nomineeName;
  String? nomineeMobileNumber;
  String? nomineeEmail;
  String? nomineeGender;
  String? nomineeRelationship;
  String? nomineeAddress;
  String? nomineeLocality;
  String? nomineeCity;
  String? nomineeLandmark;
  String? nomineePhoto;
  String? nomineeAadharCardFront;
  String? nomineeAadharCardBack;
  String? nomineePanCardFront;
  String? nomineePanCardBack;
  String? nomineeBankAcountHolderName;
  String? nomineeBankName;
  String? nomineeBankIfscCode;
  String? nomineeBankAccountNumber;
  String? nomineeBankUpiId;
  String? fcmToken;
  String? passbookVerifyNo;
  String? approvalRequested;
  String? addedBy;
  String? department;
  String? showroom;
  String? allowedPaymentMode;
  String? originalCreated;
  String? employeeGroup;
  String? employeeGroupName;
  String? employeeGroupLocations;
  String? employeeGroupDistrict;
  String? passbookNumbers;
  String? source;
  String? vipstatus;
  String? homeCollection;
  String? nomineeAddress2;

  UserData(
      {this.id,
      this.userRole,
      this.customerId,
      this.memberType,
      this.loginUserType,
      this.fullName,
      this.guardianName,
      this.userName,
      this.lastName,
      this.aboutUs,
      this.group,
      this.email,
      this.password,
      this.mpinStatus,
      this.status,
      this.isVerified,
      this.created,
      this.modified,
      this.lastLoginDate,
      this.lastLogoutDate,
      this.lastLoginIp,
      this.thumbnail,
      this.address,
      this.locality,
      this.city,
      this.division,
      this.area,
      this.district,
      this.state,
      this.country,
      this.postalCode,
      this.landmark,
      this.phoneNumber,
      this.whatsappNumber,
      this.otp,
      this.verifyCode,
      this.phoneVerificationCode,
      this.birthday,
      this.about,
      this.age,
      this.gender,
      this.referralKey,
      this.referBy,
      this.aadharNumber,
      this.panNumber,
      this.photo,
      this.aadharCardFront,
      this.aadharCardBack,
      this.panCardFront,
      this.panCardBack,
      this.bankAcountHolderName,
      this.bankName,
      this.bankIfscCode,
      this.bankAccountNumber,
      this.bankUpiId,
      this.chequeNo,
      this.chequeLeaf,
      this.nomineeName,
      this.nomineeMobileNumber,
      this.nomineeEmail,
      this.nomineeGender,
      this.nomineeRelationship,
      this.nomineeAddress,
      this.nomineeLocality,
      this.nomineeCity,
      this.nomineeLandmark,
      this.nomineePhoto,
      this.nomineeAadharCardFront,
      this.nomineeAadharCardBack,
      this.nomineePanCardFront,
      this.nomineePanCardBack,
      this.nomineeBankAcountHolderName,
      this.nomineeBankName,
      this.nomineeBankIfscCode,
      this.nomineeBankAccountNumber,
      this.nomineeBankUpiId,
      this.fcmToken,
      this.passbookVerifyNo,
      this.approvalRequested,
      this.addedBy,
      this.department,
      this.showroom,
      this.allowedPaymentMode,
      this.originalCreated,
      this.employeeGroup,
      this.employeeGroupName,
      this.employeeGroupLocations,
      this.employeeGroupDistrict,
      this.passbookNumbers,
      this.source,
      this.vipstatus,
      this.homeCollection,
      this.nomineeAddress2});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userRole = json['user_role'];
    customerId = json['customer_id'];
    memberType = json['member_type'];
    loginUserType = json['loginUserType'];
    fullName = json['full_name'];
    guardianName = json['guardian_name'];
    userName = json['user_name'];
    lastName = json['last_name'];
    aboutUs = json['about_us'];
    group = json['group'];
    email = json['email'];
    password = json['password'];
    mpinStatus = json['mpin_status'];
    status = json['status'];
    isVerified = json['is_verified'];
    created = json['created'];
    modified = json['modified'];
    lastLoginDate = json['last_login_date'];
    lastLogoutDate = json['last_logout_date'];
    lastLoginIp = json['last_login_ip'];
    thumbnail = json['thumbnail'];
    address = json['address'];
    locality = json['locality'];
    city = json['city'];
    division = json['division'];
    area = json['area'];
    district = json['district'];
    state = json['state'];
    country = json['country'];
    postalCode = json['postal_code'];
    landmark = json['landmark'];
    phoneNumber = json['phone_number'];
    whatsappNumber = json['whatsapp_number'];
    otp = json['otp'];
    verifyCode = json['verify_code'];
    phoneVerificationCode = json['phone_verification_code'];
    birthday = json['birthday'];
    about = json['about'];
    age = json['age'];
    gender = json['gender'];
    referralKey = json['referral_key'];
    referBy = json['refer_by'];
    aadharNumber = json['aadhar_number'];
    panNumber = json['pan_number'];
    photo = json['photo'];
    aadharCardFront = json['aadhar_card_front'];
    aadharCardBack = json['aadhar_card_back'];
    panCardFront = json['pan_card_front'];
    panCardBack = json['pan_card_back'];
    bankAcountHolderName = json['bank_acount_holder_name'];
    bankName = json['bank_name'];
    bankIfscCode = json['bank_ifsc_code'];
    bankAccountNumber = json['bank_account_number'];
    bankUpiId = json['bank_upi_id'];
    chequeNo = json['cheque_no'];
    chequeLeaf = json['cheque_leaf'];
    nomineeName = json['nominee_name'];
    nomineeMobileNumber = json['nominee_mobile_number'];
    nomineeEmail = json['nominee_email'];
    nomineeGender = json['nominee_gender'];
    nomineeRelationship = json['nominee_relationship'];
    nomineeAddress = json['nominee_address'];
    nomineeLocality = json['nominee_locality'];
    nomineeCity = json['nominee_city'];
    nomineeLandmark = json['nominee_landmark'];
    nomineePhoto = json['nominee_photo'];
    nomineeAadharCardFront = json['nominee_aadhar_card_front'];
    nomineeAadharCardBack = json['nominee_aadhar_card_back'];
    nomineePanCardFront = json['nominee_pan_card_front'];
    nomineePanCardBack = json['nominee_pan_card_back'];
    nomineeBankAcountHolderName = json['nominee_bank_acount_holder_name'];
    nomineeBankName = json['nominee_bank_name'];
    nomineeBankIfscCode = json['nominee_bank_ifsc_code'];
    nomineeBankAccountNumber = json['nominee_bank_account_number'];
    nomineeBankUpiId = json['nominee_bank_upi_id'];
    fcmToken = json['fcm_token'];
    passbookVerifyNo = json['passbook_verify_no'];
    approvalRequested = json['approval_requested'];
    addedBy = json['added_by'];
    department = json['department'];
    showroom = json['showroom'];
    allowedPaymentMode = json['allowed_payment_mode'];
    originalCreated = json['original_created'];
    employeeGroup = json['employee_group'];
    employeeGroupName = json['employee_group_name'];
    employeeGroupLocations = json['employee_group_locations'];
    employeeGroupDistrict = json['employee_group_district'];
    passbookNumbers = json['passbook_numbers'];
    source = json['source'];
    vipstatus = json['vipstatus'];
    homeCollection = json['home_collection'];
    nomineeAddress2 = json['nominee_address2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_role'] = this.userRole;
    data['customer_id'] = this.customerId;
    data['member_type'] = this.memberType;
    data['loginUserType'] = this.loginUserType;
    data['full_name'] = this.fullName;
    data['guardian_name'] = this.guardianName;
    data['user_name'] = this.userName;
    data['last_name'] = this.lastName;
    data['about_us'] = this.aboutUs;
    data['group'] = this.group;
    data['email'] = this.email;
    data['password'] = this.password;
    data['mpin_status'] = this.mpinStatus;
    data['status'] = this.status;
    data['is_verified'] = this.isVerified;
    data['created'] = this.created;
    data['modified'] = this.modified;
    data['last_login_date'] = this.lastLoginDate;
    data['last_logout_date'] = this.lastLogoutDate;
    data['last_login_ip'] = this.lastLoginIp;
    data['thumbnail'] = this.thumbnail;
    data['address'] = this.address;
    data['locality'] = this.locality;
    data['city'] = this.city;
    data['division'] = this.division;
    data['area'] = this.area;
    data['district'] = this.district;
    data['state'] = this.state;
    data['country'] = this.country;
    data['postal_code'] = this.postalCode;
    data['landmark'] = this.landmark;
    data['phone_number'] = this.phoneNumber;
    data['whatsapp_number'] = this.whatsappNumber;
    data['otp'] = this.otp;
    data['verify_code'] = this.verifyCode;
    data['phone_verification_code'] = this.phoneVerificationCode;
    data['birthday'] = this.birthday;
    data['about'] = this.about;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['referral_key'] = this.referralKey;
    data['refer_by'] = this.referBy;
    data['aadhar_number'] = this.aadharNumber;
    data['pan_number'] = this.panNumber;
    data['photo'] = this.photo;
    data['aadhar_card_front'] = this.aadharCardFront;
    data['aadhar_card_back'] = this.aadharCardBack;
    data['pan_card_front'] = this.panCardFront;
    data['pan_card_back'] = this.panCardBack;
    data['bank_acount_holder_name'] = this.bankAcountHolderName;
    data['bank_name'] = this.bankName;
    data['bank_ifsc_code'] = this.bankIfscCode;
    data['bank_account_number'] = this.bankAccountNumber;
    data['bank_upi_id'] = this.bankUpiId;
    data['cheque_no'] = this.chequeNo;
    data['cheque_leaf'] = this.chequeLeaf;
    data['nominee_name'] = this.nomineeName;
    data['nominee_mobile_number'] = this.nomineeMobileNumber;
    data['nominee_email'] = this.nomineeEmail;
    data['nominee_gender'] = this.nomineeGender;
    data['nominee_relationship'] = this.nomineeRelationship;
    data['nominee_address'] = this.nomineeAddress;
    data['nominee_locality'] = this.nomineeLocality;
    data['nominee_city'] = this.nomineeCity;
    data['nominee_landmark'] = this.nomineeLandmark;
    data['nominee_photo'] = this.nomineePhoto;
    data['nominee_aadhar_card_front'] = this.nomineeAadharCardFront;
    data['nominee_aadhar_card_back'] = this.nomineeAadharCardBack;
    data['nominee_pan_card_front'] = this.nomineePanCardFront;
    data['nominee_pan_card_back'] = this.nomineePanCardBack;
    data['nominee_bank_acount_holder_name'] = this.nomineeBankAcountHolderName;
    data['nominee_bank_name'] = this.nomineeBankName;
    data['nominee_bank_ifsc_code'] = this.nomineeBankIfscCode;
    data['nominee_bank_account_number'] = this.nomineeBankAccountNumber;
    data['nominee_bank_upi_id'] = this.nomineeBankUpiId;
    data['fcm_token'] = this.fcmToken;
    data['passbook_verify_no'] = this.passbookVerifyNo;
    data['approval_requested'] = this.approvalRequested;
    data['added_by'] = this.addedBy;
    data['department'] = this.department;
    data['showroom'] = this.showroom;
    data['allowed_payment_mode'] = this.allowedPaymentMode;
    data['original_created'] = this.originalCreated;
    data['employee_group'] = this.employeeGroup;
    data['employee_group_name'] = this.employeeGroupName;
    data['employee_group_locations'] = this.employeeGroupLocations;
    data['employee_group_district'] = this.employeeGroupDistrict;
    data['passbook_numbers'] = this.passbookNumbers;
    data['source'] = this.source;
    data['vipstatus'] = this.vipstatus;
    data['home_collection'] = this.homeCollection;
    data['nominee_address2'] = this.nomineeAddress2;
    return data;
  }
}

class LangData {
  String? myProfile;
  String? personalDetails;
  String? fullName;
  String? guardianName;
  String? mobileNumber;
  String? whatsappNumber;
  String? email;
  String? status;
  String? address;
  String? phoneNumber;
  String? birthday;
  String? age;
  String? gender;
  String? aadharNumber;
  String? panNumber;
  String? bankAcountHolderName;
  String? bankName;
  String? bankIfscCode;
  String? bankAccountNumber;
  String? bankUpiId;
  String? nomineeName;
  String? nomineeMobileNumber;
  String? nomineeEmail;
  String? nomineeBankAcountHolderName;
  String? nomineeBankName;
  String? nomineeBankIfscCode;
  String? nomineeBankAccountNumber;
  String? nomineeBankUpiId;
  String? viewAccountLoginHere;
  String? idProof;
  String? nomineeDetails;
  String? nomineeGender;
  String? nomineeAddress;
  String? nomineeIdProof;
  String? edit;

  LangData(
      {this.myProfile,
      this.personalDetails,
      this.fullName,
      this.guardianName,
      this.mobileNumber,
      this.whatsappNumber,
      this.email,
      this.status,
      this.address,
      this.phoneNumber,
      this.birthday,
      this.age,
      this.gender,
      this.aadharNumber,
      this.panNumber,
      this.bankAcountHolderName,
      this.bankName,
      this.bankIfscCode,
      this.bankAccountNumber,
      this.bankUpiId,
      this.nomineeName,
      this.nomineeMobileNumber,
      this.nomineeEmail,
      this.nomineeBankAcountHolderName,
      this.nomineeBankName,
      this.nomineeBankIfscCode,
      this.nomineeBankAccountNumber,
      this.nomineeBankUpiId,
      this.viewAccountLoginHere,
      this.idProof,
      this.nomineeDetails,
      this.nomineeGender,
      this.nomineeAddress,
      this.nomineeIdProof,
      this.edit});

  LangData.fromJson(Map<String, dynamic> json) {
    myProfile = json['my_profile'];
    personalDetails = json['personal_details'];
    fullName = json['full_name'];
    guardianName = json['guardian_name'];
    mobileNumber = json['mobile_number'];
    whatsappNumber = json['whatsapp_number'];
    email = json['email'];
    status = json['status'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    birthday = json['birthday'];
    age = json['age'];
    gender = json['gender'];
    aadharNumber = json['aadhar_number'];
    panNumber = json['pan_number'];
    bankAcountHolderName = json['bank_acount_holder_name'];
    bankName = json['bank_name'];
    bankIfscCode = json['bank_ifsc_code'];
    bankAccountNumber = json['bank_account_number'];
    bankUpiId = json['bank_upi_id'];
    nomineeName = json['nominee_name'];
    nomineeMobileNumber = json['nominee_mobile_number'];
    nomineeEmail = json['nominee_email'];
    nomineeBankAcountHolderName = json['nominee_bank_acount_holder_name'];
    nomineeBankName = json['nominee_bank_name'];
    nomineeBankIfscCode = json['nominee_bank_ifsc_code'];
    nomineeBankAccountNumber = json['nominee_bank_account_number'];
    nomineeBankUpiId = json['nominee_bank_upi_id'];
    viewAccountLoginHere = json['view_account_login_here'];
    idProof = json['id_proof'];
    nomineeDetails = json['nominee_details'];
    nomineeGender = json['nominee_gender'];
    nomineeAddress = json['nominee_address'];
    nomineeIdProof = json['nominee_id_proof'];
    edit = json['edit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['my_profile'] = this.myProfile;
    data['personal_details'] = this.personalDetails;
    data['full_name'] = this.fullName;
    data['guardian_name'] = this.guardianName;
    data['mobile_number'] = this.mobileNumber;
    data['whatsapp_number'] = this.whatsappNumber;
    data['email'] = this.email;
    data['status'] = this.status;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['birthday'] = this.birthday;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['aadhar_number'] = this.aadharNumber;
    data['pan_number'] = this.panNumber;
    data['bank_acount_holder_name'] = this.bankAcountHolderName;
    data['bank_name'] = this.bankName;
    data['bank_ifsc_code'] = this.bankIfscCode;
    data['bank_account_number'] = this.bankAccountNumber;
    data['bank_upi_id'] = this.bankUpiId;
    data['nominee_name'] = this.nomineeName;
    data['nominee_mobile_number'] = this.nomineeMobileNumber;
    data['nominee_email'] = this.nomineeEmail;
    data['nominee_bank_acount_holder_name'] = this.nomineeBankAcountHolderName;
    data['nominee_bank_name'] = this.nomineeBankName;
    data['nominee_bank_ifsc_code'] = this.nomineeBankIfscCode;
    data['nominee_bank_account_number'] = this.nomineeBankAccountNumber;
    data['nominee_bank_upi_id'] = this.nomineeBankUpiId;
    data['view_account_login_here'] = this.viewAccountLoginHere;
    data['id_proof'] = this.idProof;
    data['nominee_details'] = this.nomineeDetails;
    data['nominee_gender'] = this.nomineeGender;
    data['nominee_address'] = this.nomineeAddress;
    data['nominee_id_proof'] = this.nomineeIdProof;
    data['edit'] = this.edit;
    return data;
  }
}
