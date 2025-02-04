import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kasnew/cubits/home_cubit.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/response_model/home_model.dart';
import 'package:kasnew/screens/bottom_screens/homescreen/card_section.dart';
import 'package:kasnew/screens/bottom_screens/homescreen/header_section.dart';
import 'package:kasnew/screens/bottom_screens/homescreen/home_icon_section.dart';
import 'package:kasnew/screens/bottom_screens/homescreen/plan_slider_section.dart';
import 'package:kasnew/screens/bottom_screens/homescreen/rate_section.dart';
import 'package:kasnew/screens/bottom_screens/homescreen/slider_section.dart';
import 'package:kasnew/states/home_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/constants/sharedpreference_help.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/utils/firebase_helper.dart';
import 'package:kasnew/utils/shimmer/shimmer_widget.dart';
import 'package:kasnew/widgets/review_widget.dart';
import 'package:kasnew/widgets/text_view_medium.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  String? currentAddress;
 HomeScreen({this.currentAddress});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

    late SharedPreferenceHelper sharedPreferenceHelper;
 
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  @override
  void initState() {
     callback(AppLifecycleState? previous, AppLifecycleState current) {
        if (current == AppLifecycleState.resumed) {
          // checkForUnreadNotifications();
        }
      }
    super.initState();
    sharedPreferenceHelper = SharedPreferenceHelper();
    sharedPreferenceHelper.init();

    // Initialize Firebase Messaging and Local Notification
    // _initializeFirebaseMessaging();
    // _initializeLocalNotification();

    // Load initial profile data and check for unread notifications
    _loadProfile();
    // checkForUnreadNotifications();

    // Check for unread notifications every time the app resumes
     WidgetsBinding.instance.addObserver(LifecycleObserver(_onLifecycleStateChanged));
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(LifecycleObserver(_onLifecycleStateChanged));
    super.dispose();
  }

  void _onLifecycleStateChanged(AppLifecycleState? previous, AppLifecycleState current) {
    if (current == AppLifecycleState.resumed) {
      checkForUnreadNotifications();
    }
  }

  Future<void> checkForUnreadNotifications() async {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _navigateToNotificationScreen();
    });

    var notificationValue = await FirebaseHelper().checkForUnOpenedNotifications();

    if (notificationValue != null) {
      _navigateToNotificationScreen();
    }
  }

  void _initializeFirebaseMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _handleNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleNotification(message);
    });

    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        _handleNotification(message);
      }
    });
  }

  void _initializeLocalNotification() {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    
    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        if (details.payload.toString().isNotEmpty) {
          //  context.router.push( NotificationScreen());
        }
      },
    );
  }

  void _handleNotification(RemoteMessage message) {
    if (message.data.isNotEmpty) {
      String? screen = message.data['screen'];
      if (screen != null) {
        _navigateToScreen();
      }
    }
  }

  void _navigateToScreen() {
    // context.router.push( NotificationScreen());
  }

  void _navigateToNotificationScreen() {
    // context.router.push( NotificationScreen());
  }
  void _loadProfile() {
   
    context.read<HomeCubit>().login(HomeRequestModel(userId: sharedPreferenceHelper.getUserId,lang: ApiConstant.langCode));
  }
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return  BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if(state.networkStatusEnum==NetworkStatusEnum.loaded){}
            //  langdataa = state.model.data?.sections
            //         ?.firstWhere((section) => section.section == 'langdata')
            //         ?.langdata;
           if(state.model.data?.feedbackShow==1){
            _showFeedBackDialog(context);
           }
          },
          builder: (context, state) {
            if (state.networkStatusEnum == NetworkStatusEnum.loading) {
              return ShimmerWidget();
            } else if (state.networkStatusEnum == NetworkStatusEnum.loaded) {
               state.model.data!.sections?[0].section=='sidebar';
               
              if (state.model != null &&
                  state.model.data != null &&
                  state.model.data?.sections!= null) {
                List<Widget> widgetList = state.model.data!.sections!
                    .map((section) => addWidgedList(
                          // state.model.data!.sections!,
                          section,
                          state.model.data?.langData
                      // langdataa ,
                      // bgdataa,
                      //  userdataa,
                      // earningsdataa,
                     
                        ))
                    .toList();
      
                return SingleChildScrollView(
                  child:
                      Column(
                      
                        children: [
                          // vericalSpaceMedium,
                          // Image.network(bgdataa?.headerSlogan??''),
                          Column(
                            children: widgetList,
                          ),
                        ],
                      ),
                    
                  
                );
              } else {
                return Center(child: Text("No data available"));
              }
            } else {
              return Center(child: Text("An error occurred"));
            }
          },
        );
      
  }
  }

  Widget addWidgedList(
   
    Sections? homeSections,
  LangData? langData,
  
   
  ) {
    switch (homeSections?.section ?? "") {
        case "header_image":
        return HeaderSection(
          image: homeSections?.headerImage,
        );
      case "gold_silver_price":
        return RateSection(
          rate: homeSections?.goldSilverPrice,
          langData: langData,
        );
        case"banners":
        return SliderSection(
          homeSection: homeSections,
        );
        case "carddata":
        return CardSection(
          section: homeSections,
               langData: langData,
        );
         case "myplans":
        return PlanSliderSection(
          homeSection: homeSections,
               langData: langData,
        );
         case "home_icons":
        return HomeIconSection(
          section: homeSections,
        );
      // Add other cases as needed
      default:
        return Container();
    }
  }
 







class ItemWidget extends StatelessWidget {
  IconData? iconData;
  String? title;
  VoidCallback? onTap;
  bool? isFicon;
  ItemWidget({this.iconData,this.title,this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap:onTap,
      child: Padding(
        padding:  EdgeInsets.all(5),
        child: Row(
          children: [
            horizontalSpaceSmall,
       Icon(iconData,),
          horizontalSpaceMedium,
           TextViewMedium(name: title,fontSize: 11,fontWeight: FontWeight.bold,),
           
          ]
        ),
      ),
    );
  }
  
}
class LifecycleObserver extends WidgetsBindingObserver {
  final LifecycleCallback callback;

  LifecycleObserver(this.callback);

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    callback(null, state);
  }
}
void _showFeedBackDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
       
        content: ReviewWidget(),
       
      );
    },
  );
}