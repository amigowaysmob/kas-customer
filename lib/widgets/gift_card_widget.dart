import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';

import 'package:kasnew/widgets/network_image_widget.dart';
import 'package:kasnew/widgets/plan_name_widget.dart';
import 'package:kasnew/widgets/row_bold_text_widget.dart';
import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/text_view_small.dart';

class GiftCardWidget extends StatelessWidget {
  String? planName;
  String? acNumber;
  String? planId;
  String? planAmount;

  String? giftPrize;
  String? image;
  String? giftName;
  String? status;
  String? orderId;
   GiftCardWidget({
    required this.planName,
     this.acNumber,
   required this.planId,
   required this.planAmount,
   required this.giftPrize,
   required this.image,
   required this.giftName,
   this.status,
   this.orderId});

  @override
  Widget build(BuildContext context) {
      LangModel? lang=ApiConstant.language;
  
    var d=lang?.data;
    return Padding(
       padding: const EdgeInsets.all(8.0),
       child: Card(
         elevation: 10,
         child: Padding(
           padding: const EdgeInsets.all(5.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               PlanNameWidget(title: planName,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                                acNumber!=null && (acNumber?.isNotEmpty?? false ) ?    
                   
                     RowBoldTextWidget(title: '${d?.acNumber??'A/c number'}', value: acNumber,isNoPadding: true,):Container(),
                      RowBoldTextWidget(title:'${d?.planId??'Plan ID'}' , value:planId,isNoPadding: true, ),
                    RowBoldTextWidget(title:'${d?.planAmount??'Plan Amount'}' , value:'₹$planAmount',isNoPadding: true, ),
                  giftPrize!=null && (giftPrize?.isNotEmpty??false)?  RowBoldTextWidget(title:'${d?.giftPrize??'Gift Prize'}' , value:'₹$giftPrize',isNoPadding: true, ):Container(),
                                   
                     
                   ],),
                   Column(
                     children: [
                       NetworkImageWidget(image??'',height: 50,width:100,),
                       TextViewMedium(name: giftName,fontWeight: FontWeight.w700,)
                     ],
                   ),
                  
                   
                 ],
               ),
               status!=null && (status?.isNotEmpty??false)?status!='2'?
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: status=='1'?Colors.green:Colors.yellow
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextViewSmall(title:status=='1'?'${d?.received??'Received'}':'${d?.pending??'Pending'}' ,textcolor: status=='1'?whiteColor:appColor,fontWeight: FontWeight.bold,),
                      ),
                    ):InkWell(
                     onTap: (){
     context.router.push(GiftScreen(orderId:orderId,isRequest: true ));
                     },
                     child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: appColor
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextViewSmall(title:'Request' ,textcolor: whiteColor,fontWeight: FontWeight.bold,),
                      ),
                    )
                    ):Container(), 
             ],
           ),
         ),
       ),
     );
  }
}

void _showLogoutDialog1(BuildContext context,String? title) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Gift Status'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextViewMedium(name: title,textColors: appColor,fontWeight: FontWeight.bold,)
          ],
        ),
        actions: <Widget>[
         
          TextButton(
            onPressed: ()async {
             // Dismiss the dialog
              context.router.pop();
          // Call your logout function
            },
            child:TextViewMedium(name:'Ok',textColors: appColor,),
          ),
        ],
      );
    },
  );
}

