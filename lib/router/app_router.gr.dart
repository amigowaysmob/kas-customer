// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i57;
import 'package:flutter/cupertino.dart' as _i63;
import 'package:flutter/material.dart' as _i60;
import 'package:hypersdkflutter/hypersdkflutter.dart' as _i64;
import 'package:kasnew/request_model/con_register_request_model.dart' as _i62;
import 'package:kasnew/request_model/pay_now_request_model.dart' as _i65;
import 'package:kasnew/response_model/gallery_model.dart' as _i61;
import 'package:kasnew/response_model/jus_payment_model.dart' as _i58;
import 'package:kasnew/response_model/view_profile_model.dart' as _i59;
import 'package:kasnew/screens/add_customer/gift_list_screen.dart' as _i16;
import 'package:kasnew/screens/add_customer/gift_screen.dart' as _i17;
import 'package:kasnew/screens/add_customer/payment_succes_screen.dart' as _i38;
import 'package:kasnew/screens/add_customer/receipt_screen.dart' as _i45;
import 'package:kasnew/screens/add_customer/stepper_form.dart' as _i49;
import 'package:kasnew/screens/bottom_navigation_screen.dart' as _i4;
import 'package:kasnew/screens/bottom_screens/homescreen/contact_person_screen.dart'
    as _i6;
import 'package:kasnew/screens/bottom_screens/homescreen/feedback_scree.dart'
    as _i13;
import 'package:kasnew/screens/bottom_screens/homescreen/home_screen.dart'
    as _i18;
import 'package:kasnew/screens/bottom_screens/homescreen/pay%20for%20others/pay_for_others_screen.dart'
    as _i34;
import 'package:kasnew/screens/bottom_screens/homescreen/pay%20for%20others/pay_others_list_screen.dart'
    as _i35;
import 'package:kasnew/screens/bottom_screens/homescreen/pay%20for%20others/pay_otp_screen.dart'
    as _i36;
import 'package:kasnew/screens/bottom_screens/trans_screen.dart' as _i54;
import 'package:kasnew/screens/exist_add_customer/exist_stepper.dart' as _i12;
import 'package:kasnew/screens/hdfc/payment/payment_page.dart' as _i37;
import 'package:kasnew/screens/login_screen/login_screen.dart' as _i22;
import 'package:kasnew/screens/lucky_draw/lucky_screen.dart' as _i23;
import 'package:kasnew/screens/lucky_draw/widgets/screens/lucky_terms_screen.dart'
    as _i24;
import 'package:kasnew/screens/mpin/change_mpin_screen.dart' as _i5;
import 'package:kasnew/screens/mpin/create_mpin_screen.dart' as _i8;
import 'package:kasnew/screens/mpin/reset_mpin_screen.dart' as _i47;
import 'package:kasnew/screens/mpin/verify_mpin_screen.dart' as _i55;
import 'package:kasnew/screens/otp_verify/otp_verify_page.dart' as _i30;
import 'package:kasnew/screens/paydues/pay_due_success_screen.dart' as _i32;
import 'package:kasnew/screens/paydues/pay_dues_screen.dart' as _i33;
import 'package:kasnew/screens/paydues/summary_screen.dart' as _i52;
import 'package:kasnew/screens/register_screen.dart' as _i46;
import 'package:kasnew/screens/sidebar/about_us_screen.dart' as _i1;
import 'package:kasnew/screens/sidebar/contact_us_screen.dart' as _i7;
import 'package:kasnew/screens/sidebar/data_delete_screen.dart' as _i9;
import 'package:kasnew/screens/sidebar/e_cat_screen.dart' as _i11;
import 'package:kasnew/screens/sidebar/ecat/ecat_detail_screen.dart' as _i10;
import 'package:kasnew/screens/sidebar/ecat/ecat_filter_screen.dart' as _i43;
import 'package:kasnew/screens/sidebar/ecat/product_zoom_widget.dart' as _i56;
import 'package:kasnew/screens/sidebar/edit_profile/basic_detail_edit_screen.dart'
    as _i3;
import 'package:kasnew/screens/sidebar/edit_profile/nominee_basic_edit_screen.dart'
    as _i27;
import 'package:kasnew/screens/sidebar/edit_profile/nominee_proof_edit_screen.dart'
    as _i28;
import 'package:kasnew/screens/sidebar/edit_profile/proof_edit_screen.dart'
    as _i44;
import 'package:kasnew/screens/sidebar/full_slider_screen.dart' as _i14;
import 'package:kasnew/screens/sidebar/gallery_screen.dart' as _i15;
import 'package:kasnew/screens/sidebar/invite_friends_screen.dart' as _i19;
import 'package:kasnew/screens/sidebar/ledger_detail_screen.dart' as _i20;
import 'package:kasnew/screens/sidebar/ledger_screen.dart' as _i21;
import 'package:kasnew/screens/sidebar/my_account_screen.dart' as _i2;
import 'package:kasnew/screens/sidebar/my_plans_screen.dart' as _i26;
import 'package:kasnew/screens/sidebar/notification_screen.dart' as _i29;
import 'package:kasnew/screens/sidebar/pass_book_screen.dart' as _i31;
import 'package:kasnew/screens/sidebar/plan_detail_screen.dart' as _i39;
import 'package:kasnew/screens/sidebar/plans/month_plan_screen.dart' as _i25;
import 'package:kasnew/screens/sidebar/plans/plan_type_screen.dart' as _i40;
import 'package:kasnew/screens/sidebar/plans/plans_screen.dart' as _i41;
import 'package:kasnew/screens/sidebar/privacy_screen.dart' as _i42;
import 'package:kasnew/screens/sidebar/store_detail_screen.dart' as _i50;
import 'package:kasnew/screens/sidebar/stores_screen.dart' as _i51;
import 'package:kasnew/screens/sidebar/terms_screen.dart' as _i53;
import 'package:kasnew/screens/splash_screen.dart' as _i48;

abstract class $AppRouter extends _i57.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i57.PageFactory> pagesMap = {
    AboutUsScreen.name: (routeData) {
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutUsScreen(),
      );
    },
    AccountScreen.name: (routeData) {
      final args = routeData.argsAs<AccountScreenArgs>(
          orElse: () => const AccountScreenArgs());
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AccountScreen(isMenu: args.isMenu),
      );
    },
    BasicDetailEditScreen.name: (routeData) {
      final args = routeData.argsAs<BasicDetailEditScreenArgs>();
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.BasicDetailEditScreen(userData: args.userData),
      );
    },
    BottomNavigationRoute.name: (routeData) {
      final args = routeData.argsAs<BottomNavigationRouteArgs>(
          orElse: () => const BottomNavigationRouteArgs());
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.BottomNavigationPage(key: args.key),
      );
    },
    ChangeMpinScreen.name: (routeData) {
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ChangeMpinScreen(),
      );
    },
    ContactPersonScreen.name: (routeData) {
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ContactPersonScreen(),
      );
    },
    ContactScreen.name: (routeData) {
      final args = routeData.argsAs<ContactScreenArgs>(
          orElse: () => const ContactScreenArgs());
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.ContactScreen(isLucky: args.isLucky),
      );
    },
    CreateMpinScreen.name: (routeData) {
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.CreateMpinScreen(),
      );
    },
    DeleteScreen.name: (routeData) {
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.DeleteScreen(),
      );
    },
    ECatDetailScreen.name: (routeData) {
      final args = routeData.argsAs<ECatDetailScreenArgs>();
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.ECatDetailScreen(id: args.id),
      );
    },
    ECatScreen.name: (routeData) {
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ECatScreen(),
      );
    },
    ExistStepperScreen.name: (routeData) {
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.ExistStepperScreen(),
      );
    },
    FeedbackScreen.name: (routeData) {
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.FeedbackScreen(),
      );
    },
    FullScreenSlider.name: (routeData) {
      final args = routeData.argsAs<FullScreenSliderArgs>();
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.FullScreenSlider(
          images: args.images,
          initialIndex: args.initialIndex,
          key: args.key,
        ),
      );
    },
    GalleryScreen.name: (routeData) {
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.GalleryScreen(),
      );
    },
    GiftListScreen.name: (routeData) {
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.GiftListScreen(),
      );
    },
    GiftScreen.name: (routeData) {
      final args = routeData.argsAs<GiftScreenArgs>(
          orElse: () => const GiftScreenArgs());
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.GiftScreen(
          orderId: args.orderId,
          isRequest: args.isRequest,
        ),
      );
    },
    HomeScreen.name: (routeData) {
      final args = routeData.argsAs<HomeScreenArgs>(
          orElse: () => const HomeScreenArgs());
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.HomeScreen(currentAddress: args.currentAddress),
      );
    },
    InviteScreen.name: (routeData) {
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.InviteScreen(),
      );
    },
    LedgerDetailScreen.name: (routeData) {
      final args = routeData.argsAs<LedgerDetailScreenArgs>();
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i20.LedgerDetailScreen(
          id: args.id,
          isChit: args.isChit,
        ),
      );
    },
    LedgerScreen.name: (routeData) {
      final args = routeData.argsAs<LedgerScreenArgs>(
          orElse: () => const LedgerScreenArgs());
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.LedgerScreen(
          isChit: args.isChit,
          isMenu: args.isMenu,
        ),
      );
    },
    LoginScreen.name: (routeData) {
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.LoginScreen(),
      );
    },
    LuckyScreen.name: (routeData) {
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.LuckyScreen(),
      );
    },
    LuckyTermsScreen.name: (routeData) {
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.LuckyTermsScreen(),
      );
    },
    MonthPlansScreen.name: (routeData) {
      final args = routeData.argsAs<MonthPlansScreenArgs>();
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.MonthPlansScreen(type: args.type),
      );
    },
    MyPlansScreen.name: (routeData) {
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.MyPlansScreen(),
      );
    },
    NomineeBasicEditScreen.name: (routeData) {
      final args = routeData.argsAs<NomineeBasicEditScreenArgs>();
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.NomineeBasicEditScreen(userData: args.userData),
      );
    },
    NomineeProofEditScreen.name: (routeData) {
      final args = routeData.argsAs<NomineeProofEditScreenArgs>(
          orElse: () => const NomineeProofEditScreenArgs());
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i28.NomineeProofEditScreen(userData: args.userData),
      );
    },
    NotificationScreen.name: (routeData) {
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i29.NotificationScreen(),
      );
    },
    OtpVerifyRoute.name: (routeData) {
      final args = routeData.argsAs<OtpVerifyRouteArgs>(
          orElse: () => const OtpVerifyRouteArgs());
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i30.OtpVerifyPage(
          key: args.key,
          mpinStatus: args.mpinStatus,
          conRegisterRequestModel: args.conRegisterRequestModel,
          data: args.data,
          forgotMpinOtp: args.forgotMpinOtp,
          userName: args.userName,
          isForgotMpin: args.isForgotMpin,
          loginOtp: args.loginOtp,
          registerOtp: args.registerOtp,
          phoneNumber: args.phoneNumber,
          loginPhoneNumber: args.loginPhoneNumber,
          isRegister: args.isRegister,
          isogin: args.isogin,
          userId: args.userId,
        ),
      );
    },
    PassBookScreen.name: (routeData) {
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i31.PassBookScreen(),
      );
    },
    PayDueSuccessScreen.name: (routeData) {
      final args = routeData.argsAs<PayDueSuccessScreenArgs>(
          orElse: () => const PayDueSuccessScreenArgs());
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.PayDueSuccessScreen(
          giftid: args.giftid,
          paymentStatusId: args.paymentStatusId,
        ),
      );
    },
    PayDuesScreen.name: (routeData) {
      final args = routeData.argsAs<PayDuesScreenArgs>(
          orElse: () => const PayDuesScreenArgs());
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i33.PayDuesScreen(
          id: args.id,
          customerId: args.customerId,
        ),
      );
    },
    PayForOthersScreen.name: (routeData) {
      final args = routeData.argsAs<PayForOthersScreenArgs>(
          orElse: () => const PayForOthersScreenArgs());
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i34.PayForOthersScreen(key: args.key),
      );
    },
    PayOthersListScreen.name: (routeData) {
      final args = routeData.argsAs<PayOthersListScreenArgs>(
          orElse: () => const PayOthersListScreenArgs());
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i35.PayOthersListScreen(phoneNumber: args.phoneNumber),
      );
    },
    PayOtpScreen.name: (routeData) {
      final args = routeData.argsAs<PayOtpScreenArgs>(
          orElse: () => const PayOtpScreenArgs());
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i36.PayOtpScreen(
          key: args.key,
          phoneNumber: args.phoneNumber,
          apiOtp: args.apiOtp,
        ),
      );
    },
    PaymentRouteScreen.name: (routeData) {
      final args = routeData.argsAs<PaymentRouteScreenArgs>();
      return _i57.AutoRoutePage<_i58.JusPayPaymentModel>(
        routeData: routeData,
        child: _i37.PaymentPageScreen(
          key: args.key,
          hyperSDK: args.hyperSDK,
          payload: args.payload,
        ),
      );
    },
    PaymentStatusScreen.name: (routeData) {
      final args = routeData.argsAs<PaymentStatusScreenArgs>(
          orElse: () => const PaymentStatusScreenArgs());
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i38.PaymentStatusScreen(
          giftid: args.giftid,
          paymentStatusId: args.paymentStatusId,
        ),
      );
    },
    PlanDetailScreen.name: (routeData) {
      final args = routeData.argsAs<PlanDetailScreenArgs>();
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i39.PlanDetailScreen(planId: args.planId),
      );
    },
    PlanTypesScreen.name: (routeData) {
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i40.PlanTypesScreen(),
      );
    },
    PlansScreen.name: (routeData) {
      final args = routeData.argsAs<PlansScreenArgs>();
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i41.PlansScreen(type: args.type),
      );
    },
    PrivacyScreen.name: (routeData) {
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i42.PrivacyScreen(),
      );
    },
    ProductScreen.name: (routeData) {
      final args = routeData.argsAs<ProductScreenArgs>(
          orElse: () => const ProductScreenArgs());
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i43.ProductScreen(
          key: args.key,
          categoryId: args.categoryId,
        ),
      );
    },
    ProofEditScreen.name: (routeData) {
      final args = routeData.argsAs<ProofEditScreenArgs>(
          orElse: () => const ProofEditScreenArgs());
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.ProofEditScreen(userData: args.userData),
      );
    },
    ReceiptScreen.name: (routeData) {
      final args = routeData.argsAs<ReceiptScreenArgs>(
          orElse: () => const ReceiptScreenArgs());
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i45.ReceiptScreen(giftid: args.giftid),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i46.RegisterPage(),
      );
    },
    ResetMpinScreen.name: (routeData) {
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i47.ResetMpinScreen(),
      );
    },
    SplashScreen.name: (routeData) {
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i48.SplashScreen(),
      );
    },
    StepperForm.name: (routeData) {
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i49.StepperForm(),
      );
    },
    StoreDetailScreen.name: (routeData) {
      final args = routeData.argsAs<StoreDetailScreenArgs>();
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i50.StoreDetailScreen(storeId: args.storeId),
      );
    },
    StoresScreen.name: (routeData) {
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i51.StoresScreen(),
      );
    },
    SummaryScreen.name: (routeData) {
      final args = routeData.argsAs<SummaryScreenArgs>();
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i52.SummaryScreen(payNowRequestModel: args.payNowRequestModel),
      );
    },
    TermsScreen.name: (routeData) {
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i53.TermsScreen(),
      );
    },
    TransScreen.name: (routeData) {
      final args = routeData.argsAs<TransScreenArgs>(
          orElse: () => const TransScreenArgs());
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i54.TransScreen(isMenu: args.isMenu),
      );
    },
    VerifyMpinScreen.name: (routeData) {
      final args = routeData.argsAs<VerifyMpinScreenArgs>(
          orElse: () => const VerifyMpinScreenArgs());
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i55.VerifyMpinScreen(phoneNumber: args.phoneNumber),
      );
    },
    ZoomProductScreen.name: (routeData) {
      final args = routeData.argsAs<ZoomProductScreenArgs>(
          orElse: () => const ZoomProductScreenArgs());
      return _i57.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i56.ZoomProductScreen(imgUrl: args.imgUrl),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutUsScreen]
class AboutUsScreen extends _i57.PageRouteInfo<void> {
  const AboutUsScreen({List<_i57.PageRouteInfo>? children})
      : super(
          AboutUsScreen.name,
          initialChildren: children,
        );

  static const String name = 'AboutUsScreen';

  static const _i57.PageInfo<void> page = _i57.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AccountScreen]
class AccountScreen extends _i57.PageRouteInfo<AccountScreenArgs> {
  AccountScreen({
    bool? isMenu,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          AccountScreen.name,
          args: AccountScreenArgs(isMenu: isMenu),
          initialChildren: children,
        );

  static const String name = 'AccountScreen';

  static const _i57.PageInfo<AccountScreenArgs> page =
      _i57.PageInfo<AccountScreenArgs>(name);
}

class AccountScreenArgs {
  const AccountScreenArgs({this.isMenu});

  final bool? isMenu;

  @override
  String toString() {
    return 'AccountScreenArgs{isMenu: $isMenu}';
  }
}

/// generated route for
/// [_i3.BasicDetailEditScreen]
class BasicDetailEditScreen
    extends _i57.PageRouteInfo<BasicDetailEditScreenArgs> {
  BasicDetailEditScreen({
    required _i59.UserData? userData,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          BasicDetailEditScreen.name,
          args: BasicDetailEditScreenArgs(userData: userData),
          initialChildren: children,
        );

  static const String name = 'BasicDetailEditScreen';

  static const _i57.PageInfo<BasicDetailEditScreenArgs> page =
      _i57.PageInfo<BasicDetailEditScreenArgs>(name);
}

class BasicDetailEditScreenArgs {
  const BasicDetailEditScreenArgs({required this.userData});

  final _i59.UserData? userData;

  @override
  String toString() {
    return 'BasicDetailEditScreenArgs{userData: $userData}';
  }
}

/// generated route for
/// [_i4.BottomNavigationPage]
class BottomNavigationRoute
    extends _i57.PageRouteInfo<BottomNavigationRouteArgs> {
  BottomNavigationRoute({
    _i60.Key? key,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          BottomNavigationRoute.name,
          args: BottomNavigationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'BottomNavigationRoute';

  static const _i57.PageInfo<BottomNavigationRouteArgs> page =
      _i57.PageInfo<BottomNavigationRouteArgs>(name);
}

class BottomNavigationRouteArgs {
  const BottomNavigationRouteArgs({this.key});

  final _i60.Key? key;

  @override
  String toString() {
    return 'BottomNavigationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.ChangeMpinScreen]
class ChangeMpinScreen extends _i57.PageRouteInfo<void> {
  const ChangeMpinScreen({List<_i57.PageRouteInfo>? children})
      : super(
          ChangeMpinScreen.name,
          initialChildren: children,
        );

  static const String name = 'ChangeMpinScreen';

  static const _i57.PageInfo<void> page = _i57.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ContactPersonScreen]
class ContactPersonScreen extends _i57.PageRouteInfo<void> {
  const ContactPersonScreen({List<_i57.PageRouteInfo>? children})
      : super(
          ContactPersonScreen.name,
          initialChildren: children,
        );

  static const String name = 'ContactPersonScreen';

  static const _i57.PageInfo<void> page = _i57.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ContactScreen]
class ContactScreen extends _i57.PageRouteInfo<ContactScreenArgs> {
  ContactScreen({
    bool? isLucky,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          ContactScreen.name,
          args: ContactScreenArgs(isLucky: isLucky),
          initialChildren: children,
        );

  static const String name = 'ContactScreen';

  static const _i57.PageInfo<ContactScreenArgs> page =
      _i57.PageInfo<ContactScreenArgs>(name);
}

class ContactScreenArgs {
  const ContactScreenArgs({this.isLucky});

  final bool? isLucky;

  @override
  String toString() {
    return 'ContactScreenArgs{isLucky: $isLucky}';
  }
}

/// generated route for
/// [_i8.CreateMpinScreen]
class CreateMpinScreen extends _i57.PageRouteInfo<void> {
  const CreateMpinScreen({List<_i57.PageRouteInfo>? children})
      : super(
          CreateMpinScreen.name,
          initialChildren: children,
        );

  static const String name = 'CreateMpinScreen';

  static const _i57.PageInfo<void> page = _i57.PageInfo<void>(name);
}

/// generated route for
/// [_i9.DeleteScreen]
class DeleteScreen extends _i57.PageRouteInfo<void> {
  const DeleteScreen({List<_i57.PageRouteInfo>? children})
      : super(
          DeleteScreen.name,
          initialChildren: children,
        );

  static const String name = 'DeleteScreen';

  static const _i57.PageInfo<void> page = _i57.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ECatDetailScreen]
class ECatDetailScreen extends _i57.PageRouteInfo<ECatDetailScreenArgs> {
  ECatDetailScreen({
    required String? id,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          ECatDetailScreen.name,
          args: ECatDetailScreenArgs(id: id),
          initialChildren: children,
        );

  static const String name = 'ECatDetailScreen';

  static const _i57.PageInfo<ECatDetailScreenArgs> page =
      _i57.PageInfo<ECatDetailScreenArgs>(name);
}

class ECatDetailScreenArgs {
  const ECatDetailScreenArgs({required this.id});

  final String? id;

  @override
  String toString() {
    return 'ECatDetailScreenArgs{id: $id}';
  }
}

/// generated route for
/// [_i11.ECatScreen]
class ECatScreen extends _i57.PageRouteInfo<void> {
  const ECatScreen({List<_i57.PageRouteInfo>? children})
      : super(
          ECatScreen.name,
          initialChildren: children,
        );

  static const String name = 'ECatScreen';

  static const _i57.PageInfo<void> page = _i57.PageInfo<void>(name);
}

/// generated route for
/// [_i12.ExistStepperScreen]
class ExistStepperScreen extends _i57.PageRouteInfo<void> {
  const ExistStepperScreen({List<_i57.PageRouteInfo>? children})
      : super(
          ExistStepperScreen.name,
          initialChildren: children,
        );

  static const String name = 'ExistStepperScreen';

  static const _i57.PageInfo<void> page = _i57.PageInfo<void>(name);
}

/// generated route for
/// [_i13.FeedbackScreen]
class FeedbackScreen extends _i57.PageRouteInfo<void> {
  const FeedbackScreen({List<_i57.PageRouteInfo>? children})
      : super(
          FeedbackScreen.name,
          initialChildren: children,
        );

  static const String name = 'FeedbackScreen';

  static const _i57.PageInfo<void> page = _i57.PageInfo<void>(name);
}

/// generated route for
/// [_i14.FullScreenSlider]
class FullScreenSlider extends _i57.PageRouteInfo<FullScreenSliderArgs> {
  FullScreenSlider({
    required List<_i61.GalleryData>? images,
    required int initialIndex,
    _i60.Key? key,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          FullScreenSlider.name,
          args: FullScreenSliderArgs(
            images: images,
            initialIndex: initialIndex,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'FullScreenSlider';

  static const _i57.PageInfo<FullScreenSliderArgs> page =
      _i57.PageInfo<FullScreenSliderArgs>(name);
}

class FullScreenSliderArgs {
  const FullScreenSliderArgs({
    required this.images,
    required this.initialIndex,
    this.key,
  });

  final List<_i61.GalleryData>? images;

  final int initialIndex;

  final _i60.Key? key;

  @override
  String toString() {
    return 'FullScreenSliderArgs{images: $images, initialIndex: $initialIndex, key: $key}';
  }
}

/// generated route for
/// [_i15.GalleryScreen]
class GalleryScreen extends _i57.PageRouteInfo<void> {
  const GalleryScreen({List<_i57.PageRouteInfo>? children})
      : super(
          GalleryScreen.name,
          initialChildren: children,
        );

  static const String name = 'GalleryScreen';

  static const _i57.PageInfo<void> page = _i57.PageInfo<void>(name);
}

/// generated route for
/// [_i16.GiftListScreen]
class GiftListScreen extends _i57.PageRouteInfo<void> {
  const GiftListScreen({List<_i57.PageRouteInfo>? children})
      : super(
          GiftListScreen.name,
          initialChildren: children,
        );

  static const String name = 'GiftListScreen';

  static const _i57.PageInfo<void> page = _i57.PageInfo<void>(name);
}

/// generated route for
/// [_i17.GiftScreen]
class GiftScreen extends _i57.PageRouteInfo<GiftScreenArgs> {
  GiftScreen({
    String? orderId,
    bool? isRequest,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          GiftScreen.name,
          args: GiftScreenArgs(
            orderId: orderId,
            isRequest: isRequest,
          ),
          initialChildren: children,
        );

  static const String name = 'GiftScreen';

  static const _i57.PageInfo<GiftScreenArgs> page =
      _i57.PageInfo<GiftScreenArgs>(name);
}

class GiftScreenArgs {
  const GiftScreenArgs({
    this.orderId,
    this.isRequest,
  });

  final String? orderId;

  final bool? isRequest;

  @override
  String toString() {
    return 'GiftScreenArgs{orderId: $orderId, isRequest: $isRequest}';
  }
}

/// generated route for
/// [_i18.HomeScreen]
class HomeScreen extends _i57.PageRouteInfo<HomeScreenArgs> {
  HomeScreen({
    String? currentAddress,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          HomeScreen.name,
          args: HomeScreenArgs(currentAddress: currentAddress),
          initialChildren: children,
        );

  static const String name = 'HomeScreen';

  static const _i57.PageInfo<HomeScreenArgs> page =
      _i57.PageInfo<HomeScreenArgs>(name);
}

class HomeScreenArgs {
  const HomeScreenArgs({this.currentAddress});

  final String? currentAddress;

  @override
  String toString() {
    return 'HomeScreenArgs{currentAddress: $currentAddress}';
  }
}

/// generated route for
/// [_i19.InviteScreen]
class InviteScreen extends _i57.PageRouteInfo<void> {
  const InviteScreen({List<_i57.PageRouteInfo>? children})
      : super(
          InviteScreen.name,
          initialChildren: children,
        );

  static const String name = 'InviteScreen';

  static const _i57.PageInfo<void> page = _i57.PageInfo<void>(name);
}

/// generated route for
/// [_i20.LedgerDetailScreen]
class LedgerDetailScreen extends _i57.PageRouteInfo<LedgerDetailScreenArgs> {
  LedgerDetailScreen({
    required String? id,
    bool? isChit,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          LedgerDetailScreen.name,
          args: LedgerDetailScreenArgs(
            id: id,
            isChit: isChit,
          ),
          initialChildren: children,
        );

  static const String name = 'LedgerDetailScreen';

  static const _i57.PageInfo<LedgerDetailScreenArgs> page =
      _i57.PageInfo<LedgerDetailScreenArgs>(name);
}

class LedgerDetailScreenArgs {
  const LedgerDetailScreenArgs({
    required this.id,
    this.isChit,
  });

  final String? id;

  final bool? isChit;

  @override
  String toString() {
    return 'LedgerDetailScreenArgs{id: $id, isChit: $isChit}';
  }
}

/// generated route for
/// [_i21.LedgerScreen]
class LedgerScreen extends _i57.PageRouteInfo<LedgerScreenArgs> {
  LedgerScreen({
    bool? isChit,
    bool? isMenu,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          LedgerScreen.name,
          args: LedgerScreenArgs(
            isChit: isChit,
            isMenu: isMenu,
          ),
          initialChildren: children,
        );

  static const String name = 'LedgerScreen';

  static const _i57.PageInfo<LedgerScreenArgs> page =
      _i57.PageInfo<LedgerScreenArgs>(name);
}

class LedgerScreenArgs {
  const LedgerScreenArgs({
    this.isChit,
    this.isMenu,
  });

  final bool? isChit;

  final bool? isMenu;

  @override
  String toString() {
    return 'LedgerScreenArgs{isChit: $isChit, isMenu: $isMenu}';
  }
}

/// generated route for
/// [_i22.LoginScreen]
class LoginScreen extends _i57.PageRouteInfo<void> {
  const LoginScreen({List<_i57.PageRouteInfo>? children})
      : super(
          LoginScreen.name,
          initialChildren: children,
        );

  static const String name = 'LoginScreen';

  static const _i57.PageInfo<void> page = _i57.PageInfo<void>(name);
}

/// generated route for
/// [_i23.LuckyScreen]
class LuckyScreen extends _i57.PageRouteInfo<void> {
  const LuckyScreen({List<_i57.PageRouteInfo>? children})
      : super(
          LuckyScreen.name,
          initialChildren: children,
        );

  static const String name = 'LuckyScreen';

  static const _i57.PageInfo<void> page = _i57.PageInfo<void>(name);
}

/// generated route for
/// [_i24.LuckyTermsScreen]
class LuckyTermsScreen extends _i57.PageRouteInfo<void> {
  const LuckyTermsScreen({List<_i57.PageRouteInfo>? children})
      : super(
          LuckyTermsScreen.name,
          initialChildren: children,
        );

  static const String name = 'LuckyTermsScreen';

  static const _i57.PageInfo<void> page = _i57.PageInfo<void>(name);
}

/// generated route for
/// [_i25.MonthPlansScreen]
class MonthPlansScreen extends _i57.PageRouteInfo<MonthPlansScreenArgs> {
  MonthPlansScreen({
    required String? type,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          MonthPlansScreen.name,
          args: MonthPlansScreenArgs(type: type),
          initialChildren: children,
        );

  static const String name = 'MonthPlansScreen';

  static const _i57.PageInfo<MonthPlansScreenArgs> page =
      _i57.PageInfo<MonthPlansScreenArgs>(name);
}

class MonthPlansScreenArgs {
  const MonthPlansScreenArgs({required this.type});

  final String? type;

  @override
  String toString() {
    return 'MonthPlansScreenArgs{type: $type}';
  }
}

/// generated route for
/// [_i26.MyPlansScreen]
class MyPlansScreen extends _i57.PageRouteInfo<void> {
  const MyPlansScreen({List<_i57.PageRouteInfo>? children})
      : super(
          MyPlansScreen.name,
          initialChildren: children,
        );

  static const String name = 'MyPlansScreen';

  static const _i57.PageInfo<void> page = _i57.PageInfo<void>(name);
}

/// generated route for
/// [_i27.NomineeBasicEditScreen]
class NomineeBasicEditScreen
    extends _i57.PageRouteInfo<NomineeBasicEditScreenArgs> {
  NomineeBasicEditScreen({
    required _i59.UserData? userData,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          NomineeBasicEditScreen.name,
          args: NomineeBasicEditScreenArgs(userData: userData),
          initialChildren: children,
        );

  static const String name = 'NomineeBasicEditScreen';

  static const _i57.PageInfo<NomineeBasicEditScreenArgs> page =
      _i57.PageInfo<NomineeBasicEditScreenArgs>(name);
}

class NomineeBasicEditScreenArgs {
  const NomineeBasicEditScreenArgs({required this.userData});

  final _i59.UserData? userData;

  @override
  String toString() {
    return 'NomineeBasicEditScreenArgs{userData: $userData}';
  }
}

/// generated route for
/// [_i28.NomineeProofEditScreen]
class NomineeProofEditScreen
    extends _i57.PageRouteInfo<NomineeProofEditScreenArgs> {
  NomineeProofEditScreen({
    _i59.UserData? userData,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          NomineeProofEditScreen.name,
          args: NomineeProofEditScreenArgs(userData: userData),
          initialChildren: children,
        );

  static const String name = 'NomineeProofEditScreen';

  static const _i57.PageInfo<NomineeProofEditScreenArgs> page =
      _i57.PageInfo<NomineeProofEditScreenArgs>(name);
}

class NomineeProofEditScreenArgs {
  const NomineeProofEditScreenArgs({this.userData});

  final _i59.UserData? userData;

  @override
  String toString() {
    return 'NomineeProofEditScreenArgs{userData: $userData}';
  }
}

/// generated route for
/// [_i29.NotificationScreen]
class NotificationScreen extends _i57.PageRouteInfo<void> {
  const NotificationScreen({List<_i57.PageRouteInfo>? children})
      : super(
          NotificationScreen.name,
          initialChildren: children,
        );

  static const String name = 'NotificationScreen';

  static const _i57.PageInfo<void> page = _i57.PageInfo<void>(name);
}

/// generated route for
/// [_i30.OtpVerifyPage]
class OtpVerifyRoute extends _i57.PageRouteInfo<OtpVerifyRouteArgs> {
  OtpVerifyRoute({
    _i60.Key? key,
    String? mpinStatus,
    _i62.ConRegisterRequestModel? conRegisterRequestModel,
    dynamic data,
    String? forgotMpinOtp,
    String? userName,
    bool? isForgotMpin = false,
    String? loginOtp,
    String? registerOtp,
    String? phoneNumber,
    String? loginPhoneNumber,
    bool? isRegister,
    bool? isogin,
    String? userId,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          OtpVerifyRoute.name,
          args: OtpVerifyRouteArgs(
            key: key,
            mpinStatus: mpinStatus,
            conRegisterRequestModel: conRegisterRequestModel,
            data: data,
            forgotMpinOtp: forgotMpinOtp,
            userName: userName,
            isForgotMpin: isForgotMpin,
            loginOtp: loginOtp,
            registerOtp: registerOtp,
            phoneNumber: phoneNumber,
            loginPhoneNumber: loginPhoneNumber,
            isRegister: isRegister,
            isogin: isogin,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpVerifyRoute';

  static const _i57.PageInfo<OtpVerifyRouteArgs> page =
      _i57.PageInfo<OtpVerifyRouteArgs>(name);
}

class OtpVerifyRouteArgs {
  const OtpVerifyRouteArgs({
    this.key,
    this.mpinStatus,
    this.conRegisterRequestModel,
    this.data,
    this.forgotMpinOtp,
    this.userName,
    this.isForgotMpin = false,
    this.loginOtp,
    this.registerOtp,
    this.phoneNumber,
    this.loginPhoneNumber,
    this.isRegister,
    this.isogin,
    this.userId,
  });

  final _i60.Key? key;

  final String? mpinStatus;

  final _i62.ConRegisterRequestModel? conRegisterRequestModel;

  final dynamic data;

  final String? forgotMpinOtp;

  final String? userName;

  final bool? isForgotMpin;

  final String? loginOtp;

  final String? registerOtp;

  final String? phoneNumber;

  final String? loginPhoneNumber;

  final bool? isRegister;

  final bool? isogin;

  final String? userId;

  @override
  String toString() {
    return 'OtpVerifyRouteArgs{key: $key, mpinStatus: $mpinStatus, conRegisterRequestModel: $conRegisterRequestModel, data: $data, forgotMpinOtp: $forgotMpinOtp, userName: $userName, isForgotMpin: $isForgotMpin, loginOtp: $loginOtp, registerOtp: $registerOtp, phoneNumber: $phoneNumber, loginPhoneNumber: $loginPhoneNumber, isRegister: $isRegister, isogin: $isogin, userId: $userId}';
  }
}

/// generated route for
/// [_i31.PassBookScreen]
class PassBookScreen extends _i57.PageRouteInfo<void> {
  const PassBookScreen({List<_i57.PageRouteInfo>? children})
      : super(
          PassBookScreen.name,
          initialChildren: children,
        );

  static const String name = 'PassBookScreen';

  static const _i57.PageInfo<void> page = _i57.PageInfo<void>(name);
}

/// generated route for
/// [_i32.PayDueSuccessScreen]
class PayDueSuccessScreen extends _i57.PageRouteInfo<PayDueSuccessScreenArgs> {
  PayDueSuccessScreen({
    String? giftid,
    String? paymentStatusId,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          PayDueSuccessScreen.name,
          args: PayDueSuccessScreenArgs(
            giftid: giftid,
            paymentStatusId: paymentStatusId,
          ),
          initialChildren: children,
        );

  static const String name = 'PayDueSuccessScreen';

  static const _i57.PageInfo<PayDueSuccessScreenArgs> page =
      _i57.PageInfo<PayDueSuccessScreenArgs>(name);
}

class PayDueSuccessScreenArgs {
  const PayDueSuccessScreenArgs({
    this.giftid,
    this.paymentStatusId,
  });

  final String? giftid;

  final String? paymentStatusId;

  @override
  String toString() {
    return 'PayDueSuccessScreenArgs{giftid: $giftid, paymentStatusId: $paymentStatusId}';
  }
}

/// generated route for
/// [_i33.PayDuesScreen]
class PayDuesScreen extends _i57.PageRouteInfo<PayDuesScreenArgs> {
  PayDuesScreen({
    String? id,
    String? customerId,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          PayDuesScreen.name,
          args: PayDuesScreenArgs(
            id: id,
            customerId: customerId,
          ),
          initialChildren: children,
        );

  static const String name = 'PayDuesScreen';

  static const _i57.PageInfo<PayDuesScreenArgs> page =
      _i57.PageInfo<PayDuesScreenArgs>(name);
}

class PayDuesScreenArgs {
  const PayDuesScreenArgs({
    this.id,
    this.customerId,
  });

  final String? id;

  final String? customerId;

  @override
  String toString() {
    return 'PayDuesScreenArgs{id: $id, customerId: $customerId}';
  }
}

/// generated route for
/// [_i34.PayForOthersScreen]
class PayForOthersScreen extends _i57.PageRouteInfo<PayForOthersScreenArgs> {
  PayForOthersScreen({
    _i60.Key? key,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          PayForOthersScreen.name,
          args: PayForOthersScreenArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'PayForOthersScreen';

  static const _i57.PageInfo<PayForOthersScreenArgs> page =
      _i57.PageInfo<PayForOthersScreenArgs>(name);
}

class PayForOthersScreenArgs {
  const PayForOthersScreenArgs({this.key});

  final _i60.Key? key;

  @override
  String toString() {
    return 'PayForOthersScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i35.PayOthersListScreen]
class PayOthersListScreen extends _i57.PageRouteInfo<PayOthersListScreenArgs> {
  PayOthersListScreen({
    String? phoneNumber,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          PayOthersListScreen.name,
          args: PayOthersListScreenArgs(phoneNumber: phoneNumber),
          initialChildren: children,
        );

  static const String name = 'PayOthersListScreen';

  static const _i57.PageInfo<PayOthersListScreenArgs> page =
      _i57.PageInfo<PayOthersListScreenArgs>(name);
}

class PayOthersListScreenArgs {
  const PayOthersListScreenArgs({this.phoneNumber});

  final String? phoneNumber;

  @override
  String toString() {
    return 'PayOthersListScreenArgs{phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i36.PayOtpScreen]
class PayOtpScreen extends _i57.PageRouteInfo<PayOtpScreenArgs> {
  PayOtpScreen({
    _i60.Key? key,
    String? phoneNumber,
    String? apiOtp,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          PayOtpScreen.name,
          args: PayOtpScreenArgs(
            key: key,
            phoneNumber: phoneNumber,
            apiOtp: apiOtp,
          ),
          initialChildren: children,
        );

  static const String name = 'PayOtpScreen';

  static const _i57.PageInfo<PayOtpScreenArgs> page =
      _i57.PageInfo<PayOtpScreenArgs>(name);
}

class PayOtpScreenArgs {
  const PayOtpScreenArgs({
    this.key,
    this.phoneNumber,
    this.apiOtp,
  });

  final _i60.Key? key;

  final String? phoneNumber;

  final String? apiOtp;

  @override
  String toString() {
    return 'PayOtpScreenArgs{key: $key, phoneNumber: $phoneNumber, apiOtp: $apiOtp}';
  }
}

/// generated route for
/// [_i37.PaymentPageScreen]
class PaymentRouteScreen extends _i57.PageRouteInfo<PaymentRouteScreenArgs> {
  PaymentRouteScreen({
    _i63.Key? key,
    required _i64.HyperSDK hyperSDK,
    required dynamic payload,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          PaymentRouteScreen.name,
          args: PaymentRouteScreenArgs(
            key: key,
            hyperSDK: hyperSDK,
            payload: payload,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentRouteScreen';

  static const _i57.PageInfo<PaymentRouteScreenArgs> page =
      _i57.PageInfo<PaymentRouteScreenArgs>(name);
}

class PaymentRouteScreenArgs {
  const PaymentRouteScreenArgs({
    this.key,
    required this.hyperSDK,
    required this.payload,
  });

  final _i63.Key? key;

  final _i64.HyperSDK hyperSDK;

  final dynamic payload;

  @override
  String toString() {
    return 'PaymentRouteScreenArgs{key: $key, hyperSDK: $hyperSDK, payload: $payload}';
  }
}

/// generated route for
/// [_i38.PaymentStatusScreen]
class PaymentStatusScreen extends _i57.PageRouteInfo<PaymentStatusScreenArgs> {
  PaymentStatusScreen({
    String? giftid,
    String? paymentStatusId,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          PaymentStatusScreen.name,
          args: PaymentStatusScreenArgs(
            giftid: giftid,
            paymentStatusId: paymentStatusId,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentStatusScreen';

  static const _i57.PageInfo<PaymentStatusScreenArgs> page =
      _i57.PageInfo<PaymentStatusScreenArgs>(name);
}

class PaymentStatusScreenArgs {
  const PaymentStatusScreenArgs({
    this.giftid,
    this.paymentStatusId,
  });

  final String? giftid;

  final String? paymentStatusId;

  @override
  String toString() {
    return 'PaymentStatusScreenArgs{giftid: $giftid, paymentStatusId: $paymentStatusId}';
  }
}

/// generated route for
/// [_i39.PlanDetailScreen]
class PlanDetailScreen extends _i57.PageRouteInfo<PlanDetailScreenArgs> {
  PlanDetailScreen({
    required String? planId,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          PlanDetailScreen.name,
          args: PlanDetailScreenArgs(planId: planId),
          initialChildren: children,
        );

  static const String name = 'PlanDetailScreen';

  static const _i57.PageInfo<PlanDetailScreenArgs> page =
      _i57.PageInfo<PlanDetailScreenArgs>(name);
}

class PlanDetailScreenArgs {
  const PlanDetailScreenArgs({required this.planId});

  final String? planId;

  @override
  String toString() {
    return 'PlanDetailScreenArgs{planId: $planId}';
  }
}

/// generated route for
/// [_i40.PlanTypesScreen]
class PlanTypesScreen extends _i57.PageRouteInfo<void> {
  const PlanTypesScreen({List<_i57.PageRouteInfo>? children})
      : super(
          PlanTypesScreen.name,
          initialChildren: children,
        );

  static const String name = 'PlanTypesScreen';

  static const _i57.PageInfo<void> page = _i57.PageInfo<void>(name);
}

/// generated route for
/// [_i41.PlansScreen]
class PlansScreen extends _i57.PageRouteInfo<PlansScreenArgs> {
  PlansScreen({
    required String? type,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          PlansScreen.name,
          args: PlansScreenArgs(type: type),
          initialChildren: children,
        );

  static const String name = 'PlansScreen';

  static const _i57.PageInfo<PlansScreenArgs> page =
      _i57.PageInfo<PlansScreenArgs>(name);
}

class PlansScreenArgs {
  const PlansScreenArgs({required this.type});

  final String? type;

  @override
  String toString() {
    return 'PlansScreenArgs{type: $type}';
  }
}

/// generated route for
/// [_i42.PrivacyScreen]
class PrivacyScreen extends _i57.PageRouteInfo<void> {
  const PrivacyScreen({List<_i57.PageRouteInfo>? children})
      : super(
          PrivacyScreen.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyScreen';

  static const _i57.PageInfo<void> page = _i57.PageInfo<void>(name);
}

/// generated route for
/// [_i43.ProductScreen]
class ProductScreen extends _i57.PageRouteInfo<ProductScreenArgs> {
  ProductScreen({
    _i60.Key? key,
    String? categoryId,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          ProductScreen.name,
          args: ProductScreenArgs(
            key: key,
            categoryId: categoryId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductScreen';

  static const _i57.PageInfo<ProductScreenArgs> page =
      _i57.PageInfo<ProductScreenArgs>(name);
}

class ProductScreenArgs {
  const ProductScreenArgs({
    this.key,
    this.categoryId,
  });

  final _i60.Key? key;

  final String? categoryId;

  @override
  String toString() {
    return 'ProductScreenArgs{key: $key, categoryId: $categoryId}';
  }
}

/// generated route for
/// [_i44.ProofEditScreen]
class ProofEditScreen extends _i57.PageRouteInfo<ProofEditScreenArgs> {
  ProofEditScreen({
    _i59.UserData? userData,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          ProofEditScreen.name,
          args: ProofEditScreenArgs(userData: userData),
          initialChildren: children,
        );

  static const String name = 'ProofEditScreen';

  static const _i57.PageInfo<ProofEditScreenArgs> page =
      _i57.PageInfo<ProofEditScreenArgs>(name);
}

class ProofEditScreenArgs {
  const ProofEditScreenArgs({this.userData});

  final _i59.UserData? userData;

  @override
  String toString() {
    return 'ProofEditScreenArgs{userData: $userData}';
  }
}

/// generated route for
/// [_i45.ReceiptScreen]
class ReceiptScreen extends _i57.PageRouteInfo<ReceiptScreenArgs> {
  ReceiptScreen({
    String? giftid,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          ReceiptScreen.name,
          args: ReceiptScreenArgs(giftid: giftid),
          initialChildren: children,
        );

  static const String name = 'ReceiptScreen';

  static const _i57.PageInfo<ReceiptScreenArgs> page =
      _i57.PageInfo<ReceiptScreenArgs>(name);
}

class ReceiptScreenArgs {
  const ReceiptScreenArgs({this.giftid});

  final String? giftid;

  @override
  String toString() {
    return 'ReceiptScreenArgs{giftid: $giftid}';
  }
}

/// generated route for
/// [_i46.RegisterPage]
class RegisterRoute extends _i57.PageRouteInfo<void> {
  const RegisterRoute({List<_i57.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i57.PageInfo<void> page = _i57.PageInfo<void>(name);
}

/// generated route for
/// [_i47.ResetMpinScreen]
class ResetMpinScreen extends _i57.PageRouteInfo<void> {
  const ResetMpinScreen({List<_i57.PageRouteInfo>? children})
      : super(
          ResetMpinScreen.name,
          initialChildren: children,
        );

  static const String name = 'ResetMpinScreen';

  static const _i57.PageInfo<void> page = _i57.PageInfo<void>(name);
}

/// generated route for
/// [_i48.SplashScreen]
class SplashScreen extends _i57.PageRouteInfo<void> {
  const SplashScreen({List<_i57.PageRouteInfo>? children})
      : super(
          SplashScreen.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreen';

  static const _i57.PageInfo<void> page = _i57.PageInfo<void>(name);
}

/// generated route for
/// [_i49.StepperForm]
class StepperForm extends _i57.PageRouteInfo<void> {
  const StepperForm({List<_i57.PageRouteInfo>? children})
      : super(
          StepperForm.name,
          initialChildren: children,
        );

  static const String name = 'StepperForm';

  static const _i57.PageInfo<void> page = _i57.PageInfo<void>(name);
}

/// generated route for
/// [_i50.StoreDetailScreen]
class StoreDetailScreen extends _i57.PageRouteInfo<StoreDetailScreenArgs> {
  StoreDetailScreen({
    required String? storeId,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          StoreDetailScreen.name,
          args: StoreDetailScreenArgs(storeId: storeId),
          initialChildren: children,
        );

  static const String name = 'StoreDetailScreen';

  static const _i57.PageInfo<StoreDetailScreenArgs> page =
      _i57.PageInfo<StoreDetailScreenArgs>(name);
}

class StoreDetailScreenArgs {
  const StoreDetailScreenArgs({required this.storeId});

  final String? storeId;

  @override
  String toString() {
    return 'StoreDetailScreenArgs{storeId: $storeId}';
  }
}

/// generated route for
/// [_i51.StoresScreen]
class StoresScreen extends _i57.PageRouteInfo<void> {
  const StoresScreen({List<_i57.PageRouteInfo>? children})
      : super(
          StoresScreen.name,
          initialChildren: children,
        );

  static const String name = 'StoresScreen';

  static const _i57.PageInfo<void> page = _i57.PageInfo<void>(name);
}

/// generated route for
/// [_i52.SummaryScreen]
class SummaryScreen extends _i57.PageRouteInfo<SummaryScreenArgs> {
  SummaryScreen({
    required _i65.PayNowRequestModel payNowRequestModel,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          SummaryScreen.name,
          args: SummaryScreenArgs(payNowRequestModel: payNowRequestModel),
          initialChildren: children,
        );

  static const String name = 'SummaryScreen';

  static const _i57.PageInfo<SummaryScreenArgs> page =
      _i57.PageInfo<SummaryScreenArgs>(name);
}

class SummaryScreenArgs {
  const SummaryScreenArgs({required this.payNowRequestModel});

  final _i65.PayNowRequestModel payNowRequestModel;

  @override
  String toString() {
    return 'SummaryScreenArgs{payNowRequestModel: $payNowRequestModel}';
  }
}

/// generated route for
/// [_i53.TermsScreen]
class TermsScreen extends _i57.PageRouteInfo<void> {
  const TermsScreen({List<_i57.PageRouteInfo>? children})
      : super(
          TermsScreen.name,
          initialChildren: children,
        );

  static const String name = 'TermsScreen';

  static const _i57.PageInfo<void> page = _i57.PageInfo<void>(name);
}

/// generated route for
/// [_i54.TransScreen]
class TransScreen extends _i57.PageRouteInfo<TransScreenArgs> {
  TransScreen({
    bool? isMenu,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          TransScreen.name,
          args: TransScreenArgs(isMenu: isMenu),
          initialChildren: children,
        );

  static const String name = 'TransScreen';

  static const _i57.PageInfo<TransScreenArgs> page =
      _i57.PageInfo<TransScreenArgs>(name);
}

class TransScreenArgs {
  const TransScreenArgs({this.isMenu});

  final bool? isMenu;

  @override
  String toString() {
    return 'TransScreenArgs{isMenu: $isMenu}';
  }
}

/// generated route for
/// [_i55.VerifyMpinScreen]
class VerifyMpinScreen extends _i57.PageRouteInfo<VerifyMpinScreenArgs> {
  VerifyMpinScreen({
    String? phoneNumber,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          VerifyMpinScreen.name,
          args: VerifyMpinScreenArgs(phoneNumber: phoneNumber),
          initialChildren: children,
        );

  static const String name = 'VerifyMpinScreen';

  static const _i57.PageInfo<VerifyMpinScreenArgs> page =
      _i57.PageInfo<VerifyMpinScreenArgs>(name);
}

class VerifyMpinScreenArgs {
  const VerifyMpinScreenArgs({this.phoneNumber});

  final String? phoneNumber;

  @override
  String toString() {
    return 'VerifyMpinScreenArgs{phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i56.ZoomProductScreen]
class ZoomProductScreen extends _i57.PageRouteInfo<ZoomProductScreenArgs> {
  ZoomProductScreen({
    String? imgUrl,
    List<_i57.PageRouteInfo>? children,
  }) : super(
          ZoomProductScreen.name,
          args: ZoomProductScreenArgs(imgUrl: imgUrl),
          initialChildren: children,
        );

  static const String name = 'ZoomProductScreen';

  static const _i57.PageInfo<ZoomProductScreenArgs> page =
      _i57.PageInfo<ZoomProductScreenArgs>(name);
}

class ZoomProductScreenArgs {
  const ZoomProductScreenArgs({this.imgUrl});

  final String? imgUrl;

  @override
  String toString() {
    return 'ZoomProductScreenArgs{imgUrl: $imgUrl}';
  }
}
