
import 'package:auto_route/auto_route.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/router/router_path.dart';





@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
         AutoRoute(
            path: RouterPath.splash_path,
            page: SplashScreen.page,
            initial: true),
          AutoRoute(
            path: RouterPath.verify_otp_path,
            page:OtpVerifyRoute.page,
            ), 
              AutoRoute(
            path: RouterPath.create_mpin_path,
            page:CreateMpinScreen.page,
            ),
             AutoRoute(
            path: RouterPath.login_path,
            page:LoginScreen.page,
            ),
              AutoRoute(
            path: RouterPath.verify_mpin_path,
            page:VerifyMpinScreen.page,
            ), 
              AutoRoute(
            path: RouterPath.reset_mpin_path,
            page:ResetMpinScreen.page,
            ), 
              AutoRoute(
            path: RouterPath.about_us_path,
            page:AboutUsScreen.page,
            ),
              AutoRoute(
            path: RouterPath.register_path,
            page:RegisterRoute.page,
            ),
              AutoRoute(
            path: RouterPath.add_customer_path,
            page:StepperForm.page,
            ),
            AutoRoute(
            path: RouterPath.pay_due_path,
            page:PayDuesScreen.page,
            ),
              AutoRoute(
            path: RouterPath.exist_add_customer,
            page:ExistStepperScreen.page,
            ),
           AutoRoute(
            path: RouterPath.summary_path,
            page:SummaryScreen.page,
            ),
            AutoRoute(
            path: RouterPath.trans_path,
            page:TransScreen.page,
            ),
             AutoRoute(
            path: RouterPath.ledger_path,
            page:LedgerScreen.page,
            ),
              AutoRoute(
            path: RouterPath.about_us_path,
            page:AboutUsScreen.page,
            ),
              AutoRoute(
            path: RouterPath.terms_path,
            page:TermsScreen.page,
            ),
              AutoRoute(
            path: RouterPath.privacy_path,
            page:PrivacyScreen.page,
            ),
             AutoRoute(
            path: RouterPath.contact_path,
            page:ContactScreen.page,
            ),
             AutoRoute(
            path: RouterPath.gallery_path,
            page:GalleryScreen.page,
            ),
             AutoRoute(
            path: RouterPath.gift_path,
            page:GiftScreen.page,
            ),
             AutoRoute(
            path: RouterPath.receipt_path,
            page:ReceiptScreen.page,
            ),
             AutoRoute(
            path: RouterPath.stores_path,
            page:StoresScreen.page,
            ),
             AutoRoute(
            path: RouterPath.ledger_detail_path,
            page:LedgerDetailScreen.page,
            ),
             AutoRoute(
            path: RouterPath.payment_status_path,
            page:PaymentStatusScreen.page,
            ),
             AutoRoute(
            path: RouterPath.store_detail_path,
            page:StoreDetailScreen.page,
            ),
             AutoRoute(
            path: RouterPath.account_path,
            page:AccountScreen.page,
            ),
             AutoRoute(
            path: RouterPath.giftListPath,
            page:GiftListScreen.page,
            ),
            AutoRoute(
            path: RouterPath.paasbook_path,
            page:PassBookScreen.page,
            ),
             AutoRoute(
            path: RouterPath.basic_detail_edit_path,
            page:BasicDetailEditScreen.page,
            ),
             AutoRoute(
            path: RouterPath.customer_id_edit_path,
            page:ProofEditScreen.page,
            ),
             AutoRoute(
            path: RouterPath.customer_id_edit_path,
            page:ProofEditScreen.page,
            ),
             AutoRoute(
            path: RouterPath.plan_detail_path,
            page: PlanDetailScreen.page,),
            AutoRoute(
            path: RouterPath.due_payment_status_path,
            page: PayDueSuccessScreen.page),
              AutoRoute(
            path: RouterPath.change_mpin_path,
            page: ChangeMpinScreen.page,),
             AutoRoute(
            path: RouterPath.plan_types_path,
            page: PlanTypesScreen.page,), 
            AutoRoute(
            path: RouterPath.plans_path,
            page: PlansScreen.page,),
             AutoRoute(
            path: RouterPath.invite_path,
            page: InviteScreen.page,), 
            AutoRoute(
            path: RouterPath.month_plan_path,
            page: MonthPlansScreen.page,), 
            AutoRoute(
            path: RouterPath.nominee_basic_edit,
            page: NomineeBasicEditScreen.page,), 
             AutoRoute(
            path: RouterPath.nominee_id_edit_path,
            page: NomineeProofEditScreen.page,), 
             AutoRoute(
            path: RouterPath.payment_hdfc_path,
            page: PaymentRouteScreen.page,), 
            AutoRoute(
            path: RouterPath.my_plan_list_path,
            page: MyPlansScreen.page,), 
            AutoRoute(
            path: RouterPath.e_cat_path,
            page: ECatScreen.page,),
             AutoRoute(
            path: RouterPath.e_cat_detail_path,
            page: ECatDetailScreen.page),
            AutoRoute(
            path: RouterPath.zoom_product_path,
            page: ZoomProductScreen.page), 
             AutoRoute(
            path: RouterPath.feed_back_path,
            page: FeedbackScreen.page),
             AutoRoute(
            path: RouterPath.pay_others_path,
            page: PayForOthersScreen.page),
            AutoRoute(
            path: RouterPath.pay_others_otp_path,
            page: PayOtpScreen.page),
            AutoRoute(
            path: RouterPath.pay_others_list_path,
            page: PayOthersListScreen.page),
            AutoRoute(
            path: RouterPath.contact_person_path,
            page: ContactPersonScreen.page),
             AutoRoute(
            path: RouterPath.delete_path,
            page: DeleteScreen.page),
            AutoRoute(
            path: RouterPath.product_list_path,
            page: ProductScreen.page),
             AutoRoute(
            path: RouterPath.notification_path,
            page:NotificationScreen.page ),
            AutoRoute(
            path: RouterPath.full_slider_path,
            page:FullScreenSlider.page ),
              AutoRoute(
            path: RouterPath.lucky_path,
            page:LuckyScreen.page ),
             AutoRoute(
            path: RouterPath.lucky_terms_path,
            page:LuckyTermsScreen.page ),
              AutoRoute(
            path: RouterPath.bottom_path,
            page: BottomNavigationRoute.page,
            children: [
              AutoRoute(path: RouterPath.home_path,page: HomeScreen.page,initial: true),
              AutoRoute(path: RouterPath.ledger_inner,page: LedgerScreen.page),
               AutoRoute(path: RouterPath.trans_inner,page: TransScreen.page),
              
  
              //  AutoRoute(path: RouterPath.daily_report_path_inner,page: DailyReportScreen.page),
                  AutoRoute(path: RouterPath.account_inner,page: AccountScreen.page),
            ]
            ),
            ];}