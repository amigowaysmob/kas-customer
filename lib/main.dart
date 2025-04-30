import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kasnew/cubits/about_us_cubit.dart';
import 'package:kasnew/cubits/cat_list_cubit.dart';
import 'package:kasnew/cubits/change_mpin_cubit.dart';
import 'package:kasnew/cubits/chit_close_cubit.dart';
import 'package:kasnew/cubits/con_register_cubit.dart';
import 'package:kasnew/cubits/contact_cubit.dart';
import 'package:kasnew/cubits/contact_person_cubit.dart';
import 'package:kasnew/cubits/delete_cubit.dart';
import 'package:kasnew/cubits/due_payment_status_cubit.dart';
import 'package:kasnew/cubits/e_cat_cubit.dart';
import 'package:kasnew/cubits/e_passbook_cubit.dart';
import 'package:kasnew/cubits/ecat_detail_cubit.dart';
import 'package:kasnew/cubits/feed_back_cubit.dart';
import 'package:kasnew/cubits/feed_sub_cat_cubit.dart';
import 'package:kasnew/cubits/forgot_mpin_cubit.dart';
import 'package:kasnew/cubits/gallery_cubit.dart';
import 'package:kasnew/cubits/get_feedback_cubit.dart';
import 'package:kasnew/cubits/gift_cubit.dart';
import 'package:kasnew/cubits/gift_delivery_cubit.dart';
import 'package:kasnew/cubits/gift_list_cubit.dart';
import 'package:kasnew/cubits/group_code_cubit.dart';
import 'package:kasnew/cubits/home_cubit.dart';
import 'package:kasnew/cubits/invite_cubit.dart';
import 'package:kasnew/cubits/lang_cubit.dart';
import 'package:kasnew/cubits/lang_list_cubit.dart';
import 'package:kasnew/cubits/ledger_cubit.dart';
import 'package:kasnew/cubits/ledger_detail_cubit.dart';
import 'package:kasnew/cubits/login_cubit.dart';
import 'package:kasnew/cubits/login_mpin_cubit.dart';
import 'package:kasnew/cubits/lucky_draw_cubit.dart';
import 'package:kasnew/cubits/lucky_months_cubit.dart';
import 'package:kasnew/cubits/lucky_terms_cubit.dart';
import 'package:kasnew/cubits/mobile_check_cubit.dart';
import 'package:kasnew/cubits/month_plans_cubit.dart';
import 'package:kasnew/cubits/my_plans_cubit.dart';
import 'package:kasnew/cubits/notification_cubit.dart';
import 'package:kasnew/cubits/pay_dues_cubit.dart';
import 'package:kasnew/cubits/pay_now_cubit.dart';
import 'package:kasnew/cubits/pay_others_cubit.dart';
import 'package:kasnew/cubits/pay_others_otp_cubit.dart';
import 'package:kasnew/cubits/payment_status_cubit.dart';
import 'package:kasnew/cubits/pincode_cubit.dart';
import 'package:kasnew/cubits/plan_detail_cubit.dart';
import 'package:kasnew/cubits/plan_group_code_cubit.dart';
import 'package:kasnew/cubits/plan_types_cubit.dart';
import 'package:kasnew/cubits/plans_cubit.dart';
import 'package:kasnew/cubits/privacy_cubit.dart';
import 'package:kasnew/cubits/product_list_cubit.dart';
import 'package:kasnew/cubits/receipt_cubit.dart';
import 'package:kasnew/cubits/register_cubit.dart';
import 'package:kasnew/cubits/register_mpin_cubit.dart';
import 'package:kasnew/cubits/remove_profile_cubit.dart';
import 'package:kasnew/cubits/resend_otp_cubit.dart';
import 'package:kasnew/cubits/reset_mpin_cubit.dart';
import 'package:kasnew/cubits/site_settings_cubit.dart';
import 'package:kasnew/cubits/stepper_cubit.dart';
import 'package:kasnew/cubits/stepper_form_cubit.dart';
import 'package:kasnew/cubits/store_detail_cubit.dart';
import 'package:kasnew/cubits/stores_cubit.dart';
import 'package:kasnew/cubits/submit_enquiry_cubit.dart';
import 'package:kasnew/cubits/submit_ticket_cubit.dart';
import 'package:kasnew/cubits/summary_cubit.dart';
import 'package:kasnew/cubits/terms_cubit.dart';
import 'package:kasnew/cubits/token_cubit.dart';
import 'package:kasnew/cubits/total_pay_due_cubit.dart';
import 'package:kasnew/cubits/trans_cubit.dart';
import 'package:kasnew/cubits/update_profile_cubit.dart';
import 'package:kasnew/cubits/update_profile_photo_cubit.dart';
import 'package:kasnew/cubits/view_profile_cubit.dart';
import 'package:kasnew/cubits/winners_cubit.dart';
import 'package:kasnew/cubits/wp_check_cubit.dart';
import 'package:kasnew/firebase_options.dart';
import 'package:kasnew/router/app_router.dart';

import 'package:kasnew/utils/apiservice/api_service.dart';
import 'package:kasnew/utils/auth_repository.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/constants/sharedpreference_help.dart';
import 'package:kasnew/utils/firebase_helper.dart';
import 'package:kasnew/utils/my_observer.dart';
import 'package:kasnew/widgets/logger_widget.dart';
// import 'package:flutter_uxcam/flutter_uxcam.dart';
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
//   firebaseHelper = FirebaseHelper();
//   await firebaseHelper?.setupFlutterNotifications(); // Ensure notifications are set up

//   // Register background message handler
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

//   // Listen to messages when app is in foreground
//   FirebaseMessaging.onMessage.listen(firebaseHelper?.showFlutterNotification);

//   await firebaseHelper?.crashReport();

//   runApp(MyApp());
// }

// // Background message handler
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   firebaseHelper?.showFlutterNotification(message); // Show the notification
// }

// FirebaseHelper? firebaseHelper;
// class MyApp extends StatelessWidget {
//  MyApp({super.key});
//  final _appRouter = AppRouter();
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
   
//      final SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();

//     // Configure Dio
//     final Dio dio = Dio(BaseOptions(
//       baseUrl: ApiConstant.baseUrl,
//       responseType: ResponseType.json,
//       receiveDataWhenStatusError: true,
//       validateStatus: (_) => true,
//       headers: {
//         "Accept": "application/json",
//       },
//       connectTimeout: const Duration(seconds: 100),
//       receiveTimeout: const Duration(seconds: 100),
//     ));

//     // Add interceptors if needed
//     dio.interceptors.add(LoggerInterceptor());

//     // Create ApiService instance
//     final ApiService apiService = ApiService(dio,sharedPreferenceHelper);

//     // Create AuthRepository instance
//     final AuthRepository authRepository = AuthRepository(apiService);

//     // Create SiteSetting
   
//     return MultiRepositoryProvider(
//       providers: [
//         RepositoryProvider<AuthRepository>(
//           create: (context) => AuthRepository(apiService),
//         ),
        
//         // RepositoryProvider<SiteSettingsRepository>(
//         //   create: (context) => SiteSettingsRepository(),
//         // ),
//         ],
//         child:MultiBlocProvider(
//         providers: [
//           BlocProvider<RegisterCubit>(
//             create: (repoContext) => RegisterCubit(authRepository:AuthRepository(apiService))),
//              BlocProvider<SiteSettingsCubit>(
//             create: (repoContext) => SiteSettingsCubit(authRepository:AuthRepository(apiService))),
//            BlocProvider<TokenCubit>(
//             create: (repoContext) => TokenCubit(authRepository:AuthRepository(apiService))),
//              BlocProvider<ConRegisterCubit>(
//             create: (repoContext) => ConRegisterCubit(authRepository:AuthRepository(apiService))),
           
//              BlocProvider<RegisterMpinCubit>(
//             create: (repoContext) => RegisterMpinCubit(authRepository:AuthRepository(apiService))),
//              BlocProvider<LoginMpinCubit>(
//             create: (repoContext) => LoginMpinCubit(authRepository:AuthRepository(apiService))),
         
//           BlocProvider<ResetMpinCubit>(
//             create: (repoContext) => ResetMpinCubit(authRepository:AuthRepository(apiService))
//           ),
//            BlocProvider<ForgotMpinCubit>(
//             create: (repoContext) => ForgotMpinCubit(authRepository:AuthRepository(apiService))
//           ),
//           BlocProvider<LoginCubit>(
//             create: (repoContext) => LoginCubit(authRepository:AuthRepository(apiService))
//           ),
          
//           ],

//    child: ScreenUtilInit(
//           designSize: const Size(360, 690),
//           minTextAdapt: true,
//           splitScreenMode: true,
//           builder: (context, child) {
//             return MediaQuery(
//               data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
//               child: MaterialApp.router(
//                 routerConfig: _appRouter.config(
//                   navigatorObservers: () => [MyObserver()],
//                 ),
//                 debugShowCheckedModeBanner: false,
//                 theme: ThemeData(
//                   colorScheme: ColorScheme.fromSeed(seedColor: whiteColor),
//                   useMaterial3: true,
//                   appBarTheme: AppBarTheme(
//                     iconTheme: IconThemeData(
//                       color: whiteColor,
//                     ),
//                   ),
//                   fontFamily: 'Montserrat',
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  firebaseHelper = FirebaseHelper();
  await firebaseHelper?.setupFlutterNotifications(); // Ensure notifications are set up

  // Register background message handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Listen to messages when app is in foreground
  FirebaseMessaging.onMessage.listen(firebaseHelper?.showFlutterNotification);

  await firebaseHelper?.crashReport();

  runApp(MyApp());
}

// Background message handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  firebaseHelper?.showFlutterNotification(message); // Show the notification
}

FirebaseHelper? firebaseHelper;
class MyApp extends StatelessWidget {
 MyApp({super.key});
 final _appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
     final SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();
// FlutterUxcam.optIntoSchematicRecordings(); /* Confirm that you have user 
//   permission for screen recording */
//   FlutterUxConfig config = FlutterUxConfig(
//     userAppKey: "d7bbho56g4zw5db",
//     enableAutomaticScreenNameTagging: false);
//   FlutterUxcam.startWithConfiguration(config);
    // Configure Dio
    final Dio dio = Dio(BaseOptions(
      baseUrl: ApiConstant.baseUrl,
      responseType: ResponseType.json,
      receiveDataWhenStatusError: true,
      validateStatus: (_) => true,
      headers: {
        "Accept": "application/json",
      },
      connectTimeout: const Duration(seconds: 100),
      receiveTimeout: const Duration(seconds: 100),
    ));

    // Add interceptors if needed
    dio.interceptors.add(LoggerInterceptor());

    // Create ApiService instance
    final ApiService apiService = ApiService(dio,sharedPreferenceHelper);

    // Create AuthRepository instance
    final AuthRepository authRepository = AuthRepository(apiService);

    // Create SiteSetting
   
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(apiService),
        ),
        
        // RepositoryProvider<SiteSettingsRepository>(
        //   create: (context) => SiteSettingsRepository(),
        // ),
        ],
        child:MultiBlocProvider(
        providers: [
          BlocProvider<RegisterCubit>(
            create: (repoContext) => RegisterCubit(authRepository:AuthRepository(apiService))),
          BlocProvider<SiteSettingsCubit>(
            create: (repoContext) => SiteSettingsCubit(authRepository:AuthRepository(apiService))),
           BlocProvider<TokenCubit>(
            create: (repoContext) => TokenCubit(authRepository:AuthRepository(apiService))),
             BlocProvider<ConRegisterCubit>(
            create: (repoContext) => ConRegisterCubit(authRepository:AuthRepository(apiService))),
             
             BlocProvider<RegisterMpinCubit>(
            create: (repoContext) => RegisterMpinCubit(authRepository:AuthRepository(apiService))),
             BlocProvider<LoginMpinCubit>(
            create: (repoContext) => LoginMpinCubit(authRepository:AuthRepository(apiService))),
            BlocProvider<ChangeMpinCubit>(
            create: (repoContext) => ChangeMpinCubit(authRepository:AuthRepository(apiService))),
           
          BlocProvider<ResetMpinCubit>(
            create: (repoContext) => ResetMpinCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<ForgotMpinCubit>(
            create: (repoContext) => ForgotMpinCubit(authRepository:AuthRepository(apiService))
          ),
          BlocProvider<LoginCubit>(
            create: (repoContext) => LoginCubit(authRepository:AuthRepository(apiService))
          ), 
         BlocProvider<AboutUsCubit>(
            create: (repoContext) => AboutUsCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<LangCubit>(
            create: (repoContext) => LangCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<HomeCubit>(
            create: (repoContext) => HomeCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<TermsCubit>(
            create: (repoContext) => TermsCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<PrivacyCubit>(
            create: (repoContext) => PrivacyCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<ContactCubit>(
            create: (repoContext) => ContactCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<SubmitEnquiryCubit>(
            create: (repoContext) =>SubmitEnquiryCubit(authRepository:AuthRepository(apiService))
          ),
            BlocProvider<MonthPlansCubit>(
            create: (repoContext) =>MonthPlansCubit(authRepository:AuthRepository(apiService))
          ),
          BlocProvider<MobileCheckCubit>(
            create: (repoContext) =>MobileCheckCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<WpCheckCubit>(
            create: (repoContext) =>WpCheckCubit(authRepository:AuthRepository(apiService))
          ),
          BlocProvider<StepperCubit>(
            create: (repoContext) =>StepperCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<StepperFormCubit>(
            create: (repoContext) =>StepperFormCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<PincodeCubit>(
            create: (repoContext) =>PincodeCubit(authRepository:AuthRepository(apiService))
          ),
          BlocProvider<PayDuesCubit>(
            create: (repoContext) =>PayDuesCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<PayNowCubit>(
            create: (repoContext) =>PayNowCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<TransCubit>(
            create: (repoContext) =>TransCubit(authRepository:AuthRepository(apiService))
          ),
          BlocProvider<SummaryCubit>(
            create: (repoContext) =>SummaryCubit(authRepository:AuthRepository(apiService))
          ),
            BlocProvider<ViewProfileCubit>(
            create: (repoContext) =>ViewProfileCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<GiftCubit>(
            create: (repoContext) =>GiftCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<ReceiptCubit>(
            create: (repoContext) =>ReceiptCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<GalleryCubit>(
            create: (repoContext) =>GalleryCubit(authRepository:AuthRepository(apiService))
          ),
          BlocProvider<StoresCubit>(
            create: (repoContext) =>StoresCubit(authRepository:AuthRepository(apiService))
          ),
          BlocProvider<StoreDetailCubit>(
            create: (repoContext) =>StoreDetailCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<GiftDeliveryCubit>(
            create: (repoContext) =>GiftDeliveryCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<LedgerCubit>(
            create: (repoContext) =>LedgerCubit(authRepository:AuthRepository(apiService))
          ),
          BlocProvider<LedgerDetailCubit>(
            create: (repoContext) =>LedgerDetailCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<TotalPayDueCubit>(
            create: (repoContext) =>TotalPayDueCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<PaymentStatusCubit>(
            create: (repoContext) =>PaymentStatusCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<ChitCloseCubit>(
            create: (repoContext) =>ChitCloseCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<GiftListCubit>(
            create: (repoContext) =>GiftListCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<EPassBookCubit>(
            create: (repoContext) =>EPassBookCubit(authRepository:AuthRepository(apiService))
          ),
          BlocProvider<InviteCubit>(
            create: (repoContext) =>InviteCubit(authRepository:AuthRepository(apiService))
          ),
          BlocProvider<PlanDetailCubit>(
            create: (repoContext) =>PlanDetailCubit(authRepository:AuthRepository(apiService))
          ),BlocProvider<DuePaymentStatusCubit>(
            create: (repoContext) =>DuePaymentStatusCubit(authRepository:AuthRepository(apiService))
          ),
          BlocProvider<GroupCodeCubit>(
            create: (repoContext) =>GroupCodeCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<PlansCubit>(
            create: (repoContext) =>PlansCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<UpdateProfilePhotoCubit>(
            create: (repoContext) =>UpdateProfilePhotoCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<PlanTypesCubit>(
            create: (repoContext) =>PlanTypesCubit(authRepository:AuthRepository(apiService))
          ),
          BlocProvider<UpdateProfileCubit>(
            create: (repoContext) =>UpdateProfileCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<MyPlansCubit>(
            create: (repoContext) =>MyPlansCubit(authRepository:AuthRepository(apiService))
          ),
          BlocProvider<PlanGroupCodeCubit>(
            create: (repoContext) =>PlanGroupCodeCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<ECatCubit>(
            create: (repoContext) =>ECatCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<ECatDetailCubit>(
            create: (repoContext) =>ECatDetailCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<RemoveProfileCubit>(
            create: (repoContext) =>RemoveProfileCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<FeedBackCubit>(
            create: (repoContext) =>FeedBackCubit(authRepository:AuthRepository(apiService))
          ),
            BlocProvider<GetFeedBackCubit>(
            create: (repoContext) =>GetFeedBackCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<PayOthersCubit>(
            create: (repoContext) =>PayOthersCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<LangListCubit>(
            create: (repoContext) =>LangListCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<ResendOtpCubit>(
            create: (repoContext) =>ResendOtpCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<NotificationCubit>(
            create: (repoContext) =>NotificationCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<ContactPersonCubit>(
            create: (repoContext) =>ContactPersonCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<PayOthersOtpCubit>(
            create: (repoContext) =>PayOthersOtpCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<DeleteCubit>(
            create: (repoContext) =>DeleteCubit(authRepository:AuthRepository(apiService))
          ),
           BlocProvider<ProductListCubit>(
            create: (repoContext) =>ProductListCubit(authRepository:AuthRepository(apiService)),

          ),
           BlocProvider<CatListCubit>(
            create: (repoContext) =>CatListCubit(authRepository:AuthRepository(apiService)),
            
          ),
          BlocProvider<LuckyDrawCubit>(
            create: (repoContext) =>LuckyDrawCubit(authRepository:AuthRepository(apiService)),
            
          ),
          BlocProvider<LuckyTermsCubit>(
            create: (repoContext) =>LuckyTermsCubit(authRepository:AuthRepository(apiService)),
            
          ),
           BlocProvider<WinnersCubit>(
            create: (repoContext) =>WinnersCubit(authRepository:AuthRepository(apiService)),
            
          ),
           BlocProvider<LuckyMonthsCubit>(
            create: (repoContext) =>LuckyMonthsCubit(authRepository:AuthRepository(apiService)),
            
          ),
            BlocProvider<FeedSubCatCubit>(
            create: (repoContext) =>FeedSubCatCubit(authRepository:AuthRepository(apiService)),
            
          ),
            BlocProvider<SubmitTicketCubit>(
            create: (repoContext) =>SubmitTicketCubit(authRepository:AuthRepository(apiService)),
            
          ),
          ],

   child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: MaterialApp.router(
                routerConfig: _appRouter.config(
                  navigatorObservers: () => [MyObserver()],
                ),
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: whiteColor),
                  useMaterial3: true,
                  appBarTheme: AppBarTheme(
                    iconTheme: IconThemeData(
                      color: whiteColor,
                    ),
                  ),
                  fontFamily: 'Montserrat',
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}