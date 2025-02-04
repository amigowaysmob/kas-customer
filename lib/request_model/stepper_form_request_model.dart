import 'package:dio/dio.dart';
import 'dart:io';
import 'package:path/path.dart';

class StepperFormRequestModel {
  String? userid;
  String? fullName;
  String? guardianName;
  String? phoneNumber;
  String? whatsappNumber;
  String? email;
  String? gender;
  String? state;
  String? birthday;
  String? address;
  String? area;
  String? city;
  String? landmark;
  String? home_collection;
 File? photo;
String? passbook_name;
  File? aadharCardFront;
  File? aadharCardBack;
  File? panCardFront;
  File? panCardBack;
  String? nomineeName;
  String? nomineeMobileNumber;
  String? nomineeRelationship;
  String? nomineeGender;
  String? nomineeAddress;
  String? nomineeAddress2;
  String? nomineeCity;
  String? nomineeLandmark;
  File? nomineePhoto;
  File? nomineeAadharCardFront;
  File? nomineeAadharCardBack;
  File? nomineePanCardFront;
  File? nomineePanCardBack;
  String? plan;
  int? dueCount;
  String? paymentMode;
  File? paymentScreenshot;
  String? paymentTransactionId;
  String? Pincode;
  String? district;
  String? planName;
  String? duration;
  String? dailyDue;
  String? customerIdType;
  String? nomineeIdType;
  String? plan_type;
  String? due_count_limit;
String? payable_amount;
String? circle;
String? customer_fields;
String? nominee_fields;
String? customer_kyc;
String? nominee_bank_name;
String? nominee_bank_upi_id;
String? nominee_bank_account_number;
String? nominee_bank_ifsc_code;
  StepperFormRequestModel({
    this.userid,
    this.fullName,
    this.guardianName,
    this.phoneNumber,
    this.whatsappNumber,
    this.email,
    this.gender,
    this.state,
    this.birthday,
    this.address,
    this.area,
    this.city,
    this.home_collection,
    this.landmark,
    this.photo,
    this.aadharCardFront,
    this.aadharCardBack,
    this.panCardFront,
    this.panCardBack,
    this.nomineeName,
    this.nomineeMobileNumber,
    this.nomineeRelationship,
    this.nomineeGender,
    this.nomineeAddress,
    this.nomineeAddress2,
    this.nomineeCity,
    this.nomineeLandmark,
    this.nomineePhoto,
    this.nomineeAadharCardFront,
    this.nomineeAadharCardBack,
    this.nomineePanCardFront,
    this.nomineePanCardBack,
    this.plan,
    this.dueCount,
    this.paymentMode,
    this.paymentScreenshot,
    this.paymentTransactionId,
    this.Pincode,
    this.district,
    this.planName,
    this.dailyDue,
    this.duration,
    this.customerIdType,
    this.nomineeIdType,
    this.plan_type,
    this.due_count_limit,
    this.payable_amount,
    this.circle,
    this.passbook_name,
    this.customer_fields,
    this.customer_kyc,
    this.nominee_fields,
    this.nominee_bank_name,
    this.nominee_bank_upi_id,
    this.nominee_bank_account_number,
    this.nominee_bank_ifsc_code
  });

  factory StepperFormRequestModel.fromJson(Map<String, dynamic> json) {
    return StepperFormRequestModel(
      userid: json['user_id'],
      fullName: json['full_name'],
      guardianName: json['guardian_name'],
      phoneNumber: json['phone_number'],
      whatsappNumber: json['whatsapp_number'],
      email: json['email'],
      gender: json['gender'],
      state: json['state'],
      birthday: json['birthday'],
      address: json['address'],
      area: json['area'],
      city: json['city'],
      landmark: json['landmark'],
      photo: json['photo'],
      aadharCardFront: json['aadhar_card_front'],
      aadharCardBack: json['aadhar_card_back'],
      panCardFront: json['pan_card_front'],
      panCardBack: json['pan_card_back'],
      nomineeName: json['nominee_name'],
      nomineeMobileNumber: json['nominee_mobile_number'],
      nomineeRelationship: json['nominee_relationship'],
      nomineeGender: json['nominee_gender'],
      nomineeAddress: json['nominee_address'],
      nomineeAddress2: json['nominee_address2'],
      nomineeCity: json['nominee_city'],
      nomineeLandmark: json['nominee_landmark'],
      nomineePhoto: json['nominee_photo'],
      nomineeAadharCardFront: json['nominee_aadhar_card_front'],
      nomineeAadharCardBack: json['nominee_aadhar_card_back'],
      nomineePanCardFront: json['nominee_pan_card_front'],
      nomineePanCardBack: json['nominee_pan_card_back'],
      plan: json['plan'],
      dueCount: json['due_count'],
      paymentMode: json['payment_mode'],
      paymentScreenshot: json['payment_screenshot'],
      paymentTransactionId: json['payment_transaction_id'],
      Pincode: json['postal_code'],
      district:json['district'],
      planName: json['plan_name'],
      duration: json['duration'],
      dailyDue: json['daily_due'],
      customerIdType: json['customer_id_type'],
      nomineeIdType: json['nominee_id_type'],
      plan_type:json['plan_type'],
      due_count_limit:json['due_count_limit'],
      payable_amount:json['payable_amount'],
      circle:json['circle'],
      home_collection:json['home_collection'],
      passbook_name:json['passbook_name'],
      nominee_fields: json['nominee_fields'],
      customer_kyc: json['customer_kyc'],
      customer_fields: json['customer_fields'],
      nominee_bank_name:json['nominee_bank_name'],
      nominee_bank_upi_id:json['nominee_bank_upi_id'],
      nominee_bank_account_number:json['nominee_bank_account_number'],
      nominee_bank_ifsc_code:json['nominee_bank_ifsc_code']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id':userid,
      'full_name': fullName,
      'guardian_name': guardianName,
      'phone_number': phoneNumber,
      'whatsapp_number': whatsappNumber,
      'email': email,
      'gender': gender,
      'state': state,
      'birthday': birthday,
      'address': address,
      'area': area,
      'city': city,
      'landmark': landmark,
      'photo': photo,
      'aadhar_card_front': aadharCardFront,
      'aadhar_card_back': aadharCardBack,
      'pan_card_front': panCardFront,
      'pan_card_back': panCardBack,
      'nominee_name': nomineeName,
      'nominee_mobile_number': nomineeMobileNumber,
      'nominee_relationship': nomineeRelationship,
      'nominee_gender': nomineeGender,
      'nominee_address': nomineeAddress,
      'nominee_address2': nomineeAddress2,
      'nominee_city': nomineeCity,
      'nominee_landmark': nomineeLandmark,
      'nominee_photo': nomineePhoto,
      'nominee_aadhar_card_front': nomineeAadharCardFront,
      'nominee_aadhar_card_back': nomineeAadharCardBack,
      'nominee_pan_card_front': nomineePanCardFront,
      'nominee_pan_card_back': nomineePanCardBack,
      'plan': plan,
      'due_count': dueCount,
      'payment_mode': paymentMode,
      'payment_screenshot': paymentScreenshot,
      'payment_transaction_id': paymentTransactionId,
      'postal_code': Pincode,
      'district':district,
      'plan_name':planName,
      'duration':duration,
      'daily_due':dailyDue,
      'customer_id_type':customerIdType,
      'nominee_id_type':nomineeIdType,
      'plan_type':plan_type,
      'due_count_limit':due_count_limit,
      'payable_amount':payable_amount,
      'circle':circle,
      'home_collection':home_collection,
      'passbook_name':passbook_name,
      'nominee_fields':nominee_fields,
'customer_kyc':customer_kyc,
'customer_fields':customer_fields,
'nominee_bank_name':nominee_bank_name,
'nominee_bank_upi_id':nominee_bank_upi_id,
'nominee_bank_account_number':nominee_bank_account_number,
'nominee_bank_ifsc_code':nominee_bank_ifsc_code
    };
  }

  // Convert the model to FormData
  Future<FormData> toFormData() async {
    final formData = FormData();
 if (userid != null) formData.fields.add(MapEntry('user_id', userid!));
  if (passbook_name != null) formData.fields.add(MapEntry('passbook_name', passbook_name!));
    if (fullName != null) formData.fields.add(MapEntry('full_name', fullName!));
    if (guardianName != null) formData.fields.add(MapEntry('guardian_name', guardianName!));
    if (phoneNumber != null) formData.fields.add(MapEntry('phone_number', phoneNumber!));
    if (whatsappNumber != null) formData.fields.add(MapEntry('whatsapp_number', whatsappNumber!));
    if (email != null) formData.fields.add(MapEntry('email', email!));
    if (gender != null) formData.fields.add(MapEntry('gender', gender!));
    if (state != null) formData.fields.add(MapEntry('state', state!));
    if (birthday != null) formData.fields.add(MapEntry('birthday', birthday!));
    if (address != null) formData.fields.add(MapEntry('address', address!));
    if (area != null) formData.fields.add(MapEntry('area', area!));
    if (city != null) formData.fields.add(MapEntry('city', city!));
    if (landmark != null) formData.fields.add(MapEntry('landmark', landmark!));
    if (home_collection != null) formData.fields.add(MapEntry('home_collection', home_collection!));
    if (photo != null) {
      formData.files.add(MapEntry(
        'photo',
        await MultipartFile.fromFile(photo!.path, filename: basename(photo!.path)),
      ));
    }
     if (aadharCardFront!= null) {
      formData.files.add(MapEntry(
        'aadhar_card_front',
        await MultipartFile.fromFile(aadharCardFront!.path, filename: basename(aadharCardFront!.path)),
      ));
    }
    if (aadharCardBack!= null) {
      formData.files.add(MapEntry(
        'aadhar_card_back',
        await MultipartFile.fromFile(aadharCardBack!.path, filename: basename(aadharCardBack!.path)),
      ));
    }
     if (panCardFront!= null) {
      formData.files.add(MapEntry(
        'pan_card_front',
        await MultipartFile.fromFile(panCardFront!.path, filename: basename(panCardFront!.path)),
      ));
    }
     if (panCardBack!= null) {
      formData.files.add(MapEntry(
        'pan_card_back',
        await MultipartFile.fromFile(panCardBack!.path, filename: basename(panCardBack!.path)),
      ));
    }
    if (nominee_bank_name!= null) formData.fields.add(MapEntry('nominee_bank_name', nominee_bank_name!));
    if (nomineeName != null) formData.fields.add(MapEntry('nominee_name', nomineeName!));
    if (nomineeMobileNumber != null) formData.fields.add(MapEntry('nominee_mobile_number', nomineeMobileNumber!));
    if (nomineeRelationship != null) formData.fields.add(MapEntry('nominee_relationship', nomineeRelationship!));
    if (nomineeGender != null) formData.fields.add(MapEntry('nominee_gender', nomineeGender!));
    if (nomineeAddress != null) formData.fields.add(MapEntry('nominee_address', nomineeAddress!));
    if (nomineeAddress2 != null) formData.fields.add(MapEntry('nominee_address2', nomineeAddress2!));
    if (nomineeCity != null) formData.fields.add(MapEntry('nominee_city', nomineeCity!));
    if (nomineeLandmark != null) formData.fields.add(MapEntry('nominee_landmark', nomineeLandmark!));
    if (nomineePhoto!= null) {
      formData.files.add(MapEntry(
        'nominee_photo',
        await MultipartFile.fromFile(nomineePhoto!.path, filename: basename(nomineePhoto!.path)),
      ));
    }
     if (nomineeAadharCardFront!= null) {
      formData.files.add(MapEntry(
        ',nominee_aadhar_card_front',
        await MultipartFile.fromFile(nomineeAadharCardFront!.path, filename: basename(nomineeAadharCardFront!.path)),
      ));
    }
      if (nomineeAadharCardBack!= null) {
      formData.files.add(MapEntry(
        'nominee_aadhar_card_back',
        await MultipartFile.fromFile(nomineeAadharCardBack!.path, filename: basename(nomineeAadharCardBack!.path)),
      ));
    }
      if (nomineePanCardFront!= null) {
      formData.files.add(MapEntry(
        'nominee_pan_card_front',
        await MultipartFile.fromFile(nomineePanCardFront!.path, filename: basename(nomineePanCardFront!.path)),
      ));
    }
      if (nomineePanCardBack!= null) {
      formData.files.add(MapEntry(
        'nominee_pan_card_back',
        await MultipartFile.fromFile(nomineePanCardBack!.path, filename: basename(nomineePanCardBack!.path)),
      ));
    }
    if (plan != null) formData.fields.add(MapEntry('plan', plan!));
    if (dueCount != null) formData.fields.add(MapEntry('due_count', dueCount.toString()));
    if (paymentMode != null) formData.fields.add(MapEntry('payment_mode', paymentMode!));
  if (paymentScreenshot!= null) {
      formData.files.add(MapEntry(
        'payment_screenshot',
        await MultipartFile.fromFile(paymentScreenshot!.path, filename: basename(paymentScreenshot!.path)),
      ));
    }
    if (paymentTransactionId != null) formData.fields.add(MapEntry('payment_transaction_id', paymentTransactionId!));
    if (Pincode != null) formData.fields.add(MapEntry('postal_code', Pincode!));
 if (district != null) formData.fields.add(MapEntry('district', district!));
 if (planName != null) formData.fields.add(MapEntry('plan_name', planName!));
 if (duration != null) formData.fields.add(MapEntry('duration', duration!));
 if (dailyDue != null) formData.fields.add(MapEntry('daily_due', dailyDue!));
if (customerIdType != null) formData.fields.add(MapEntry('customer_id_type', customerIdType!));
 if (nomineeIdType != null) formData.fields.add(MapEntry('nominee_id_type', nomineeIdType!));
  if (plan_type != null) formData.fields.add(MapEntry('plan_type', plan_type!));
   if (due_count_limit != null) formData.fields.add(MapEntry('due_count_limit', due_count_limit!));
   if (payable_amount!= null) formData.fields.add(MapEntry('payable_amount', payable_amount!));
    if (circle!= null) formData.fields.add(MapEntry('circle', circle!));
    if(nominee_fields!=null)formData.fields.add(MapEntry('nominee_fields', nominee_fields!)); 
     if(customer_kyc!=null)formData.fields.add(MapEntry('customer_kyc', customer_kyc!)); 
     if(customer_fields!=null)formData.fields.add(MapEntry('customer_fields', customer_fields!));
      if(nominee_bank_upi_id!=null)formData.fields.add(MapEntry('nominee_bank_upi_id', nominee_bank_upi_id!)); 
       if(nominee_bank_account_number!=null)formData.fields.add(MapEntry('nominee_bank_account_number', nominee_bank_account_number!)); 
        if(nominee_bank_ifsc_code!=null)formData.fields.add(MapEntry('nominee_bank_ifsc_code', nominee_bank_ifsc_code!));   
    return formData;
  }
}
