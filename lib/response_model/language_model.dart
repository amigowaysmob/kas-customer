class LangModel {
  String? text;
  String? message;
  Data? data;

  LangModel({this.text, this.message, this.data});

  LangModel.fromJson(Map<String, dynamic> json) {
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
  String? myAccount;
  String? myEarnings;
  String? myTransactions;
  String? myReports;
  String? ourPlansDetails;
  String? ourGallery;
  String? ourYoutubeChannel;
  String? ourStores;
  String? aboutUs;
  String? notifications;
  String? inviteFriends;
  String? gifts;
  String? luckyDraw;
  String? offers;
  String? settings;
  String? contactUs;
  String? termsConditions;
  String? privacyPolicy;
  String? logout;
  String? viewProfile;
  String? personalDetails;
  String? bankDetails;
  String? nomineeBankDetails;
  String? reports;
  String? ourPlans;
  String? imagesGallery;
  String? videosGallery;
  String? edit;
  String? fullName;
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
  String? subject;
  String? message;
  String? call;
  String? whatsapp;
  String? enquirySuccess;
  String? customerRegistrationForm;
  String? customerForm;
  String? guardianName;
  String? mobileNumber;
  String? whatsappNumber;
  String? dateOfBirth;
  String? pincode;
  String? state;
  String? district;
  String? city;
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
  String? planRequired;
  String? paymentModeRequired;
  String? termsAgreementRequired;
  String? numberValidatedRequired;
  String? customerPhotoRequired;
  String? aadhaarCardRequired;
  String? panCardRequired;
  String? paymentScreenshotRequired;
  String? idProofFrontRequired;
  String? idProofBackRequired;
  String? idTypeRequired;
  String? panFrontRequired;
  String? panBackRequired;
  String? addCustomers;
  String? addNewCustomer;
  String? inviteFriendsContent;
  String? todayEarnings;
  String? totalEarnings;
  String? ownEarnings;
  String? referralEarnings;
  String? todayCustomers;
  String? totalCustomers;
  String? ownCustomers;
  String? referralCustomers;
  String? date;
  String? time;
  String? join;
  String? change;
  String? online;
  String? orderNumber;
  String? transactions;
  String? voucherNumber;
  String? serialNumber;
  String? savingsType;
  String? back;
  String? submit;
  String? goodMorning;
  String? goodNoon;
  String? goodEvening;
  String? welcome;
  String? joined;
  String? downloadReceipt;
  String? close;
  String? emailRequired;
  String? mobileRequired;
  String? subjectRequired;
  String? messageRequired;
  String? inviteYourFriends;
  String? empId;
  String? empName;
  String? yourEarnings;
  String? clickHere;
  String? videos;
  String? planDetails;
  String? trainingBook;
  String? clickHereMoreDetails;
  String? leaveCustomerForm;
  String? yes;
  String? no;
  String? monthlyDue;
  String? weeklyDue;
  String? postalCode;
  String? division;
  String? area;
  String? circle;
  String? transactionType;
  String? receiptNumber;
  String? withdrawalAmount;
  String? balanceAmount;
  String? fromDate;
  String? toDate;
  String? noData;
  String? cash;
  String? title;
  String? debit;
  String? credit;
  String? balance;
  String? location;
  String? phoneNumberExists;
  String? emailExists;
  String? mpinConfirmNotEqual;
  String? otpSent;
  String? copyInvite;
  String? contactPerson;
  String? contactNumber;
  String? openingTime;
  String? closingTime;
  String? map;
  String? planSubHeading;
  String? welcomePlanDetail;
  String? knowMoreAboutUs;
  String? doYouWantGift;
  String? chooseGift;
  String? uploadProof;
  String? skip;
  String? totalPaid;
  String? due;
  String? gift;
  String? deliveryProofRequired;
  String? passbookRequired;
  String? deliveredProof;
  String? passbook;
  String? download;
  String? referralLinkCopied;
  String? mpin;
  String? confirmMpin;
  String? changeMpin;
  String? currentMpin;
  String? dateTime;
  String? groupCode;
  String? modeOfPayment;
  String? amountReceived;
  String? giftStatus;
  String? denomination;
  String? sNo;
  String? particulars;
  String? noOfCount;
  String? noOfCards;
  String? totalAmount;
  String? dailyReports;
  String? total;
  String? dataDeletionRequest;
  String? myEvents;
  String? addEvent;
  String? eventName;
  String? eventDescription;
  String? startDateTime;
  String? endDateTime;
  String? startEndTime;
  String? eventDate;
  String? cancel;
  String? calendar;
  String? update;
  String? flexiblePlan;
  String? todayGoldPrice;
  String? todaySilverPrice;
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
  String? payForOthers;
  String? myWallet;
  String? othersGift;
  String? offersGift;
  String? chitClosing;
  String? eCatalogue;
  String? feedback;
  String? whatsappNumberExists;
  String? sameAsMobileNumber;
  String? homeCollection;
  String? todayGoldRate;
  String? payable;
  String? payNow;
  String? maximumChitCountReached;
  String? contactTeam;
  String? search;
  String? noTransactionData;
  String? viewTransactionDataLoginHere;
  String? chitList;
  String? ledger;
  String? name;
  String? planStartDate;
  String? viewDetails;
  String? viewLedgerDataLoginHere;
  String? chitClosingStatus;
  String? ledgerDetail;
  String? planAmount;
  String? installmentsPaid;
  String? payableAmount;
  String? paidAmount;
  String? joiningDate;
  String? maturityDate;
  String? lapseDate;
  String? amount;
  String? installment;
  String? nomineeDetails;
  String? nomineeIdProof;
  String? nomineeFullName;
  String? nomineeGender;
  String? nomineeAddress;
  String? viewAccountLoginHere;
  String? loginSignup;
  String? myPlans;
  String? myGifts;
  String? myEPassbook;
  String? logoutConfirmation;
  String? noPlans;
  String? searchOtherPlans;
  String? selectPlanType;
  String? selectPlanCategory;
  String? typeGroupCode;
  String? planType;
  String? moreDetails;
  String? group;
  String? dueAmount;
  String? usePartialPayment;
  String? enterValueBelow;
  String? enterPartialAmount;
  String? enterYourAmount;
  String? instNo;
  String? noPayDues;
  String? paymentDetails;
  String? pendingAmount;
  String? summary;
  String? passbookNumber;
  String? noSummaryData;
  String? paymentSuccess;
  String? paymentFailure;
  String? noGifts;
  String? planId;
  String? giftPrize;
  String? received;
  String? pending;
  String? otherPlanGifts;
  String? noGiftsForThisPlan;
  String? weight;
  String? productDescription;
  String? similarProducts;
  String? whatsappEnquiry;
  String? enquiryForm;
  String? productDetailsQuery;
  String? productName;
  String? productCode;
  String? thankYou;
  String? feedBack;
  String? copyAndInvite;
  String? acNumber;
  String? transactionId;
  String? paidAt;
  String? grandTotal;
  String? closechit;
  String? writeYourReview;
  String? addReview;
  String? sendReview;
  String? giftAmount;
  String? basicDetails;

  String? nomineeBasicDetails;
  String? ifscNumber;
  String? accountNumber;
  String? upiId;
  String? idProofDetails;
  String? aadhar;
  String? pan;
  String? contactPersons;
  String? otpVerification;
  String? enterOtpSentTo;
  String? didntReceiveOtp;
  String? resendOtp;
  String? planCount;
  String? noCustomer;
  String? myProfile;
  String? idProof;
  String? filter;
  String? pickCategory;
  String? size;
  String? allPrice;
  String? lowToHigh;
  String? highToLow;
  String? sendOtp;
  String? noDataFound;
  String? selectSize;
  String? sortBy;
  String? shift;
  String? myCustomers;
  String? myPlanner;
  String? todayTarget;
  String? totalTarget;
  String? thisMonthTarget;
  String? home;
  String? newCustomerForm;
  String? myFollowUp;

  Data(
      {this.myAccount,
      this.myEarnings,
      this.myTransactions,
      this.myReports,
      this.ourPlansDetails,
      this.ourGallery,
      this.ourYoutubeChannel,
      this.ourStores,
      this.aboutUs,
      this.notifications,
      this.inviteFriends,
      this.gifts,
      this.luckyDraw,
      this.offers,
      this.settings,
      this.contactUs,
      this.termsConditions,
      this.privacyPolicy,
      this.logout,
      this.viewProfile,
      this.personalDetails,
      this.bankDetails,
      this.nomineeBankDetails,
      this.reports,
      this.ourPlans,
      this.imagesGallery,
      this.videosGallery,
      this.edit,
      this.fullName,
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
      this.subject,
      this.message,
      this.call,
      this.whatsapp,
      this.enquirySuccess,
      this.customerRegistrationForm,
      this.customerForm,
      this.guardianName,
      this.mobileNumber,
      this.whatsappNumber,
      this.dateOfBirth,
      this.pincode,
      this.state,
      this.district,
      this.city,
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
      this.planRequired,
      this.paymentModeRequired,
      this.termsAgreementRequired,
      this.numberValidatedRequired,
      this.customerPhotoRequired,
      this.aadhaarCardRequired,
      this.panCardRequired,
      this.paymentScreenshotRequired,
      this.idProofFrontRequired,
      this.idProofBackRequired,
      this.idTypeRequired,
      this.panFrontRequired,
      this.panBackRequired,
      this.addCustomers,
      this.addNewCustomer,
      this.inviteFriendsContent,
      this.todayEarnings,
      this.totalEarnings,
      this.ownEarnings,
      this.referralEarnings,
      this.todayCustomers,
      this.totalCustomers,
      this.ownCustomers,
      this.referralCustomers,
      this.date,
      this.time,
      this.join,
      this.change,
      this.online,
      this.orderNumber,
      this.transactions,
      this.voucherNumber,
      this.serialNumber,
      this.savingsType,
      this.back,
      this.submit,
      this.goodMorning,
      this.goodNoon,
      this.goodEvening,
      this.welcome,
      this.joined,
      this.downloadReceipt,
      this.close,
      this.emailRequired,
      this.mobileRequired,
      this.subjectRequired,
      this.messageRequired,
      this.inviteYourFriends,
      this.empId,
      this.empName,
      this.yourEarnings,
      this.clickHere,
      this.videos,
      this.planDetails,
      this.trainingBook,
      this.clickHereMoreDetails,
      this.leaveCustomerForm,
      this.yes,
      this.no,
      this.monthlyDue,
      this.weeklyDue,
      this.postalCode,
      this.division,
      this.area,
      this.circle,
      this.transactionType,
      this.receiptNumber,
      this.withdrawalAmount,
      this.balanceAmount,
      this.fromDate,
      this.toDate,
      this.noData,
      this.cash,
      this.title,
      this.debit,
      this.credit,
      this.balance,
      this.location,
      this.phoneNumberExists,
      this.emailExists,
      this.mpinConfirmNotEqual,
      this.otpSent,
      this.copyInvite,
      this.contactPerson,
      this.contactNumber,
      this.openingTime,
      this.closingTime,
      this.map,
      this.planSubHeading,
      this.welcomePlanDetail,
      this.knowMoreAboutUs,
      this.doYouWantGift,
      this.chooseGift,
      this.uploadProof,
      this.skip,
      this.totalPaid,
      this.due,
      this.gift,
      this.deliveryProofRequired,
      this.passbookRequired,
      this.deliveredProof,
      this.passbook,
      this.download,
      this.referralLinkCopied,
      this.mpin,
      this.confirmMpin,
      this.changeMpin,
      this.currentMpin,
      this.dateTime,
      this.groupCode,
      this.modeOfPayment,
      this.amountReceived,
      this.giftStatus,
      this.denomination,
      this.sNo,
      this.particulars,
      this.noOfCount,
      this.noOfCards,
      this.totalAmount,
      this.dailyReports,
      this.total,
      this.dataDeletionRequest,
      this.myEvents,
      this.addEvent,
      this.eventName,
      this.eventDescription,
      this.startDateTime,
      this.endDateTime,
      this.startEndTime,
      this.eventDate,
      this.cancel,
      this.calendar,
      this.update,
      this.flexiblePlan,
      this.todayGoldPrice,
      this.todaySilverPrice,
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
      this.payForOthers,
      this.myWallet,
      this.othersGift,
      this.offersGift,
      this.chitClosing,
      this.eCatalogue,
      this.feedback,
      this.whatsappNumberExists,
      this.sameAsMobileNumber,
      this.homeCollection,
      this.todayGoldRate,
      this.payable,
      this.payNow,
      this.maximumChitCountReached,
      this.contactTeam,
      this.search,
      this.noTransactionData,
      this.viewTransactionDataLoginHere,
      this.chitList,
      this.ledger,
      this.name,
      this.planStartDate,
      this.viewDetails,
      this.viewLedgerDataLoginHere,
      this.chitClosingStatus,
      this.ledgerDetail,
      this.planAmount,
      this.installmentsPaid,
      this.payableAmount,
      this.paidAmount,
      this.joiningDate,
      this.maturityDate,
      this.lapseDate,
      this.amount,
      this.installment,
      this.nomineeDetails,
      this.nomineeIdProof,
      this.nomineeFullName,
      this.nomineeGender,
      this.nomineeAddress,
      this.viewAccountLoginHere,
      this.loginSignup,
      this.myPlans,
      this.myGifts,
      this.myEPassbook,
      this.logoutConfirmation,
      this.noPlans,
      this.searchOtherPlans,
      this.selectPlanType,
      this.selectPlanCategory,
      this.typeGroupCode,
      this.planType,
      this.moreDetails,
      this.group,
      this.dueAmount,
      this.usePartialPayment,
      this.enterValueBelow,
      this.enterPartialAmount,
      this.enterYourAmount,
      this.instNo,
      this.noPayDues,
      this.paymentDetails,
      this.pendingAmount,
      this.summary,
      this.passbookNumber,
      this.noSummaryData,
      this.paymentSuccess,
      this.paymentFailure,
      this.noGifts,
      this.planId,
      this.giftPrize,
      this.received,
      this.pending,
      this.otherPlanGifts,
      this.noGiftsForThisPlan,
      this.weight,
      this.productDescription,
      this.similarProducts,
      this.whatsappEnquiry,
      this.enquiryForm,
      this.productDetailsQuery,
      this.productName,
      this.productCode,
      this.thankYou,
      this.feedBack,
      this.copyAndInvite,
      this.acNumber,
      this.transactionId,
      this.paidAt,
      this.grandTotal,
      this.closechit,
      this.writeYourReview,
      this.addReview,
      this.sendReview,
      this.giftAmount,
      this.basicDetails,
      
      this.nomineeBasicDetails,
      this.ifscNumber,
      this.accountNumber,
      this.upiId,
      this.idProofDetails,
      this.aadhar,
      this.pan,
      this.contactPersons,
      this.otpVerification,
      this.enterOtpSentTo,
      this.didntReceiveOtp,
      this.resendOtp,
      this.planCount,
      this.noCustomer,
      this.myProfile,
      this.idProof,
      this.filter,
      this.pickCategory,
      this.size,
      this.allPrice,
      this.lowToHigh,
      this.highToLow,
      this.sendOtp,
      this.noDataFound,
      this.selectSize,
      this.sortBy,
      this.shift,
      this.myCustomers,
      this.myPlanner,
      this.todayTarget,
      this.totalTarget,
      this.thisMonthTarget,
      this.home,
      this.newCustomerForm,
      this.myFollowUp});

  Data.fromJson(Map<String, dynamic> json) {
    myAccount = json['my_account'];
    myEarnings = json['my_earnings'];
    myTransactions = json['my_transactions'];
    myReports = json['my_reports'];
    ourPlansDetails = json['our_plans_details'];
    ourGallery = json['our_gallery'];
    ourYoutubeChannel = json['our_youtube_channel'];
    ourStores = json['our_stores'];
    aboutUs = json['about_us'];
    notifications = json['notifications'];
    inviteFriends = json['invite_friends'];
    gifts = json['gifts'];
    luckyDraw = json['lucky_draw'];
    offers = json['offers'];
    settings = json['settings'];
    contactUs = json['contact_us'];
    termsConditions = json['terms_conditions'];
    privacyPolicy = json['privacy_policy'];
    logout = json['logout'];
    viewProfile = json['view_profile'];
    personalDetails = json['personal_details'];
    bankDetails = json['bank_details'];
    nomineeBankDetails = json['nominee_bank_details'];
    reports = json['reports'];
    ourPlans = json['our_plans'];
    imagesGallery = json['images_gallery'];
    videosGallery = json['videos_gallery'];
    edit = json['edit'];
    fullName = json['full_name'];
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
    subject = json['subject'];
    message = json['message'];
    call = json['call'];
    whatsapp = json['whatsapp'];
    enquirySuccess = json['enquiry_success'];
    customerRegistrationForm = json['customer_registration_form'];
    customerForm = json['customer_form'];
    guardianName = json['guardian_name'];
    mobileNumber = json['mobile_number'];
    whatsappNumber = json['whatsapp_number'];
    dateOfBirth = json['date_of_birth'];
    pincode = json['pincode'];
    state = json['state'];
    district = json['district'];
    city = json['city'];
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
    planRequired = json['plan_required'];
    paymentModeRequired = json['payment_mode_required'];
    termsAgreementRequired = json['terms_agreement_required'];
    numberValidatedRequired = json['number_validated_required'];
    customerPhotoRequired = json['customer_photo_required'];
    aadhaarCardRequired = json['aadhaar_card_required'];
    panCardRequired = json['pan_card_required'];
    paymentScreenshotRequired = json['payment_screenshot_required'];
    idProofFrontRequired = json['id_proof_front_required'];
    idProofBackRequired = json['id_proof_back_required'];
    idTypeRequired = json['id_type_required'];
    panFrontRequired = json['pan_front_required'];
    panBackRequired = json['pan_back_required'];
    addCustomers = json['add_customers'];
    addNewCustomer = json['add_new_customer'];
    inviteFriendsContent = json['invite_friends_content'];
    todayEarnings = json['today_earnings'];
    totalEarnings = json['total_earnings'];
    ownEarnings = json['own_earnings'];
    referralEarnings = json['referral_earnings'];
    todayCustomers = json['today_customers'];
    totalCustomers = json['total_customers'];
    ownCustomers = json['own_customers'];
    referralCustomers = json['referral_customers'];
    date = json['date'];
    time = json['time'];
    join = json['join'];
    change = json['change'];
    online = json['online'];
    orderNumber = json['order_number'];
    transactions = json['transactions'];
    voucherNumber = json['voucher_number'];
    serialNumber = json['serial_number'];
    savingsType = json['savings_type'];
    back = json['back'];
    submit = json['submit'];
    goodMorning = json['good_morning'];
    goodNoon = json['good_noon'];
    goodEvening = json['good_evening'];
    welcome = json['welcome'];
    joined = json['joined'];
    downloadReceipt = json['download_receipt'];
    close = json['close'];
    emailRequired = json['email_required'];
    mobileRequired = json['mobile_required'];
    subjectRequired = json['subject_required'];
    messageRequired = json['message_required'];
    inviteYourFriends = json['invite_your_friends'];
    empId = json['emp_id'];
    empName = json['emp_name'];
    yourEarnings = json['your_earnings'];
    clickHere = json['click_here'];
    videos = json['videos'];
    planDetails = json['plan_details'];
    trainingBook = json['training_book'];
    clickHereMoreDetails = json['click_here_more_details'];
    leaveCustomerForm = json['leave_customer_form'];
    yes = json['yes'];
    no = json['no'];
    monthlyDue = json['monthly_due'];
    weeklyDue = json['weekly_due'];
    postalCode = json['postal_code'];
    division = json['division'];
    area = json['area'];
    circle = json['circle'];
    transactionType = json['transaction_type'];
    receiptNumber = json['receipt_number'];
    withdrawalAmount = json['withdrawal_amount'];
    balanceAmount = json['balance_amount'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    noData = json['no_data'];
    cash = json['cash'];
    title = json['title'];
    debit = json['debit'];
    credit = json['credit'];
    balance = json['balance'];
    location = json['location'];
    phoneNumberExists = json['phone_number_exists'];
    emailExists = json['email_exists'];
    mpinConfirmNotEqual = json['mpin_confirm_not_equal'];
    otpSent = json['otp_sent'];
    copyInvite = json['copy_invite'];
    contactPerson = json['contact_person'];
    contactNumber = json['contact_number'];
    openingTime = json['opening_time'];
    closingTime = json['closing_time'];
    map = json['map'];
    planSubHeading = json['plan_sub_heading'];
    welcomePlanDetail = json['welcome_plan_detail'];
    knowMoreAboutUs = json['know_more_about_us'];
    doYouWantGift = json['do_you_want_gift'];
    chooseGift = json['choose_gift'];
    uploadProof = json['upload_proof'];
    skip = json['skip'];
    totalPaid = json['total_paid'];
    due = json['due'];
    gift = json['gift'];
    deliveryProofRequired = json['delivery_proof_required'];
    passbookRequired = json['passbook_required'];
    deliveredProof = json['delivered_proof'];
    passbook = json['passbook'];
    download = json['download'];
    referralLinkCopied = json['referral_link_copied'];
    mpin = json['mpin'];
    confirmMpin = json['confirm_mpin'];
    changeMpin = json['change_mpin'];
    currentMpin = json['current_mpin'];
    dateTime = json['date_time'];
    groupCode = json['group_code'];
    modeOfPayment = json['mode_of_payment'];
    amountReceived = json['amount_received'];
    giftStatus = json['gift_status'];
    denomination = json['denomination'];
    sNo = json['s_no'];
    particulars = json['particulars'];
    noOfCount = json['no_of_count'];
    noOfCards = json['no_of_cards'];
    totalAmount = json['total_amount'];
    dailyReports = json['daily_reports'];
    total = json['total'];
    dataDeletionRequest = json['data_deletion_request'];
    myEvents = json['my_events'];
    addEvent = json['add_event'];
    eventName = json['event_name'];
    eventDescription = json['event_description'];
    startDateTime = json['start_date_time'];
    endDateTime = json['end_date_time'];
    startEndTime = json['start_end_time'];
    eventDate = json['event_date'];
    cancel = json['cancel'];
    calendar = json['calendar'];
    update = json['update'];
    flexiblePlan = json['flexible_plan'];
    todayGoldPrice = json['today_gold_price'];
    todaySilverPrice = json['today_silver_price'];
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
    payForOthers = json['pay_for_others'];
    myWallet = json['my_wallet'];
    othersGift = json['others_gift'];
    offersGift = json['offers_gift'];
    chitClosing = json['chit_closing'];
    eCatalogue = json['e_catalogue'];
    feedback = json['feedback'];
    whatsappNumberExists = json['whatsapp_number_exists'];
    sameAsMobileNumber = json['same_as_mobile_number'];
    homeCollection = json['home_collection'];
    todayGoldRate = json['today_gold_rate'];
    payable = json['payable'];
    payNow = json['pay_now'];
    maximumChitCountReached = json['maximum_chit_count_reached'];
    contactTeam = json['contact_team'];
    search = json['search'];
    noTransactionData = json['no_transaction_data'];
    viewTransactionDataLoginHere = json['view_transaction_data_login_here'];
    chitList = json['chit_list'];
    ledger = json['ledger'];
    name = json['name'];
    planStartDate = json['plan_start_date'];
    viewDetails = json['view_details'];
    viewLedgerDataLoginHere = json['view_ledger_data_login_here'];
    chitClosingStatus = json['chit_closing_status'];
    ledgerDetail = json['ledger_detail'];
    planAmount = json['plan_amount'];
    installmentsPaid = json['installments_paid'];
    payableAmount = json['payable_amount'];
    paidAmount = json['paid_amount'];
    joiningDate = json['joining_date'];
    maturityDate = json['maturity_date'];
    lapseDate = json['lapse_date'];
    amount = json['amount'];
    installment = json['installment'];
    nomineeDetails = json['nominee_details'];
    nomineeIdProof = json['nominee_id_proof'];
    nomineeFullName = json['nominee_full_name'];
    nomineeGender = json['nominee_gender'];
    nomineeAddress = json['nominee_address'];
    viewAccountLoginHere = json['view_account_login_here'];
    loginSignup = json['login_signup'];
    myPlans = json['my_plans'];
    myGifts = json['my_gifts'];
    myEPassbook = json['my_e_passbook'];
    logoutConfirmation = json['logout_confirmation'];
    noPlans = json['no_plans'];
    searchOtherPlans = json['search_other_plans'];
    selectPlanType = json['select_plan_type'];
    selectPlanCategory = json['select_plan_category'];
    typeGroupCode = json['type_group_code'];
    planType = json['plan_type'];
    moreDetails = json['more_details'];
    group = json['group'];
    dueAmount = json['due_amount'];
    usePartialPayment = json['use_partial_payment'];
    enterValueBelow = json['enter_value_below'];
    enterPartialAmount = json['enter_partial_amount'];
    enterYourAmount = json['enter_your_amount'];
    instNo = json['inst_no'];
    noPayDues = json['no_pay_dues'];
    paymentDetails = json['payment_details'];
    pendingAmount = json['pending_amount'];
    summary = json['summary'];
    passbookNumber = json['passbook_number'];
    noSummaryData = json['no_summary_data'];
    paymentSuccess = json['payment_success'];
    paymentFailure = json['payment_failure'];
    noGifts = json['no_gifts'];
    planId = json['plan_id'];
    giftPrize = json['gift_prize'];
    received = json['received'];
    pending = json['pending'];
    otherPlanGifts = json['other_plan_gifts'];
    noGiftsForThisPlan = json['no_gifts_for_this_plan'];
    weight = json['weight'];
    productDescription = json['product_description'];
    similarProducts = json['similar_products'];
    whatsappEnquiry = json['whatsapp_enquiry'];
    enquiryForm = json['enquiry_form'];
    productDetailsQuery = json['product_details_query'];
    productName = json['product_name'];
    productCode = json['product_code'];
    thankYou = json['thank_you'];
    feedBack = json['feed_back'];
    copyAndInvite = json['copy_and_invite'];
    acNumber = json['ac_number'];
    transactionId = json['transaction_id'];
    paidAt = json['paid_at'];
    grandTotal = json['grand_total'];
    closechit = json['closechit'];
    writeYourReview = json['write_your_review'];
    addReview = json['add_review'];
    sendReview = json['send_review'];
    giftAmount = json['gift_amount'];
    basicDetails = json['basic_details'];
    address1 = json['address1'];
    nomineeBasicDetails = json['nominee_basic_details'];
    ifscNumber = json['ifsc_number'];
    accountNumber = json['account_number'];
    upiId = json['upi_id'];
    idProofDetails = json['id_proof_details'];
    aadhar = json['aadhar'];
    pan = json['pan'];
    contactPersons = json['contact_persons'];
    otpVerification = json['otp_verification'];
    enterOtpSentTo = json['enter_otp_sent_to'];
    didntReceiveOtp = json['didnt_receive_otp'];
    resendOtp = json['resend_otp'];
    planCount = json['plan_count'];
    noCustomer = json['no_customer'];
    myProfile = json['my_profile'];
    idProof = json['id_proof'];
    filter = json['filter'];
    pickCategory = json['pick_category'];
    size = json['size'];
    allPrice = json['all_price'];
    lowToHigh = json['low_to_high'];
    highToLow = json['high_to_low'];
    sendOtp = json['send_otp'];
    noDataFound = json['no_data_found'];
    selectSize = json['select_size'];
    sortBy = json['sort_by'];
    shift = json['shift'];
    myCustomers = json['my_customers'];
    myPlanner = json['my_planner'];
    todayTarget = json['today_target'];
    totalTarget = json['total_target'];
    thisMonthTarget = json['this_month_target'];
    home = json['home'];
    newCustomerForm = json['new_customer_form'];
    myFollowUp = json['my_follow_up'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['my_account'] = this.myAccount;
    data['my_earnings'] = this.myEarnings;
    data['my_transactions'] = this.myTransactions;
    data['my_reports'] = this.myReports;
    data['our_plans_details'] = this.ourPlansDetails;
    data['our_gallery'] = this.ourGallery;
    data['our_youtube_channel'] = this.ourYoutubeChannel;
    data['our_stores'] = this.ourStores;
    data['about_us'] = this.aboutUs;
    data['notifications'] = this.notifications;
    data['invite_friends'] = this.inviteFriends;
    data['gifts'] = this.gifts;
    data['lucky_draw'] = this.luckyDraw;
    data['offers'] = this.offers;
    data['settings'] = this.settings;
    data['contact_us'] = this.contactUs;
    data['terms_conditions'] = this.termsConditions;
    data['privacy_policy'] = this.privacyPolicy;
    data['logout'] = this.logout;
    data['view_profile'] = this.viewProfile;
    data['personal_details'] = this.personalDetails;
    data['bank_details'] = this.bankDetails;
    data['nominee_bank_details'] = this.nomineeBankDetails;
    data['reports'] = this.reports;
    data['our_plans'] = this.ourPlans;
    data['images_gallery'] = this.imagesGallery;
    data['videos_gallery'] = this.videosGallery;
    data['edit'] = this.edit;
    data['full_name'] = this.fullName;
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
    data['subject'] = this.subject;
    data['message'] = this.message;
    data['call'] = this.call;
    data['whatsapp'] = this.whatsapp;
    data['enquiry_success'] = this.enquirySuccess;
    data['customer_registration_form'] = this.customerRegistrationForm;
    data['customer_form'] = this.customerForm;
    data['guardian_name'] = this.guardianName;
    data['mobile_number'] = this.mobileNumber;
    data['whatsapp_number'] = this.whatsappNumber;
    data['date_of_birth'] = this.dateOfBirth;
    data['pincode'] = this.pincode;
    data['state'] = this.state;
    data['district'] = this.district;
    data['city'] = this.city;
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
    data['plan_required'] = this.planRequired;
    data['payment_mode_required'] = this.paymentModeRequired;
    data['terms_agreement_required'] = this.termsAgreementRequired;
    data['number_validated_required'] = this.numberValidatedRequired;
    data['customer_photo_required'] = this.customerPhotoRequired;
    data['aadhaar_card_required'] = this.aadhaarCardRequired;
    data['pan_card_required'] = this.panCardRequired;
    data['payment_screenshot_required'] = this.paymentScreenshotRequired;
    data['id_proof_front_required'] = this.idProofFrontRequired;
    data['id_proof_back_required'] = this.idProofBackRequired;
    data['id_type_required'] = this.idTypeRequired;
    data['pan_front_required'] = this.panFrontRequired;
    data['pan_back_required'] = this.panBackRequired;
    data['add_customers'] = this.addCustomers;
    data['add_new_customer'] = this.addNewCustomer;
    data['invite_friends_content'] = this.inviteFriendsContent;
    data['today_earnings'] = this.todayEarnings;
    data['total_earnings'] = this.totalEarnings;
    data['own_earnings'] = this.ownEarnings;
    data['referral_earnings'] = this.referralEarnings;
    data['today_customers'] = this.todayCustomers;
    data['total_customers'] = this.totalCustomers;
    data['own_customers'] = this.ownCustomers;
    data['referral_customers'] = this.referralCustomers;
    data['date'] = this.date;
    data['time'] = this.time;
    data['join'] = this.join;
    data['change'] = this.change;
    data['online'] = this.online;
    data['order_number'] = this.orderNumber;
    data['transactions'] = this.transactions;
    data['voucher_number'] = this.voucherNumber;
    data['serial_number'] = this.serialNumber;
    data['savings_type'] = this.savingsType;
    data['back'] = this.back;
    data['submit'] = this.submit;
    data['good_morning'] = this.goodMorning;
    data['good_noon'] = this.goodNoon;
    data['good_evening'] = this.goodEvening;
    data['welcome'] = this.welcome;
    data['joined'] = this.joined;
    data['download_receipt'] = this.downloadReceipt;
    data['close'] = this.close;
    data['email_required'] = this.emailRequired;
    data['mobile_required'] = this.mobileRequired;
    data['subject_required'] = this.subjectRequired;
    data['message_required'] = this.messageRequired;
    data['invite_your_friends'] = this.inviteYourFriends;
    data['emp_id'] = this.empId;
    data['emp_name'] = this.empName;
    data['your_earnings'] = this.yourEarnings;
    data['click_here'] = this.clickHere;
    data['videos'] = this.videos;
    data['plan_details'] = this.planDetails;
    data['training_book'] = this.trainingBook;
    data['click_here_more_details'] = this.clickHereMoreDetails;
    data['leave_customer_form'] = this.leaveCustomerForm;
    data['yes'] = this.yes;
    data['no'] = this.no;
    data['monthly_due'] = this.monthlyDue;
    data['weekly_due'] = this.weeklyDue;
    data['postal_code'] = this.postalCode;
    data['division'] = this.division;
    data['area'] = this.area;
    data['circle'] = this.circle;
    data['transaction_type'] = this.transactionType;
    data['receipt_number'] = this.receiptNumber;
    data['withdrawal_amount'] = this.withdrawalAmount;
    data['balance_amount'] = this.balanceAmount;
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    data['no_data'] = this.noData;
    data['cash'] = this.cash;
    data['title'] = this.title;
    data['debit'] = this.debit;
    data['credit'] = this.credit;
    data['balance'] = this.balance;
    data['location'] = this.location;
    data['phone_number_exists'] = this.phoneNumberExists;
    data['email_exists'] = this.emailExists;
    data['mpin_confirm_not_equal'] = this.mpinConfirmNotEqual;
    data['otp_sent'] = this.otpSent;
    data['copy_invite'] = this.copyInvite;
    data['contact_person'] = this.contactPerson;
    data['contact_number'] = this.contactNumber;
    data['opening_time'] = this.openingTime;
    data['closing_time'] = this.closingTime;
    data['map'] = this.map;
    data['plan_sub_heading'] = this.planSubHeading;
    data['welcome_plan_detail'] = this.welcomePlanDetail;
    data['know_more_about_us'] = this.knowMoreAboutUs;
    data['do_you_want_gift'] = this.doYouWantGift;
    data['choose_gift'] = this.chooseGift;
    data['upload_proof'] = this.uploadProof;
    data['skip'] = this.skip;
    data['total_paid'] = this.totalPaid;
    data['due'] = this.due;
    data['gift'] = this.gift;
    data['delivery_proof_required'] = this.deliveryProofRequired;
    data['passbook_required'] = this.passbookRequired;
    data['delivered_proof'] = this.deliveredProof;
    data['passbook'] = this.passbook;
    data['download'] = this.download;
    data['referral_link_copied'] = this.referralLinkCopied;
    data['mpin'] = this.mpin;
    data['confirm_mpin'] = this.confirmMpin;
    data['change_mpin'] = this.changeMpin;
    data['current_mpin'] = this.currentMpin;
    data['date_time'] = this.dateTime;
    data['group_code'] = this.groupCode;
    data['mode_of_payment'] = this.modeOfPayment;
    data['amount_received'] = this.amountReceived;
    data['gift_status'] = this.giftStatus;
    data['denomination'] = this.denomination;
    data['s_no'] = this.sNo;
    data['particulars'] = this.particulars;
    data['no_of_count'] = this.noOfCount;
    data['no_of_cards'] = this.noOfCards;
    data['total_amount'] = this.totalAmount;
    data['daily_reports'] = this.dailyReports;
    data['total'] = this.total;
    data['data_deletion_request'] = this.dataDeletionRequest;
    data['my_events'] = this.myEvents;
    data['add_event'] = this.addEvent;
    data['event_name'] = this.eventName;
    data['event_description'] = this.eventDescription;
    data['start_date_time'] = this.startDateTime;
    data['end_date_time'] = this.endDateTime;
    data['start_end_time'] = this.startEndTime;
    data['event_date'] = this.eventDate;
    data['cancel'] = this.cancel;
    data['calendar'] = this.calendar;
    data['update'] = this.update;
    data['flexible_plan'] = this.flexiblePlan;
    data['today_gold_price'] = this.todayGoldPrice;
    data['today_silver_price'] = this.todaySilverPrice;
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
    data['pay_for_others'] = this.payForOthers;
    data['my_wallet'] = this.myWallet;
    data['others_gift'] = this.othersGift;
    data['offers_gift'] = this.offersGift;
    data['chit_closing'] = this.chitClosing;
    data['e_catalogue'] = this.eCatalogue;
    data['feedback'] = this.feedback;
    data['whatsapp_number_exists'] = this.whatsappNumberExists;
    data['same_as_mobile_number'] = this.sameAsMobileNumber;
    data['home_collection'] = this.homeCollection;
    data['today_gold_rate'] = this.todayGoldRate;
    data['payable'] = this.payable;
    data['pay_now'] = this.payNow;
    data['maximum_chit_count_reached'] = this.maximumChitCountReached;
    data['contact_team'] = this.contactTeam;
    data['search'] = this.search;
    data['no_transaction_data'] = this.noTransactionData;
    data['view_transaction_data_login_here'] =
        this.viewTransactionDataLoginHere;
    data['chit_list'] = this.chitList;
    data['ledger'] = this.ledger;
    data['name'] = this.name;
    data['plan_start_date'] = this.planStartDate;
    data['view_details'] = this.viewDetails;
    data['view_ledger_data_login_here'] = this.viewLedgerDataLoginHere;
    data['chit_closing_status'] = this.chitClosingStatus;
    data['ledger_detail'] = this.ledgerDetail;
    data['plan_amount'] = this.planAmount;
    data['installments_paid'] = this.installmentsPaid;
    data['payable_amount'] = this.payableAmount;
    data['paid_amount'] = this.paidAmount;
    data['joining_date'] = this.joiningDate;
    data['maturity_date'] = this.maturityDate;
    data['lapse_date'] = this.lapseDate;
    data['amount'] = this.amount;
    data['installment'] = this.installment;
    data['nominee_details'] = this.nomineeDetails;
    data['nominee_id_proof'] = this.nomineeIdProof;
    data['nominee_full_name'] = this.nomineeFullName;
    data['nominee_gender'] = this.nomineeGender;
    data['nominee_address'] = this.nomineeAddress;
    data['view_account_login_here'] = this.viewAccountLoginHere;
    data['login_signup'] = this.loginSignup;
    data['my_plans'] = this.myPlans;
    data['my_gifts'] = this.myGifts;
    data['my_e_passbook'] = this.myEPassbook;
    data['logout_confirmation'] = this.logoutConfirmation;
    data['no_plans'] = this.noPlans;
    data['search_other_plans'] = this.searchOtherPlans;
    data['select_plan_type'] = this.selectPlanType;
    data['select_plan_category'] = this.selectPlanCategory;
    data['type_group_code'] = this.typeGroupCode;
    data['plan_type'] = this.planType;
    data['more_details'] = this.moreDetails;
    data['group'] = this.group;
    data['due_amount'] = this.dueAmount;
    data['use_partial_payment'] = this.usePartialPayment;
    data['enter_value_below'] = this.enterValueBelow;
    data['enter_partial_amount'] = this.enterPartialAmount;
    data['enter_your_amount'] = this.enterYourAmount;
    data['inst_no'] = this.instNo;
    data['no_pay_dues'] = this.noPayDues;
    data['payment_details'] = this.paymentDetails;
    data['pending_amount'] = this.pendingAmount;
    data['summary'] = this.summary;
    data['passbook_number'] = this.passbookNumber;
    data['no_summary_data'] = this.noSummaryData;
    data['payment_success'] = this.paymentSuccess;
    data['payment_failure'] = this.paymentFailure;
    data['no_gifts'] = this.noGifts;
    data['plan_id'] = this.planId;
    data['gift_prize'] = this.giftPrize;
    data['received'] = this.received;
    data['pending'] = this.pending;
    data['other_plan_gifts'] = this.otherPlanGifts;
    data['no_gifts_for_this_plan'] = this.noGiftsForThisPlan;
    data['weight'] = this.weight;
    data['product_description'] = this.productDescription;
    data['similar_products'] = this.similarProducts;
    data['whatsapp_enquiry'] = this.whatsappEnquiry;
    data['enquiry_form'] = this.enquiryForm;
    data['product_details_query'] = this.productDetailsQuery;
    data['product_name'] = this.productName;
    data['product_code'] = this.productCode;
    data['thank_you'] = this.thankYou;
    data['feed_back'] = this.feedBack;
    data['copy_and_invite'] = this.copyAndInvite;
    data['ac_number'] = this.acNumber;
    data['transaction_id'] = this.transactionId;
    data['paid_at'] = this.paidAt;
    data['grand_total'] = this.grandTotal;
    data['closechit'] = this.closechit;
    data['write_your_review'] = this.writeYourReview;
    data['add_review'] = this.addReview;
    data['send_review'] = this.sendReview;
    data['gift_amount'] = this.giftAmount;
    data['basic_details'] = this.basicDetails;
    data['address1'] = this.address1;
    data['nominee_basic_details'] = this.nomineeBasicDetails;
    data['ifsc_number'] = this.ifscNumber;
    data['account_number'] = this.accountNumber;
    data['upi_id'] = this.upiId;
    data['id_proof_details'] = this.idProofDetails;
    data['aadhar'] = this.aadhar;
    data['pan'] = this.pan;
    data['contact_persons'] = this.contactPersons;
    data['otp_verification'] = this.otpVerification;
    data['enter_otp_sent_to'] = this.enterOtpSentTo;
    data['didnt_receive_otp'] = this.didntReceiveOtp;
    data['resend_otp'] = this.resendOtp;
    data['plan_count'] = this.planCount;
    data['no_customer'] = this.noCustomer;
    data['my_profile'] = this.myProfile;
    data['id_proof'] = this.idProof;
    data['filter'] = this.filter;
    data['pick_category'] = this.pickCategory;
    data['size'] = this.size;
    data['all_price'] = this.allPrice;
    data['low_to_high'] = this.lowToHigh;
    data['high_to_low'] = this.highToLow;
    data['send_otp'] = this.sendOtp;
    data['no_data_found'] = this.noDataFound;
    data['select_size'] = this.selectSize;
    data['sort_by'] = this.sortBy;
    data['shift'] = this.shift;
    data['my_customers'] = this.myCustomers;
    data['my_planner'] = this.myPlanner;
    data['today_target'] = this.todayTarget;
    data['total_target'] = this.totalTarget;
    data['this_month_target'] = this.thisMonthTarget;
    data['home'] = this.home;
    data['new_customer_form'] = this.newCustomerForm;
    data['my_follow_up'] = this.myFollowUp;
    return data;
  }
}
