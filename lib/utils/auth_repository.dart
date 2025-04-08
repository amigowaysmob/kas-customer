import 'package:dio/dio.dart';
import 'package:kasnew/request_model/about_us_request_model.dart';
import 'package:kasnew/request_model/change_mpin_request_model.dart';
import 'package:kasnew/request_model/chit_close_request%20mode.dart';
import 'package:kasnew/request_model/con_register_request_model.dart';
import 'package:kasnew/request_model/due_payment_status_request_model.dart';
import 'package:kasnew/request_model/feedback_request_model.dart';
import 'package:kasnew/request_model/gift_delivery_request_model.dart';
import 'package:kasnew/request_model/gift_list_request_model.dart';
import 'package:kasnew/request_model/gift_request_model.dart';
import 'package:kasnew/request_model/group_code_request_model.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/request_model/ledger_detail_request_model.dart';
import 'package:kasnew/request_model/login_mpin_request_model.dart';
import 'package:kasnew/request_model/login_request_model.dart';
import 'package:kasnew/request_model/lucky_draw_request_mode.dart';
import 'package:kasnew/request_model/mobile_chek_request_model.dart';
import 'package:kasnew/request_model/pay_due_request_model.dart';
import 'package:kasnew/request_model/pay_now_request_model.dart';
import 'package:kasnew/request_model/pay_others_otp_request_model.dart';
import 'package:kasnew/request_model/pay_others_request_model.dart';
import 'package:kasnew/request_model/payment_status_request_model.dart';

import 'package:kasnew/request_model/pin_code_request_model.dart';
import 'package:kasnew/request_model/plan_detail_request_model.dart';
import 'package:kasnew/request_model/product_list_request_model.dart';
import 'package:kasnew/request_model/register_mpin_request_model.dart';
import 'package:kasnew/request_model/register_request_model.dart';
import 'package:kasnew/request_model/remove_profile_request_model.dart';
import 'package:kasnew/request_model/resend_otp_request_model.dart';
import 'package:kasnew/request_model/stepper_form_request_model.dart';
import 'package:kasnew/request_model/store_detail_request_model.dart';
import 'package:kasnew/request_model/submit_enquiry_request_model.dart';
import 'package:kasnew/request_model/trans_request_model.dart';
import 'package:kasnew/request_model/update_profile_photo_request_model.dart';
import 'package:kasnew/request_model/user_id_request_model.dart';
import 'package:kasnew/request_model/winners_request_model.dart';
import 'package:kasnew/response_model/about_us_model.dart';
import 'package:kasnew/response_model/cat_list_model.dart';
import 'package:kasnew/response_model/change_mpin_model.dart';
import 'package:kasnew/response_model/chit_close_model.dart';
import 'package:kasnew/response_model/con_register_model.dart';
import 'package:kasnew/response_model/contact_model.dart';
import 'package:kasnew/response_model/delete_model.dart';
import 'package:kasnew/response_model/e-passbook_model.dart';
import 'package:kasnew/response_model/e_cat_detail_model.dart';
import 'package:kasnew/response_model/e_cat_detail_request_model.dart';
import 'package:kasnew/response_model/e_cat_model.dart';
import 'package:kasnew/response_model/feed_back_model.dart';
import 'package:kasnew/response_model/forgot_mpin_model.dart';
import 'package:kasnew/response_model/gallery_model.dart';
import 'package:kasnew/response_model/get_feedback_model.dart';
import 'package:kasnew/response_model/gift_delivery_model.dart';
import 'package:kasnew/response_model/gift_list_model.dart';
import 'package:kasnew/response_model/gift_model.dart';
import 'package:kasnew/response_model/group_code_model.dart';
import 'package:kasnew/response_model/home_model.dart';
import 'package:kasnew/response_model/invite_model.dart';
import 'package:kasnew/response_model/lang_list_model.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/response_model/ledger_detail_model.dart';
import 'package:kasnew/response_model/ledger_model.dart';
import 'package:kasnew/response_model/login_model.dart';
import 'package:kasnew/response_model/login_mpin_model.dart';
import 'package:kasnew/response_model/lucky_draw_model.dart';
import 'package:kasnew/response_model/lucky_months_model.dart';
import 'package:kasnew/response_model/lucky_terms_model.dart';
import 'package:kasnew/response_model/mobile_check_model.dart';
import 'package:kasnew/response_model/month_plans_model.dart';
import 'package:kasnew/response_model/my_plans_model.dart';
import 'package:kasnew/response_model/notification_model.dart';
import 'package:kasnew/response_model/pay_due_payment_status.dart';
import 'package:kasnew/response_model/pay_dues_model.dart';
import 'package:kasnew/response_model/pay_now_model.dart';
import 'package:kasnew/response_model/pay_others_otp_model.dart';
import 'package:kasnew/response_model/pay_othres_model.dart';
import 'package:kasnew/response_model/payment_status_model.dart';
import 'package:kasnew/response_model/pin_code_model.dart';
import 'package:kasnew/response_model/plan_detail_model.dart';
import 'package:kasnew/response_model/plan_group_code_model.dart';
import 'package:kasnew/response_model/plan_request_model.dart';
import 'package:kasnew/response_model/plan_types_model.dart';
import 'package:kasnew/response_model/plans_model.dart';
import 'package:kasnew/response_model/product_list_list_model.dart';
import 'package:kasnew/response_model/receipt_model.dart';
import 'package:kasnew/response_model/register_model.dart';
import 'package:kasnew/response_model/register_mpin_model.dart';
import 'package:kasnew/response_model/resend_otp_model.dart';
import 'package:kasnew/response_model/reset_mpin_model.dart';
import 'package:kasnew/response_model/site_settings_model.dart';
import 'package:kasnew/response_model/stepper_form_model.dart';
import 'package:kasnew/response_model/stepper_model.dart';
import 'package:kasnew/response_model/store_detail_model.dart';
import 'package:kasnew/response_model/stores_model.dart';
import 'package:kasnew/response_model/submit_enquiry_model.dart';
import 'package:kasnew/response_model/summary_model.dart';
import 'package:kasnew/response_model/token_model.dart';
import 'package:kasnew/response_model/total_pay_due_model.dart';
import 'package:kasnew/response_model/trans_model.dart';
import 'package:kasnew/response_model/update_profile_model.dart';
import 'package:kasnew/response_model/update_profile_photo_model.dart';
import 'package:kasnew/response_model/view_profile_model.dart';
import 'package:kasnew/response_model/winners_model.dart';
import 'package:kasnew/screens/bottom_screens/homescreen/contact_person_model.dart';
import 'package:kasnew/utils/apiservice/api_service.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/constants/sharedpreference_help.dart';

class AuthRepository {
  final Dio _dio = Dio();
final ApiService apiService;
 SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();
  AuthRepository(this.apiService);
  Future<dynamic> generateToken()async{
 try {
    final Map<String, dynamic> _JSON_HEADERS = {
        'Content-Type': 'application/json',
  'Authorization': 'Basic YW1pZ293YXlzOkFtaWdvd2F5c0AxMjNUT0tFTg=='
    };
      var response = await apiService.post(ApiConstant.token,{},headers: _JSON_HEADERS);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        sharedPreferenceHelper.saveToken(TokenModel.fromJson(responseData).data.toString());
        var token=sharedPreferenceHelper.getToken;

        return (true,TokenModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
       
        return (false, TokenModel());
      }
    } catch (e,stacktrace) {
     
      return (false, TokenModel());
    }
    }
  Future<dynamic> userSiteSettings()async{
 try {
 
      var response = await apiService.post(ApiConstant.siteSettings,{});
       if (response.statusCode == 200 ) {
        var responseData = response.data;
           SiteSettingsModel languageModel = SiteSettingsModel.fromJson(responseData);
      
      // Save the LanguageModel to shared preferences
      await sharedPreferenceHelper.saveSite(languageModel);
        return (true,languageModel);
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, SiteSettingsModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, SiteSettingsModel());
    }
    } 
     Future<dynamic> userLogin(LoginRequestModel loginRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userLogin,loginRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        return (true,LoginModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, LoginModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, LoginModel());
    }
    } 
     Future<dynamic> userForgotMpin(UserIdRequestModel UserIdRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userForgotMpin,UserIdRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        return (true,ForgotMpinModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, ForgotMpinModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, ForgotMpinModel());
    }
    } 
     Future<dynamic> userLoginMpin(LoginMpinRequestModel loginMpinRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userLoginMpin,loginMpinRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        return (true,LoginMpinModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, LoginMpinModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, LoginMpinModel());
    }
    } 
     Future<dynamic> userRegister(RegisterRequestModel registerRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userRegister,registerRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        return (true,RegisterModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, RegisterModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, RegisterModel());
    }
    }
      Future<dynamic> userRegisterMpin(RegisterMpinRequestModel registerMpinRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userRegisterMpin,registerMpinRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        return (true,RegisterMpinModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, RegisterMpinModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, RegisterMpinModel());
    }
    } 
     Future<dynamic> userRegisterConfirm(ConRegisterRequestModel registerRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userRegisterConfirmOtp,registerRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        
        return (true,ConRegisterModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, ConRegisterModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, ConRegisterModel());
    }
    }
     Future<dynamic> userResetMpin(RegisterMpinRequestModel resetMpinRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userResetMpin,resetMpinRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        return (true,ResetMpinModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, ResetMpinModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, ResetMpinModel());
    }
    } 
    Future<dynamic> userChangeMpin(ChangeMpinRequestModel requestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userChangeMpin,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,ChangeMpinModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, ChangeMpinModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, ChangeMpinModel());
    }
    } 
    Future<dynamic> userAboutUs(AboutUsRequestModel termsPrivacyRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userAboutUs,termsPrivacyRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        return (true,AboutUsModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, AboutUsModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, AboutUsModel());
    }
    }
     Future<dynamic> userHome(HomeRequestModel homeRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userHome,homeRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,HomeModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, HomeModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, HomeModel());
    }
    } 
     Future<dynamic> userStepper(HomeRequestModel homeRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userStepper,homeRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        return (true,StepperModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, StepperModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, StepperModel());
    }
    } 
     Future<dynamic> userViewProfile(HomeRequestModel homeRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userViewProfile,homeRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        return (true,ViewProfileModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false,ViewProfileModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, ViewProfileModel());
    }
    } 
      Future<dynamic> userStepperForm(StepperFormRequestModel stepperFormRequestModel)async{
 try {
 final formData=await stepperFormRequestModel.toFormData();
      var response = await apiService.post(ApiConstant.userStepperForm,formData,isFormData: true);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        return (true,StepperFormModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, StepperFormModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, StepperFormModel());
    }
    }    
    Future<dynamic> userTerms(AboutUsRequestModel termsPrivacyRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userTerms,termsPrivacyRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        return (true,AboutUsModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, AboutUsModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, AboutUsModel());
    }
    } 
     Future<dynamic> userPrivacy(AboutUsRequestModel termsPrivacyRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userTerms,termsPrivacyRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        return (true,AboutUsModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, AboutUsModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, AboutUsModel());
    }
    }
    Future<dynamic> userContact(HomeRequestModel homeRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userContact,homeRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,ContactModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, ContactModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, ContactModel());
    }
    } 
     Future<dynamic> userSubmitEnquiry(SubmitEnquiryRequestModel submitEnquiryRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userSubmitEnquiry,submitEnquiryRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,SubmitEnquiryModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, SubmitEnquiryModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, SubmitEnquiryModel());
    }
    } 
      Future<dynamic> userPincode(PincodeRequestModel requestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userPincode,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,PincodeModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, PincodeModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, PincodeModel());
    }
    }  
     Future<dynamic> userMonthPlans(HomeRequestModel requestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userMonthPlans,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,MonthPlansModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, MonthPlansModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, MonthPlansModel());
    }
    } 
    Future<dynamic> userWp(MobileCheckRequestModel requestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userWp,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,MobileCheckModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, MobileCheckModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, MobileCheckModel());
    }
    }  
     Future<dynamic> userMobileCheck(MobileCheckRequestModel requestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userMobileCheck,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,MobileCheckModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, MobileCheckModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, MobileCheckModel());
    }
    }  
     Future<dynamic> userPayDues(PayDueRequestModel requestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userPayDues,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,PayDuesModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false,PayDuesModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, PayDuesModel());
    }
    }      
    Future<dynamic> userPayNow(PayNowRequestModel requestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userPayNow,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,PayNowModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false,PayNowModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, PayNowModel());
    }
    } 
     Future<dynamic> userTrans(TransRequestModel requestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userTrans,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,TransModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, TransModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, TransModel());
    }
    }  
    Future<dynamic> userSummary(PayNowRequestModel requestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userSummary,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,SummaryModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, SummaryModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, SummaryModel());
    }
    }   
       Future<dynamic> userGift(GiftRequestModel requestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userGift,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,GiftModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, GiftModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, GiftModel());
    }
    } 
     Future<dynamic> userReceipt(GiftRequestModel requestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userReceipt,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,ReceiptModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, ReceiptModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, ReceiptModel());
    }
    } 
     Future<dynamic> userGallery(HomeRequestModel homeRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userGallery,homeRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,GalleryModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, GalleryModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, GalleryModel());
    }
    }        
     Future<dynamic> userStores(UserIdRequestModel homeRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userStores,homeRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,StoresModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, StoresModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, StoresModel());
    }
    }  
     Future<dynamic> userStoreDetail(StoreDetailRequestModel homeRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userStoreDetail,homeRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,StoreDetailModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, StoreDetailModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, StoreDetailModel());
    }
    
    }
      Future<dynamic> userGiftDelivery(GiftDeliveryRequestModel requestModel)async{
 try {

      var response = await apiService.post(ApiConstant.userGiftDelivery,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        return (true,GiftDeliveryModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, GiftDeliveryModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, GiftDeliveryModel());
    }
    } 
      Future<dynamic> userLedger(HomeRequestModel homeRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userLedger,homeRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,LedgerModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, LedgerModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, LedgerModel());
    }
    }        
    Future<dynamic> userLedgerDetail(LedgerDetailRequestModel homeRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userLedgerDetail,homeRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,LedgerDetailModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, LedgerDetailModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, LedgerDetailModel());
    }
    } 
     Future<dynamic> userTotalPayDue(PayNowRequestModel requestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userTotalPayDue,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,TotalPayDueModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false,TotalPayDueModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, TotalPayDueModel());
    }
    } 
     Future<dynamic> userPaymentStatus(PaymentStatusRequestModel homeRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userPaymentStatus,homeRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,PaymentStatusModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, PaymentStatusModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, PaymentStatusModel());
    }
    }      
     Future<dynamic> userDuePaymentStatus(DuePaymentStatusRequestModel homeRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userDuePaymentStatus,homeRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,DuePaymentStatusModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, DuePaymentStatusModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, DuePaymentStatusModel());
    }
    }      
    Future<dynamic> userChitClose(ChitCloseRequestModel homeRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userChitClose,homeRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,ChitCloseModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, ChitCloseModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, ChitCloseModel());
    }
    }           
     Future<dynamic> userGiftList(GiftListRequestModel homeRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userGiftList,homeRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,GiftListModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, GiftListModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, GiftListModel());
    }
    }   
     Future<dynamic> userEPassBook(HomeRequestModel homeRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userEPassBook,homeRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,EPassBookModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, EPassBookModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, EPassBookModel());
    }
    }
      Future<dynamic> userPlanDetail(PlanDetailRequestModel requestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userPlanDetail,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,PlanDetailModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, PlanDetailModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, PlanDetailModel());
    }
    } 
     Future<dynamic> userInvite(HomeRequestModel requestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userInvite,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,InviteModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, InviteModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, InviteModel());
    }
    }  
      Future<dynamic> userGroupCode(GroupCodeRequestModel requestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userGroupCode,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,GroupCodeModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, GroupCodeModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, GroupCodeModel());
    }
    }  
     Future<dynamic> userPlans(PlansRequestModel homeRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userPlans,homeRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,PlansModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, PlansModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, PlansModel());
    }
    }
    Future<dynamic> userPlanTypes(HomeRequestModel homeRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userPlanTypes,homeRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,PlanTypesModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, PlanTypesModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, PlanTypesModel());
    }
    } 
      Future<dynamic> userUpdateProfilePhoto(UpdateProfilePhotoRequestModel requestModel)async{
 try {
 final formData=await requestModel.toFormData();
      var response = await apiService.post(ApiConstant.userUpdateProfilePhoto,formData,isFormData: true);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        return (true,UpdateProfilePhotoModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, UpdateProfilePhotoModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, UpdateProfilePhotoModel());
    }
    } 
     Future<dynamic> userUpdateProfile(StepperFormRequestModel stepperFormRequestModel)async{
 try {
 final formData=await stepperFormRequestModel.toFormData();
      var response = await apiService.post(ApiConstant.userUpdateProfile,formData,isFormData: true);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        return (true,UpdateProfileModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, UpdateProfileModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, UpdateProfileModel());
    }
    }               
    Future<dynamic> userMyPlans(HomeRequestModel homeRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userMyPlans,homeRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,MyPlansModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, MyPlansModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, MyPlansModel());
    }
    }   
    Future<dynamic> userPlanGroupCode(GiftListRequestModel requestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userPlanGroupCode,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,PlanGroupCodeModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, PlanGroupCodeModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, PlanGroupCodeModel());
    }
    } 
     Future<dynamic> userECat(HomeRequestModel homeRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userECat,homeRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,ECatModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, ECatModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, ECatModel());
    }
    }    
    Future<dynamic> userECatDetail(ECatDetailRequestModel homeRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userECatDetail,homeRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,ECatDetailModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, ECatDetailModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, ECatDetailModel());
    }
    }      
     Future<dynamic> userRemoveProfile(RemoveProfileRequestModel homeRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userRemoveProfile,homeRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,ECatDetailModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, ECatDetailModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, ECatDetailModel());
    }
    } 
    Future<dynamic> userFeedBack(FeedBackRequestModel homeRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userFeedBack,homeRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,FeedBackModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, FeedBackModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, FeedBackModel());
    }
    }      
    Future<dynamic> userGetFeedBack(HomeRequestModel homeRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userGetFeedBack,homeRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,GetFeedBackModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, GetFeedBackModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, GetFeedBackModel());
    }
    } 
     Future<dynamic> userPayOthers(PayOthersRequestModel requestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userPayOthers,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,PayOthersModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false,PayOthersModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, PayOthersModel());
    }
    }  
   Future<dynamic> userLang(HomeRequestModel requestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userLang,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        LangModel languageModel = LangModel.fromJson(responseData);
      
      // Save the LanguageModel to shared preferences
      await sharedPreferenceHelper.saveLang(languageModel);
        return (true,languageModel);
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, LangModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, LangModel());
    }
    }      
    Future<dynamic> userLangList(UserIdRequestModel requestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userLangList,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,LangListModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false,LangListModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, LangListModel());
    }
    } 
     Future<dynamic> userResendOtp(ResendOtpRequestModel homeRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userResendOtp,homeRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,ResendOtpModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, ResendOtpModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, ResendOtpModel());
    }
    } 
       Future<dynamic> userNotification(HomeRequestModel homeRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userNotification,homeRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,NotificationModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, NotificationModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, NotificationModel());
    }
    } 
    Future<dynamic> userContactPerson(HomeRequestModel homeRequestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userContactPerson,homeRequestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,ContactPersonModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, ContactPersonModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, ContactPersonModel());
    }
    } 
      Future<dynamic> userPayOthersOtp(PayOthersOtpRequestModel requestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userPayOthersOtp,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,PayOthersOtpModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false,PayOthersOtpModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, PayOthersOtpModel());
    }
    }  
     Future<dynamic> userDelete(HomeRequestModel requestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userDelete,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,DeleteModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, DeleteModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, DeleteModel());
    }
    }     
    Future<dynamic> userCatList(HomeRequestModel requestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userCatList,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,CatListModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false,CatListModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, CatListModel());
    }
    }     
      Future<dynamic> userProductList(ProductListRequestModel requestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userProductList,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,ProductListModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false,ProductListModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, ProductListModel());
    }
    }     
     Future<dynamic> userLuckyDraw(LuckyDrawRequestModel requestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userLuckyDraw,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,LuckyDrawModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false,LuckyDrawModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, LuckyDrawModel());
    }
    }     
      Future<dynamic> userLuckyTerms(AboutUsRequestModel requestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userLuckyTerms,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,LuckyTermsModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false,LuckyTermsModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, LuckyTermsModel());
    }
    }     
      Future<dynamic> userWinners(WinnersRequestModel requestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userWinners,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,WinnersModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false,WinnersModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, WinnersModel());
    }
    } 
     Future<dynamic> userLuckyMonths(HomeRequestModel requestModel)async{
 try {
 
      var response = await apiService.post(ApiConstant.userLuckyMonths,requestModel);
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('home-----${responseData}');
        return (true,LuckyMonthsModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false,LuckyMonthsModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, LuckyMonthsModel());
    }
    }         
}