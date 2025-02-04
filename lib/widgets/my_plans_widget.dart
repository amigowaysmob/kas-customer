import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/response_model/my_plans_model.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/screens/paydues/pay_dues_screen.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/widgets/text_view_large.dart';

class MyPlansWidget extends StatelessWidget {
  MyPlans? plans;
 MyPlansWidget({this.plans});

  @override
  Widget build(BuildContext context) {
     LangModel? lang=ApiConstant.language;
  
    var d=lang?.data;
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextViewLarge(title: plans?.planName,fontWeight: FontWeight.bold,textcolor: appColor,),
            plans?.accountNo!=null &&(plans?.accountNo?.isNotEmpty??false)?  RowTextWidget(title: 'Passbook Number', value:plans?.accountNo):Container(),
            RowTextWidget(title: '${d?.name??'Name'}', value:plans?.customerName) ,
            RowTextWidget(title: '${d?.planType??'Plan Type'}', value:plans?.planType) ,
             RowTextWidget(title: '${d?.planAmount??'Plan Amount'}}', value:'₹${plans?.paidAmount??'0'}') ,
               InkWell(
                      child: Text('${d?.clickHereMoreDetails??'Click here to more Details'}',style:TextStyle(
                               color:blackColor,
                               fontSize: 12,
                                fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                   fontFamily: 'Monoserrat'
                              ),),
                      onTap: (){
                       context.router.push(PlanDetailScreen(planId: plans?.id));
                    },
                    ) 
             
          ],
        ),
      ),
    );
  }
}

