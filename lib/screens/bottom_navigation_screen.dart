import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/screens/sidebar/side_drawer.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/widgets/custom_appbar_widget.dart';

@RoutePage()
class BottomNavigationPage extends HookWidget {
  BottomNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
       HomeScreen(),
      LedgerScreen(),
      TransScreen(),
      AccountScreen(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return SafeArea(
          child: Scaffold(
            appBar: AppBarWidget(image: ApiConstant.homeLogoUrl,),
             drawer: DrawerSection(),
            body: child,
            bottomNavigationBar: buildBottomNavigationBar(context, tabsRouter),
          ),
        );
      },
    );
  }

  Widget buildBottomNavigationBar(BuildContext context, TabsRouter tabsRouter) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [appDarkColor, appLightColor], // Define your gradient colors here
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: BottomNavigationBar(
        onTap: (index) {
          tabsRouter.setActiveIndex(index);
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: tabsRouter.activeIndex,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.transparent, // Make the background transparent
        unselectedItemColor: Colors.grey,
        unselectedFontSize:10.0.sp,
        selectedFontSize: 11.sp,
        items: [
          BottomNavigationBarItem(
              icon: Icon(tabsRouter.activeIndex == 0
                  ? Icons.home
                  : Icons.home_outlined,size: 20.sp,),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(tabsRouter.activeIndex == 1
                  ? Icons.card_giftcard
                  : Icons.card_giftcard_outlined,size: 20.sp,),
              label: 'My Ledger'),
          BottomNavigationBarItem(
              icon: Icon(tabsRouter.activeIndex == 2
                  ? Icons.payment
                  : Icons.payment_outlined,size: 20.sp,),
              label: 'Transactions'),
          BottomNavigationBarItem(
              icon: Icon(tabsRouter.activeIndex == 3
                  ? Icons.account_circle
                  : Icons.account_circle_outlined,size: 20.sp,),
              label: 'My Account'),
        ],
      ),
    );
  }
}          