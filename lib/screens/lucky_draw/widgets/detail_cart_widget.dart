import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/response_model/lucky_draw_model.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/widgets/column_text_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/text_view_small.dart';

class DetailCardWidget extends StatelessWidget {
 LedgerData? cData;
   DetailCardWidget({this.cData});

  @override
  Widget build(BuildContext context) {
      double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    LangModel? lang=ApiConstant.language;

    var d=lang?.data;
    return Card(
                                              elevation:20,
                                              shadowColor:Color(0xFFF0D53F),
                  child: Container(
                   decoration: BoxDecoration(color: whiteColor,borderRadius: BorderRadius.circular(10),
                   border: Border.all(color: Colors.red)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                              TextViewLarge(title: cData?.planName,textcolor: blackColor,fontWeight: FontWeight.w900,),
                              vericalSpaceSmall,
                                Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                       // ColumnTextWidget(title:'Passbook Name', value: cData?.customerName),
                                       
                                        TextViewMedium(name: cData?.passbookName??'',textColors: blackColor,fontWeight: FontWeight.bold,),
                                        
                                       //  ColumnTextWidget(title: 'Gift Status', value: cData?.giftStatus,position: 1),
                                                                     
                                             cData?.accountNumber!=null &&(cData?.accountNumber?.isNotEmpty??false) ?     Row(
                                                     children: [
                                                        TextViewSmall(title:'A/C No:',textcolor: blackColor, ),
                                                       TextViewMedium(name: cData?.accountNumber,textColors: blackColor,fontWeight: FontWeight.bold,),
                                                     ],
                                                   ):Container(),
                                      ],
                                ),
                               vericalSpaceMedium,
                             Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             children: [
                                                                 // ColumnTextWidget(title: 'Pay Mode', value: cData?.paymentMode,position: 0,),
                                                                 // horizontalSpaceSmall,
                                                   ColumnTextWidget(title: '${d?.planAmount??'Plan Amount'}', value:
                                                                 '₹${ cData?.planAmount}',position: 0,),
                                                                 ColumnTextWidget(title: '${d?.giftStatus??'Gift Status'}', value:cData?.giftStatus ,position: 1),
                                                                 Container(
                                                                  // width: swidth/4,
                                                                   child: ColumnTextWidget(title: '${d?.installmentsPaid??'Installments Paid'}',
                                                                    value: cData?.installments,position: 2,),
                                                                 )
                                             ],
                             ),
                               vericalSpaceMedium,
                              Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                ColumnTextWidget(title: '${d?.payableAmount??'Payable Amount'}', value:cData?.payableAmount!='-' ?'₹${  cData?.payableAmount}':'${  cData?.payableAmount}',position: 0,),
                                                                  ColumnTextWidget(title: '${d?.paidAmount??'Paid Amount'}', value:
                                                   cData?.paidAmount!='-' ?  '₹${ cData?.paidAmount}':'${ cData?.paidAmount}',position: 1,),
                                                                   Container(
                                                                    // width: swidth/4,
                                                                    child: ColumnTextWidget(title: '${d?.balanceAmount??'Balance Amount'}', value:cData?.pendingAmount!='-'? '₹${  cData?.pendingAmount}':'${  cData?.pendingAmount}',position: 2,)),
                                                                   
                                              ],
                              ),
                               vericalSpaceMedium,
                              Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                                  ColumnTextWidget(title: '${d?.joiningDate??'Joining Date'}', value: cData?.planStarted,position: 0,),
                                                                   ColumnTextWidget(title: '${d?.maturityDate??'Maturity Date'}', value: cData?.maturityDate,position: 1,),
                                                                    Container(
                                                                      // width: swidth/4,
                                                                      child: ColumnTextWidget(title: '${d?.lapseDate??'Lapse Date'}', value: cData?.lapseDate,position: 2,))
                                              ],
                                                                       )
                      
                       ],
                      ),
                    ),
                  ),
                )
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                ;
  }
}