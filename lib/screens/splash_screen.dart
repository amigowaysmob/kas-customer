import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kasnew/cubits/site_settings_cubit.dart';
import 'package:kasnew/cubits/token_cubit.dart';
import 'package:kasnew/router/router_path.dart';
import 'package:kasnew/screens/no_internet_screen.dart';
import 'package:kasnew/states/site_settings_state.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/constants/sharedpreference_help.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/utils/firebase_helper.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferenceHelper sharedPreferenceHelper;
  var isNavigate=true;
  @override
  
  
   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
   void initState() {
    super.initState();
      // WidgetsBinding.instance.addObserver();
    checkForUnreadNotifications();

    // Android initialization
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // Initialization settings for both platforms
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    // iOS initialization
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        if (details.payload.toString().isNotEmpty) {
        //  context.router.push(NotificationScreen());
        }
      },
    );
    initializeSharedPrefs();
  }
 void dispose() {
    // WidgetsBinding.instance.removeObserver(this as WidgetsBindingObserver);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      checkForUnreadNotifications();
    }
  }
   Future<void> checkForUnreadNotifications() async {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (Platform.isIOS) {
       

        // context.router.push(NotificationScreen(
        //    ));
      }
       if (Platform.isAndroid) {
       

        // context.router.push(NotificationScreen(
        //    ));
      }
    });

    var notificationValue =
        await FirebaseHelper().checkForUnOpenedNotifications();

    if (notificationValue != null) {
      // context.router.push(NotificationScreen(
      //      ));
    }
  }
  void initializeSharedPrefs() async {
    sharedPreferenceHelper = SharedPreferenceHelper();
    await sharedPreferenceHelper.init();
     final isFirstLaunch = sharedPreferenceHelper.getIsFirstLaunch??true;

  if (isFirstLaunch) {
    // Perform cleanup or initialization here
    // For example: Delete server-side data for this user
     final prefs = await SharedPreferences.getInstance();
     prefs.clear();
    await sharedPreferenceHelper.savefirstLaunch(false);
  }
    context.read<TokenCubit>().login(); 
    context.read<SiteSettingsCubit>().login(); 
   
  }
  _navigateToNextPage() async {
    await Future.delayed(const Duration(seconds: 6)); // Simulate splash screen delay
    // final userBox = await Hive.openBox<bool>('userBox');
    // bool? isLoggedIn = userBox.get('isLoggedIn', defaultValue: false);
    // if (isLoggedIn!) {
      // Navigator.pushReplacementNamed(
      //     context, '/bottomNavigation'); // Navigate to BottomNavigationPage if logged in
    // } 
    // else {
   
    if(sharedPreferenceHelper.getUserId!=null && sharedPreferenceHelper.getUserId.isNotEmpty && sharedPreferenceHelper.getMpinStatus=='1'){
  context.router.replaceNamed(RouterPath.verify_mpin_path);
 }
 else if(sharedPreferenceHelper.getUserId!=null && sharedPreferenceHelper.getUserId.isNotEmpty && sharedPreferenceHelper.getMpinStatus!='1'){
  context.router.replaceNamed(RouterPath.login_path);
 }

          else{
           context.router.replaceNamed(RouterPath.bottom_path); // Navigate to LoginPage if not logged in
    // }
          }}

  @override
 

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SiteSettingsCubit, SiteSettingsState>(
        builder: (context, state) {
     
      if (state.networkStatusEnum == NetworkStatusEnum.loading ||state.networkStatusEnum == NetworkStatusEnum.initial) {
        return CircularWidgetC();
      }
      if (state.networkStatusEnum == NetworkStatusEnum.loaded) {
         _navigateToNextPage();
        final siteSettings = state.model;

sharedPreferenceHelper.saveLogo(siteSettings.data?[0].logoImage);
sharedPreferenceHelper.saveHomeLogo(siteSettings.data?[0].headerLogo);
sharedPreferenceHelper.saveSiteurl(siteSettings.data?[0].siteUrl);
sharedPreferenceHelper.saveDelContent(siteSettings.data?[0].deleteAccountContent);
sharedPreferenceHelper.saveDelReq(siteSettings.data?[0].deleteAccountAlertContent);

        final logoImageUrl = ApiConstant.logoUrl;

        return Scaffold(
         
          body: Center(
            child: Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                width: 200,
                
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(logoImageUrl),
                    fit: BoxFit.fill,
                    onError: (exception, stackTrace) {
                      // Handle error during image loading
                      
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      } else {
        
           
        
       
        return NoInternetScreen();
      }
    });
  }
}
