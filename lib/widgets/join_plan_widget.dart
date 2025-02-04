import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kasnew/router/router_path.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';

class JoinPlanWidget extends StatelessWidget {
  const JoinPlanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return  Padding(
      padding:  EdgeInsets.all(screenPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Image.asset('assets/images/join_plan.png'),
      ButtonWidget(onPressed: (){
        context.router.pushNamed(RouterPath.add_customer_path);
      }, buttonName: 'Join Plan', buttonColor: appColor,width:swidth ,)
      
      ],),
    );
  }
}