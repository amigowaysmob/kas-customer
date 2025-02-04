

import 'dart:developer';


import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/response_model/site_settings_model.dart';
import 'package:kasnew/utils/constants/sharedpreference_help.dart';


class ApiConstant{
  static String get siteUrl {
    final sharedPreferenceHelper = SharedPreferenceHelper();
    return sharedPreferenceHelper.getSiturl;
  }
static String get logoUrl {
    final sharedPreferenceHelper = SharedPreferenceHelper();
    return "${sharedPreferenceHelper.getLogo}";
  }
static String get homeLogoUrl {
    final sharedPreferenceHelper = SharedPreferenceHelper();
    return "${sharedPreferenceHelper.getHomeLogo}";
  }
  static String get langCode {
    final sharedPreferenceHelper = SharedPreferenceHelper();
    return sharedPreferenceHelper.getLanguageCode;
  }
  static String get userId{
    final prefs =SharedPreferenceHelper();
   return prefs.getUserId;
  }
  static String get photo{
    final prefs =SharedPreferenceHelper();
   return prefs.getPhoto;
  }
   static String get chitCount{
    final prefs =SharedPreferenceHelper();
   return prefs.getChitCount;
  }
  static String get delContent{
    final prefs =SharedPreferenceHelper();
   return prefs.getDelContent;
  }
  static String get delreq{
    final prefs =SharedPreferenceHelper();
   return prefs.getDelReq;
  }
  static String get homeIconKey{
    final prefs =SharedPreferenceHelper();
   return prefs.getHomeIconKey;
  }
   static String get limit{
    final prefs =SharedPreferenceHelper();
   return prefs.getLimit;
  }
  static LangModel? get language{
    final prefs =SharedPreferenceHelper();
   return prefs.getLanguage();
  }
  static SiteSettingsModel? get siteModel{
    final prefs =SharedPreferenceHelper();
   return prefs.getSite();
  }
  static String baseUrl = "https://www.kasjewellery.in/";
 static const String token="app-customer-generate-token";
 
 static const String userRegister= "app-customer-register";

static const String userRegisterMpin ='app-customer-login-create-mpin';
static const String userLogin='app-customer-login';
static const String userLoginMpin ='app-customer-login-mpin';

static const String userForgotMpin='app-customer-forgot-mpin';
static const String userResetMpin='app-customer-reset-mpin';
static const String userAboutUs='app-customer-about-us';

static const String userHome="app-customer-homepage";
  static const String siteSettings =  "app-customer-site-settings";

 static const String userRegisterConfirmOtp='app-customer-register-otp-confirm';
static const String userWp='app-my-customer-whatsapp-exists';
static const String userStepper='app-my-customer-form-data';
static const String userPincode='app-customer-get-location-pincode';
static const String userChangeMpin='app-customer-change-mpin';
static const String userViewProfile="app-customer-view-profile";
static const String userStepperForm="app-my-insert-customer-form-data";
static const String userTerms="app-customer-terms-conditions";
static const String userContact="app-customer-contact-us";
static const String userSubmitEnquiry="app-customer-submit-enquiry";
static const String userMonthPlans="app-customer-month-plans";
static const String userMobileCheck="app-my-customer-mobile-exists";
static const String userPayDues="app-customer-dues";
static const String userPayNow="app-customer-pay-dues";
static const String userTrans="app-customer-transactions";
static const String userSummary="app-customer-pay-dues-summary";
static const String userGift="app-my-customer-form-gift";
static const String userGiftDelivery="app-update-my-customer-form-gift";
static const String userReceipt="app-my-customer-form-receipt-link";
static const String userStoreDetail="app-customer-store-detail";
static const String userGallery="app-customer-images-gallery";
static const String userStores="app-customer-stores";
static const String userLedger="app-my-customer-ledger";
static const String userLedgerDetail="app-my-customer-ledger-detail";
static const String userTotalPayDue="app-customer-pay-dues-total";
static const String userPaymentStatus="app-customer-form-payment-status";
static const String userChitClose="app-customer-chit-closing-request";
static const String userGiftList="app-customer-gifts";
static const String userEPassBook="app-customer-e-passbooks";
static const String userPlanDetail="app-customer-plan-details";
static const String userInvite='app-invite-friends';
static const String userECat='app-my-customer-e-catalogue';
static const String userGroupCode='app-customer-plan-group-codes';
static const String userDuePaymentStatus="app-pay-dues-payment-status";
static const String userPlans="app-customer-plans";
static const String userLang="app-customer-language-content";
static const String userPlanTypes="app-customer-plan-type";
static const String userUpdateProfilePhoto="app-customer-update-profile-photo";
static const String userUpdateProfile="app-customer-update-profile";
static const String userMyPlans="app-customer-my-plans";
static const String userPlanGroupCode='app-customer-group-code-plans';
static const String userECatDetail='app-customer-product-detail';
static const String userRemoveProfile='app-customer-remove-profile-data';
static const String userFeedBack="app-my-customer-submit-feedback";
static const String userGetFeedBack="app-my-customer-get-feedback";
static const String userPayOthers="app-customer-search-pay-others";
static const String userLangList="app-customer-languages";
static const String userResendOtp="app-customer-resend-otp";
static const String userNotification='app-customer-notifications';
static const String userContactPerson="app-customer-my-contact-persons";
static const String userPayOthersOtp="app-customer-pay-others-otp";
static const String userDelete='app-customer-deactivate-account';
static const String userCatList='app-customer-product-category-group';
static const String userProductList='app-customer-products';
  }
  