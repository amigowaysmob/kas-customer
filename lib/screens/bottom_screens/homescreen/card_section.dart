import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kasnew/response_model/home_model.dart';
import 'package:kasnew/router/router_path.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/widgets/divider_widget.dart';
import 'package:kasnew/widgets/network_image_widget.dart';

import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/text_view_small.dart';

class CardSection extends StatelessWidget {
Sections? section;
LangData? langData;
 CardSection({this.section,required this.langData});

  @override

  Widget build(BuildContext context) {
    
    var d=langData;
    var cData=(section?.carddata?.length??0)>0?(section?.carddata?[0]):null;
    double swidth = MediaQuery.of(context).size.width;
   
    return (section?.carddata?.length??0)>0?  Container(
      width:swidth,
      child: Stack(
         children: [
           Image.asset('assets/images/card_img.png',fit:BoxFit.fill,width:swidth),
           Positioned(
             top:10.h,
            left: 10.w,
             child:Column(
              children: [
               Row(
                 mainAxisAlignment:MainAxisAlignment.spaceBetween,
                 children: [
                   Row(
                     children: [
                     NetworkImageWidget(cData?.cardBgPng??ApiConstant.photo,height: 50.h,width: 50.w,),
                     horizontalSpaceMedium,
                       Container(
                        width: swidth/2.4,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                              TextViewSmall(title: cData?.welcome,textcolor: whiteColor,),
                              TextViewMedium(name: cData?.fullName,textColors: whiteColor,fontWeight: FontWeight.w700,),
                               TextViewMedium(name: cData?.phoneNumber,textColors: whiteColor,fontWeight: FontWeight.w700,),
                                             cData?.customerId!=null&&(cData?.customerId?.isNotEmpty??false)?      Row(children: [
                               TextViewSmall(title: 'ID :',textcolor: whiteColor,),
                               TextViewSmall(title: cData?.customerId,fontWeight: FontWeight.w700,textcolor: whiteColor,),
                            
                              ],):Container(),
                              //  Row(children: [
                              //  TextViewSmall(title: cardData?.memberType,textcolor: whiteColor,fontSizes: 10,),
                              
                            
                              // ],),
                           ],
                         ),
                       ),
                       SizedBox(width: 10,),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Row(
                             children: [
                               TextViewSmall(title: '${d?.status??'Status'} : ',textcolor: Colors.yellow,),
                               TextViewMedium(name: cData?.status,textColors: Colors.yellow,fontWeight: FontWeight.w700,)
                             ],
                           ),
                           
                            Row(
                             children: [
                               TextViewSmall(title:'${d?.date??'Date'} : ',textcolor:whiteColor,),
                               TextViewMedium(name: cData?.date,textColors:whiteColor,fontWeight: FontWeight.w700,)
                             ],
                           ),
                           Row(
                             children: [
                               TextViewSmall(title: '${d?.time??'Time'} : ',textcolor:whiteColor,),
                               TextViewMedium(name: cData?.time,textColors:whiteColor,fontWeight: FontWeight.w700,)
                             ],
                           ),
                           
                         ],
                       ),
                     ],
                   ),
                   
         
                 ],
                 
               ), 
                          ],
         
         
           ) ),
           Positioned(
             bottom: 5.h,
             // left: .w,
             child: Column(
             children: [
                DividerWidget(color: whiteColor,),
                vericalSpaceSmall,
               Padding(
                 padding:  EdgeInsets.only(left:8.0),
                 child: Row(
                             
                   children: [
                    Row(children: [
                      Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                         TextViewSmall(title: '${d?.totalAccount??'Total Accounts'}',
                         textcolor: whiteColor,
                         fontSizes: ApiConstant.langCode!='ta'? 10:9,),
                        vericalSpaceMedium,
                          TextViewSmall(title: '${d?.nextDueDate??'Next DueDate'}',
                         textcolor: whiteColor,
                         fontSizes: ApiConstant.langCode!='ta'? 10:9,),
                          vericalSpaceMedium,
                          TextViewSmall(title: '${d?.nextDueAmount??'Next Due Amount'}',
                         textcolor: whiteColor,
                         fontSizes: ApiConstant.langCode!='ta'? 10:9,),
                         
                         
                         
                      ],),
                      horizontalSpaceSmall,
                      Column(
                             crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                         
                 TextViewSmall(title: ':',textcolor: whiteColor,fontSizes:ApiConstant.langCode!='ta'? 10:9,),
                  vericalSpaceMedium,
                 TextViewSmall(title: ':',textcolor: whiteColor,fontSizes:ApiConstant.langCode!='ta'? 10:9,),
                  vericalSpaceMedium,
                 TextViewSmall(title: ':',textcolor: whiteColor,fontSizes:ApiConstant.langCode!='ta'? 10:9,),
                 
                        ],
                      ),
                      horizontalSpaceSmall,
                      Column(
                         crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          
                         TextViewSmall(title: cData?.totalAccount,
                          textcolor: whiteColor,
                          fontWeight: FontWeight.w700,fontSizes:ApiConstant.langCode!='ta'? 10:9,),
                          vericalSpaceMedium,
                          TextViewSmall(title: cData?.nextDueDate,
                          textcolor: whiteColor,
                          fontWeight: FontWeight.w700,fontSizes: ApiConstant.langCode!='ta'? 10:9,),
                           vericalSpaceMedium,
                          TextViewSmall(title:cData?.nextDueAmount!=null &&(cData?.nextDueAmount?.isNotEmpty??false)? '₹${cData?.nextDueAmount??'0'}':'-',
                          textcolor: whiteColor,
                          fontWeight: FontWeight.w700,fontSizes: ApiConstant.langCode!='ta'? 10:9,),
                         
                      ],)
                    ],),
                    horizontalSpaceLarge,
                    Column(
                      children: [
                 //                     Row(
                 //                       children: [
                 //                        Column(
                 //                          crossAxisAlignment:CrossAxisAlignment.start,
                 //                         children: [
                 //                           TextViewSmall(title: 'Next Due Date',
                 //                      textcolor: whiteColor,
                 //                      fontSizes: ApiConstant.langCode!='ta'? 10:9,),
                 //                     vericalSpaceSmall,
                 //                       TextViewSmall(title: 'Next Due Amount',
                 //                      textcolor: whiteColor,
                 //                      fontSizes: ApiConstant.langCode!='ta'? 10:9,),
                          
                 //                         ],
                 //                        ),
                 //                         horizontalSpaceSmall,
                 //                   Column(
                 //                      crossAxisAlignment:CrossAxisAlignment.start,
                 //                     children: [
                 // TextViewSmall(title: ':',textcolor: whiteColor,),
                 // vericalSpaceSmall,
                 // TextViewSmall(title: ':',textcolor: whiteColor,),
                 
                 //                     ],
                 //                   ),
                 //                   horizontalSpaceSmall,
                 //                    Column(
                 //                          crossAxisAlignment:CrossAxisAlignment.start,
                 //                     children: [
                 //                      TextViewSmall(title:'${ cData?.nextDueDate}  ',
                 //                       textcolor: whiteColor,
                 //                       fontWeight: FontWeight.w700,fontSizes: 10,),
                 //                       vericalSpaceSmall,
                 //                       TextViewSmall(title: cData?.nextDueAmount,
                 //                       textcolor: whiteColor,
                 //                       fontWeight: FontWeight.w700,fontSizes: 12,),
                         
                 //                   ],) 
                 //                       ],
                 //                     ),
                        vericalSpaceSmall,
                         InkWell(
                          onTap: (){
                            context.router.pushNamed(RouterPath.pay_due_path);
                          },
                          child: Container(
                            width: swidth/3.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: sandleColor
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(child: TextViewSmall(title: '${d?.viewAll??'View All'}',textcolor: blackColor,fontWeight: FontWeight.bold,fontSizes: ApiConstant.langCode=='ta'?9.sp:null)),
                            ),
                          ),
                        ),
                        vericalSpaceMedium,
                        InkWell(
                          onTap: (){
                           context.router.pushNamed(RouterPath.paasbook_path);  
                          },
                          child: Container(
                            width: swidth/3.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: sandleColor
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(child: TextViewSmall(title: '${d?.viewPassbook??'View PassBook'}',textcolor: blackColor,fontWeight: FontWeight.bold,fontSizes: ApiConstant.langCode=='ta'?9.sp:null)),
                            ),
                          ),
                        ),
                       
                      ],
                    )
                   ],),
               )
              
      
             ],
           ))
         ],
        ),
    ):Container();
  }
}

