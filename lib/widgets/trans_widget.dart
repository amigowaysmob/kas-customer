import 'package:flutter/material.dart';
import 'package:kasnew/response_model/trans_model.dart';
import 'package:kasnew/screens/bottom_screens/homescreen/plan_slider_section.dart';
import 'package:kasnew/screens/paydues/pay_dues_screen.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/widgets/no_userId_function.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/text_view_small.dart';

class TransWidget extends StatelessWidget {
  TransactionsData? transData;
  LangData? langData;
 TransWidget({this.transData,this.langData});

  @override
  Widget build(BuildContext context) {
    
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextViewLarge(title: transData?.planName,fontWeight: FontWeight.bold,textcolor: appColor,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
              transData?.passbookNumber!=null &&(transData?.passbookNumber?.isNotEmpty??false)?  RowTextWidget(title: langData?.passbook, value:transData?.passbookNumber):Container(),
              transData?.transactionId!=null && (transData?.transactionId?.isNotEmpty??false)? Row(children: [
      TextViewSmall(title:'${langData?.transactionId} : ',textcolor: blackColor,),
TextViewMedium(name: transData?.transactionId,fontWeight: FontWeight.bold,textColors: blackColor,fontSize:ApiConstant.langCode=='ta' ?12:13,)
    ],):Container(),
              // RowTextWidget(title: langData?.transactionId, value:transData?.transactionId):Container(),
                RowTextWidget(title:langData?.paidAt, value:transData?.date),
               
               Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                 children: [
                   RowTextWidget(title: langData?.groupCode, value: transData?.groupCode),
                    InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: getColor(transData?.paymentStatus)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TextViewSmall(title:Helper.capitalizeFirstLetter(transData?.paymentStatus??'') ,textcolor:transData?.paymentStatus?.toLowerCase()=='pending'? appColor:whiteColor,fontWeight: FontWeight.bold,),
                              ),
                            ),
                          ),
                 ],
               ),
              
              ],
            ),
            
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Row(
                     children: [
                        TextViewSmall(title:'${langData?.amount} : ',textcolor: blackColor,),
                       BigAmountWidget(rupees:transData?.amount ),
                     ],
                   ),
                   TextViewSmall(title: transData?.date,textcolor: greyColor,)
                 ],
               )
          ],
        ),
      ),
    );
  }
}

Color getColor(String? status){
  switch(status?.toLowerCase()){
    
     case 'failed':
    return Colors.red;
     case 'pending':
    return Colors.yellow;
     case 'success':
    return Colors.green;
  default:
        return Colors.green;
    
  }}