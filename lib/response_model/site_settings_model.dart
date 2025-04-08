class SiteSettingsModel {
  String? text;
  String? message;
  List<Data>? data;

  SiteSettingsModel({this.text, this.message, this.data});

  SiteSettingsModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? siteUrl;
  String? siteContactMail;
  String? siteContactNumber;
  String? siteContactWhatsapp;
  String? siteContactLandline;
  String? siteGst;
  String? siteRegNo;
  String? siteDefaultCountry;
  String? siteDefaultLanguage;
  String? siteDefaultCurrency;
  String? siteDefaultTimezone;
  String? siteMailAddress;
  String? siteRegisteredAddress;
  String? emailTitle;
  String? logoImage;
  String? siteLogo;
  String? siteVLogo;
  String? siteInvoiceLogo;
  String? feviconImage;
  String? notification;
  String? fcmWebServerKey;
  String? purchaseGoldContent;
  String? deleteAccountContent;
  String? deleteAccountAlertContent;
  String? quickPaymentMethod;
  String? siteMode;
  String? upiQrCodes;
  String? fbAccessToken;
  String? whatsappNotifyNumbers;
  String? empSummaryNotifyNumbers;
  String? depSummaryNotifyNumbers;
  String? showroomSummaryNotifyNumbers;
  String? empDetailedNotifyNumbers;
  String? showroomDetailedNotifyNumbers;
  String? allShowroomDetailedNotifyNumbers;
  String? employeeRequestNotifyNumbers;
  String? employeeApprovalNotifyNumbers;
  String? customerRegNotifyNumbers;
  String? empRequestSummaryNotifyNumbers;
  String? dailycollectionReportsNotifyNumbers;
  String? totalcollectionReportsNotifyNumbers;
  String? chitclosedReportsNotifyNumbers;
  String? inwardoutwardReportsNotifyNumbers;
  String? sourcewiseReportsNotifyNumbers;
  String? approvalStatusReportsNotifyNumbers;
  String? goldPrice;
  String? silverPrice;
  String? priceUpdatedTime;
  String? collectionAuthorizationNotifyNumber;
  String? deleteReceiptNotifyNumber;
  String? mobWelcomeLogo;
  String? mobHomeLogo;
  String? headerLogo;
  String? websiteUrl;
  String? luckyDrawVideo;

  Data(
      {this.id,
      this.siteUrl,
      this.siteContactMail,
      this.siteContactNumber,
      this.siteContactWhatsapp,
      this.siteContactLandline,
      this.siteGst,
      this.siteRegNo,
      this.siteDefaultCountry,
      this.siteDefaultLanguage,
      this.siteDefaultCurrency,
      this.siteDefaultTimezone,
      this.siteMailAddress,
      this.siteRegisteredAddress,
      this.emailTitle,
      this.logoImage,
      this.siteLogo,
      this.siteVLogo,
      this.siteInvoiceLogo,
      this.feviconImage,
      this.notification,
      this.fcmWebServerKey,
      this.purchaseGoldContent,
      this.deleteAccountContent,
      this.deleteAccountAlertContent,
      this.quickPaymentMethod,
      this.siteMode,
      this.upiQrCodes,
      this.fbAccessToken,
      this.whatsappNotifyNumbers,
      this.empSummaryNotifyNumbers,
      this.depSummaryNotifyNumbers,
      this.showroomSummaryNotifyNumbers,
      this.empDetailedNotifyNumbers,
      this.showroomDetailedNotifyNumbers,
      this.allShowroomDetailedNotifyNumbers,
      this.employeeRequestNotifyNumbers,
      this.employeeApprovalNotifyNumbers,
      this.customerRegNotifyNumbers,
      this.empRequestSummaryNotifyNumbers,
      this.dailycollectionReportsNotifyNumbers,
      this.totalcollectionReportsNotifyNumbers,
      this.chitclosedReportsNotifyNumbers,
      this.inwardoutwardReportsNotifyNumbers,
      this.sourcewiseReportsNotifyNumbers,
      this.approvalStatusReportsNotifyNumbers,
      this.goldPrice,
      this.silverPrice,
      this.priceUpdatedTime,
      this.collectionAuthorizationNotifyNumber,
      this.deleteReceiptNotifyNumber,
      this.mobWelcomeLogo,
      this.mobHomeLogo,
      this.headerLogo,
      this.websiteUrl,
      this.luckyDrawVideo});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    siteUrl = json['site_url'];
    siteContactMail = json['site_contact_mail'];
    siteContactNumber = json['site_contact_number'];
    siteContactWhatsapp = json['site_contact_whatsapp'];
    siteContactLandline = json['site_contact_landline'];
    siteGst = json['site_gst'];
    siteRegNo = json['site_reg_no'];
    siteDefaultCountry = json['site_default_country'];
    siteDefaultLanguage = json['site_default_language'];
    siteDefaultCurrency = json['site_default_currency'];
    siteDefaultTimezone = json['site_default_timezone'];
    siteMailAddress = json['site_mail_address'];
    siteRegisteredAddress = json['site_registered_address'];
    emailTitle = json['email_title'];
    logoImage = json['logo_image'];
    siteLogo = json['site_logo'];
    siteVLogo = json['site_v_logo'];
    siteInvoiceLogo = json['site_invoice_logo'];
    feviconImage = json['fevicon_image'];
    notification = json['notification'];
    fcmWebServerKey = json['fcm_web_server_key'];
    purchaseGoldContent = json['purchase_gold_content'];
    deleteAccountContent = json['delete_account_content'];
    deleteAccountAlertContent = json['delete_account_alert_content'];
    quickPaymentMethod = json['quick_payment_method'];
    siteMode = json['site_mode'];
    upiQrCodes = json['upi_qr_codes'];
    fbAccessToken = json['fb_access_token'];
    whatsappNotifyNumbers = json['whatsapp_notify_numbers'];
    empSummaryNotifyNumbers = json['emp_summary_notify_numbers'];
    depSummaryNotifyNumbers = json['dep_summary_notify_numbers'];
    showroomSummaryNotifyNumbers = json['showroom_summary_notify_numbers'];
    empDetailedNotifyNumbers = json['emp_detailed_notify_numbers'];
    showroomDetailedNotifyNumbers = json['showroom_detailed_notify_numbers'];
    allShowroomDetailedNotifyNumbers =
        json['all_showroom_detailed_notify_numbers'];
    employeeRequestNotifyNumbers = json['employee_request_notify_numbers'];
    employeeApprovalNotifyNumbers = json['employee_approval_notify_numbers'];
    customerRegNotifyNumbers = json['customer_reg_notify_numbers'];
    empRequestSummaryNotifyNumbers = json['emp_request_summary_notify_numbers'];
    dailycollectionReportsNotifyNumbers =
        json['dailycollection_reports_notify_numbers'];
    totalcollectionReportsNotifyNumbers =
        json['totalcollection_reports_notify_numbers'];
    chitclosedReportsNotifyNumbers = json['chitclosed_reports_notify_numbers'];
    inwardoutwardReportsNotifyNumbers =
        json['inwardoutward_reports_notify_numbers'];
    sourcewiseReportsNotifyNumbers = json['sourcewise_reports_notify_numbers'];
    approvalStatusReportsNotifyNumbers =
        json['approval_status_reports_notify_numbers'];
    goldPrice = json['gold_price'];
    silverPrice = json['silver_price'];
    priceUpdatedTime = json['price_updated_time'];
    collectionAuthorizationNotifyNumber =
        json['collection_authorization_notify_number'];
    deleteReceiptNotifyNumber = json['delete_receipt_notify_number'];
    mobWelcomeLogo = json['mob_welcome_logo'];
    mobHomeLogo = json['mob_home_logo'];
    headerLogo = json['header-logo'];
    websiteUrl = json['website_url'];
    luckyDrawVideo = json['lucky_draw_video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['site_url'] = this.siteUrl;
    data['site_contact_mail'] = this.siteContactMail;
    data['site_contact_number'] = this.siteContactNumber;
    data['site_contact_whatsapp'] = this.siteContactWhatsapp;
    data['site_contact_landline'] = this.siteContactLandline;
    data['site_gst'] = this.siteGst;
    data['site_reg_no'] = this.siteRegNo;
    data['site_default_country'] = this.siteDefaultCountry;
    data['site_default_language'] = this.siteDefaultLanguage;
    data['site_default_currency'] = this.siteDefaultCurrency;
    data['site_default_timezone'] = this.siteDefaultTimezone;
    data['site_mail_address'] = this.siteMailAddress;
    data['site_registered_address'] = this.siteRegisteredAddress;
    data['email_title'] = this.emailTitle;
    data['logo_image'] = this.logoImage;
    data['site_logo'] = this.siteLogo;
    data['site_v_logo'] = this.siteVLogo;
    data['site_invoice_logo'] = this.siteInvoiceLogo;
    data['fevicon_image'] = this.feviconImage;
    data['notification'] = this.notification;
    data['fcm_web_server_key'] = this.fcmWebServerKey;
    data['purchase_gold_content'] = this.purchaseGoldContent;
    data['delete_account_content'] = this.deleteAccountContent;
    data['delete_account_alert_content'] = this.deleteAccountAlertContent;
    data['quick_payment_method'] = this.quickPaymentMethod;
    data['site_mode'] = this.siteMode;
    data['upi_qr_codes'] = this.upiQrCodes;
    data['fb_access_token'] = this.fbAccessToken;
    data['whatsapp_notify_numbers'] = this.whatsappNotifyNumbers;
    data['emp_summary_notify_numbers'] = this.empSummaryNotifyNumbers;
    data['dep_summary_notify_numbers'] = this.depSummaryNotifyNumbers;
    data['showroom_summary_notify_numbers'] = this.showroomSummaryNotifyNumbers;
    data['emp_detailed_notify_numbers'] = this.empDetailedNotifyNumbers;
    data['showroom_detailed_notify_numbers'] =
        this.showroomDetailedNotifyNumbers;
    data['all_showroom_detailed_notify_numbers'] =
        this.allShowroomDetailedNotifyNumbers;
    data['employee_request_notify_numbers'] = this.employeeRequestNotifyNumbers;
    data['employee_approval_notify_numbers'] =
        this.employeeApprovalNotifyNumbers;
    data['customer_reg_notify_numbers'] = this.customerRegNotifyNumbers;
    data['emp_request_summary_notify_numbers'] =
        this.empRequestSummaryNotifyNumbers;
    data['dailycollection_reports_notify_numbers'] =
        this.dailycollectionReportsNotifyNumbers;
    data['totalcollection_reports_notify_numbers'] =
        this.totalcollectionReportsNotifyNumbers;
    data['chitclosed_reports_notify_numbers'] =
        this.chitclosedReportsNotifyNumbers;
    data['inwardoutward_reports_notify_numbers'] =
        this.inwardoutwardReportsNotifyNumbers;
    data['sourcewise_reports_notify_numbers'] =
        this.sourcewiseReportsNotifyNumbers;
    data['approval_status_reports_notify_numbers'] =
        this.approvalStatusReportsNotifyNumbers;
    data['gold_price'] = this.goldPrice;
    data['silver_price'] = this.silverPrice;
    data['price_updated_time'] = this.priceUpdatedTime;
    data['collection_authorization_notify_number'] =
        this.collectionAuthorizationNotifyNumber;
    data['delete_receipt_notify_number'] = this.deleteReceiptNotifyNumber;
    data['mob_welcome_logo'] = this.mobWelcomeLogo;
    data['mob_home_logo'] = this.mobHomeLogo;
    data['header-logo'] = this.headerLogo;
    data['website_url'] = this.websiteUrl;
    data['lucky_draw_video'] = this.luckyDrawVideo;
    return data;
  }
}
