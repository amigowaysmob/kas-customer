import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/cubits/chit_close_cubit.dart';
import 'package:kasnew/cubits/ledger_detail_cubit.dart';
import 'package:kasnew/request_model/chit_close_request%20mode.dart';
import 'package:kasnew/request_model/ledger_detail_request_model.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/response_model/ledger_detail_model.dart';
import 'package:kasnew/screens/paydues/pay_dues_screen.dart';
import 'package:kasnew/states/chit_close_cubit.dart';
import 'package:kasnew/states/ledger_detail_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/column_text_widget.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/no_data_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/text_view_small.dart';

import 'package:kasnew/widgets/title_app_bar_widget.dart';
import 'package:kasnew/widgets/toast_widget.dart';
@RoutePage()
class LedgerDetailScreen extends StatefulWidget {
  String? id;
bool? isChit;
 LedgerDetailScreen({required this.id,this.isChit});

  @override
  State<LedgerDetailScreen> createState() => _LedgerDetailScreenState();
}

class _LedgerDetailScreenState extends State<LedgerDetailScreen> {
   @override
  void initState() {
    super.initState();
    context.read<LedgerDetailCubit>().login(LedgerDetailRequestModel(userId: ApiConstant.userId,
    lang: ApiConstant.langCode,id:widget.id,chitCloseDetail: widget.isChit==true?"1" :""));
  }
 LangModel? lang=ApiConstant.language;
  Widget build(BuildContext context) {
    var d=lang?.data;
    Widget _icon(int? status) {
  if(status==0)
  return Icon( Icons.remove);
  else if (status==1)
    return Icon(  Icons.check_circle_outline,color: Colors.green,);
    else 
    return Icon( Icons.cancel_outlined,color: Colors.red,); 
  
}
      double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: TitleAppBarWidget(title:widget.isChit==true?'${d?.chitClosingStatus??'Chit Closing Status'}': '${d?.ledgerDetail??'Ledger Detail'}'),
      body:  BlocConsumer<LedgerDetailCubit, LedgerDetailState>(
      listener: (context, state) {
        if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text == 'Success') {
          // Handle success case
        } else if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text != 'Success') {
          // Handle other loaded case
        }
      },
      builder: (context, state) {
        if (state.networkStatusEnum == NetworkStatusEnum.loading) {
          return CircularWidgetC();
        }
        if (state.networkStatusEnum == NetworkStatusEnum.loaded) {
        
          var cData=state.model.data?.ledgerData;
          var tData=state.model.data?.transactionData;
       return SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.all(5),
           child: Column(
            children: [


              // Image.asset('assets/images/ledge_card.png',),
                Card(
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
                                                                 ColumnTextWidget(title: '${d?.installmentsPaid??'Installments Paid'}',
                                                                  value: cData?.installmentsPaid,position: 2,)
                                             ],
                             ),
                               vericalSpaceMedium,
                              Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                ColumnTextWidget(title: '${d?.payableAmount??'Payable Amount'}', value:cData?.payableAmount!='-' ?'₹${  cData?.payableAmount}':'${  cData?.payableAmount}',position: 0,),
                                                                  ColumnTextWidget(title: '${d?.paidAmount??'Paid Amount'}', value:
                                                   cData?.paidAmount!='-' ?  '₹${ cData?.paidAmount}':'${ cData?.paidAmount}',position: 1,),
                                                                   ColumnTextWidget(title: '${d?.balanceAmount??'Balance Amount'}', value:cData?.pendingAmount!='-'? '₹${  cData?.pendingAmount}':'${  cData?.pendingAmount}',position: 2,),
                                                                   
                                              ],
                              ),
                               vericalSpaceMedium,
                              Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                                  ColumnTextWidget(title: '${d?.joiningDate??'Joining Date'}', value: cData?.planStarted,position: 0,),
                                                                   ColumnTextWidget(title: '${d?.maturityDate??'Maturity Date'}', value: cData?.maturityDate,position: 1,),
                                                                    ColumnTextWidget(title: '${d?.lapseDate??'Lapse Date'}', value: cData?.lapseDate,position: 2,)
                                              ],
                                                                       )
                      
                       ],
                      ),
                    ),
                  ),
                ),(tData?.length??0)>0? Card(
                  elevation: 5,
                  child: Column(children: [
         TextViewLarge(title: '${d?.transactions??'Transactions'}',textcolor: blackColor,fontWeight: FontWeight.w700,),
          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                           Container(),
                           
                            
                             
                             
                          ]),
            Scrollbar(
              child: ListView.builder(
             shrinkWrap: true,
               
               scrollDirection: Axis.vertical,
             
                     physics: NeverScrollableScrollPhysics(),
                     itemCount:tData?.length,
                     itemBuilder: (context,index){
                       var tdataa= tData?[index];
                     
                     
                     return Column(
                       children: [
            
                  Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                              SizedBox(
                                                width: swidth*0.1,
                                                child: Column(
                                                  children: [
                                                 index==0?    TextViewMedium(name: 'S.No',textColors: appColor,fontWeight: FontWeight.bold,):Container(),
                                                    Padding(
                                                      padding:  EdgeInsets.only(bottom:5.0,right: 8.0,left: 8.0,top:3),
                                                      child: TextViewMedium(name:tdataa?.sNo, fontWeight: FontWeight.w700,),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // horizontalSpaceSmall,
                                              // Column(
                                              //   children: [
                                              //   index==0?       TextViewMedium(name: 'Status'):Container(),
                                              //     _icon(tdataa?.paidStatus),
                                              //   ],
                                              // ),
                                             SizedBox(
                                                width: swidth*0.3,
                                                child: Column(
                                                  children: [
                                                                                             index==0?          TextViewMedium(name: '${d?.date??'Date'}',textColors: appColor,fontWeight: FontWeight.bold):Container(),
                                                     Padding(
                                                      padding:  EdgeInsets.only(bottom:5.0,right: 8.0,left: 8.0,top:3),
                                                      child: TextViewMedium(name:tdataa?.date ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                 width: swidth*0.2,
                                                child: Column(
                                                  children: [
                                                index==0?          TextViewMedium(name:'${d?.amount?? 'Amount'}',textColors: appColor,fontWeight: FontWeight.bold):Container(),
                                                      Padding(
                                                      padding:  EdgeInsets.only(bottom:5.0,right: 8.0,left:index==0? 10: 8.0,top:3),
                                                        child: TextViewMedium(name:'₹${ tdataa?.amount}'),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            SizedBox(
                                                 width: swidth*0.3,
                                               child: Column(
                                                  children: [
                                                index==0?          TextViewMedium(name: '${d?.installment??'Installment'}',textColors: appColor,fontWeight: FontWeight.bold):Container(),
                                                      Padding(
                                                      padding:  EdgeInsets.only(bottom:5.0,right: 8.0,left: 8.0,top:3),
                                                      child: TextViewMedium(name: tdataa?.installmentNo),
                                                    ),
                                                  ],
                                                ),
                                             ),
                                              
                                                ],
                                              ),
                  Divider()
               ],
             );
                       
               
                       
                       
               
              }),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //   Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: RowBoldTextWidget(title: 'Grand Total', value: '₹${state.model.data?.totalAmount}'),
            //   )
            // ],),
            Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround, // Ensures alignment matches the list
  children: [
    SizedBox(width: swidth * 0.15), // Matches S.No column width
    SizedBox(width: swidth * 0.28,
    child: TextViewMedium(name: 'Grand Total',fontWeight: FontWeight.w700,),), // Matches Date column width
    SizedBox(
      width: swidth * 0.2, // Matches Amount column width
      child: Align(
        alignment: Alignment.center,
        child: TextViewLarge(
          title: '₹${state.model.data?.totalAmount}',
          fontWeight: FontWeight.w700,
          textcolor: appColor,
        ),
      ),
    ),
    SizedBox(width: swidth * 0.3), // Matches Installment column width
  ],
),

            vericalSpaceSmall,
   widget.isChit==true?    cData?.chitStatus=='-' ?    Row(
        mainAxisAlignment: MainAxisAlignment.end,
         children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: ButtonWidget(onPressed: (){
              showChitCloseDialog(context,cData: cData,id: widget.id);
             }, buttonName: d?.closechit??'Close Chit', buttonColor: appColor,width: swidth/3,),
           ),
         ],
       ):
       Row(
        mainAxisAlignment: MainAxisAlignment.end,
         children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(children: [
              RowTextWidget(title: '${d?.chitClosingStatus??'Chit Close Status'}', value: cData?.chitStatus=='0'?'Pending':'Closed')
             ],),
           ),
         ],
       ):Container()
                 ],),):NoDataWidget(title:'${d?.noTransactionData?? 'No Transactions!!'}')
            ],),
         ),
       );
  }
  else{
    return CircularWidgetS();
  }
  })
    );
  }
}


void showChitCloseDialog(BuildContext context,
      { LedgerData? cData,String? id }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
         double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
        return AlertDialog(
         
          content:BlocConsumer<ChitCloseCubit, ChitCloseState>(
      listener: (context, state) {
        if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text == 'Success') {
          
          
          context.read<LedgerDetailCubit>().login(LedgerDetailRequestModel(userId: ApiConstant.userId,
    lang: ApiConstant.langCode,id:id,chitCloseDetail: "1"));
         Navigator.of(context).pop();
         showSuccesAlert(context,state.model.mesage , 'ok');
         ToastWidget(message: state.model.mesage,color: Colors.green,).build(context);
        } else if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text != 'Success') {
          // Handle other loaded case
           context.router.pop();
        }
      },
      builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //  Row(
                //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //    children: [
                //      ColumnTextWidget(title: 'Plan Amount', value: '₹${  cData?.planAmount}',position: 0,),
                                 
                //                       ColumnTextWidget(title: 'Paid Amount', value: '₹${  cData?.paidAmount}',position: 2,),
                                      
                //    ],
                //  ),
                //  vericalSpaceMedium,
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 ColumnTextWidget(title: 'Pending Amount', value: cData?.pendingAmount!="-"?'₹${  cData?.pendingAmount}':'${  cData?.pendingAmount}',position: 0,),
                //                                 ColumnTextWidget(title: 'Maturity Amount', value:
                //                                 '₹${ cData?.paidAmount}',position: 2,),
                                                 
                                                 
                //               ],
                //             ),
                //             vericalSpaceMedium,
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 ColumnTextWidget(title: 'Addition', value: '₹${  cData?.addition}',position: 0,),
                //                                 ColumnTextWidget(title: 'Deduction', value:
                //                                 '₹${ cData?.deduction}',position: 2,),
                                                 
                                                 
                //               ],
                //             ),
                //            Divider(),
                //            ColumnTextWidget(title: 'Total Amount', value:'₹${ cData?.closingAmount}'),
                          
                
                RowTextWidget(title: 'Payable Amount', value:'₹${cData?.payableAmount??'0'}' ),
                RowTextWidget(title: 'Paid Amount     ', value:'₹${cData?.paidAmount??'0'}' ),
                 RowTextWidget(title: 'Balance Amount', value: '₹${cData?.pendingAmount??'0'}'),
                
Column(
 
  children: [
    Card(
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
         border: Border.all(width: 0.5,color: greyColor) ,
         borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
          
            children: [
            RowTextWidget(title: 'Gift Status', value: cData?.giftStatus),
            RowTextWidget(title: 'Gift item', value:cData?.giftName!=null && (cData?.giftName?.isNotEmpty??false)? cData?.giftName:'-'),
            RowTextWidget(title: 'Gift value', value:cData?.giftAmount!=null && (cData?.giftAmount?.isNotEmpty??false)? cData?.giftAmount:'-')
          ],),
        ),
      ),
    ),
    vericalSpaceSmall,
     Card(
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
         border: Border.all(width: 0.5,color: greyColor) ,
         borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
          
            children: [
            RowTextWidget(title: 'Diwali pack', value:cData?.diwaliStatus!=null && (cData?.diwaliStatus?.isNotEmpty??false)? cData?.diwaliStatus:'-'),
            RowTextWidget(title: 'Pack value', value:cData?.diwaliAmount!=null && (cData?.diwaliAmount?.isNotEmpty??false)?cData?.diwaliAmount:'-'),
            
          ],),
        ),
      ),
    ),
  ],
),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            TextViewMedium(name: 'Paid Amount'),
                            vericalSpaceSmall,
                            TextViewMedium(name: 'Addition'),
                            vericalSpaceSmall,
                      
                            TextViewMedium(name: 'Deduction'),
                            
                          ],),
                          horizontalSpaceMedium,
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            TextViewMedium(name: ':'),
                            vericalSpaceSmall,
                      
                            TextViewMedium(name: ':'),
                            vericalSpaceSmall,
                      
                            TextViewMedium(name: ':'),
                            
                          ],),
                          horizontalSpaceMedium,
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            TextViewMedium(name: '₹${  cData?.paidAmount}',fontWeight: FontWeight.bold,),
                            vericalSpaceSmall,
                      
                            Row(
                              children: [
                                TextViewMedium(name: '₹${  cData?.addition}',fontWeight: FontWeight.bold,textColors: Colors.green,),
                                TextViewSmall(title: '(+)')
                              ],
                            ),
                            vericalSpaceSmall,
                      
                            Row(
                              children: [
                                TextViewMedium(name: '₹${  cData?.deduction}',fontWeight: FontWeight.bold,textColors: Colors.red),
                               TextViewSmall(title: '(-)')
                              ],
                            ),
                            
                          ],),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                         TextViewMedium(name: 'Total Amount'), 
                         horizontalSpaceSmall,
                         TextViewMedium(name: ':'),
                         horizontalSpaceSmall,
                         TextViewMedium(name:'₹${ cData?.closingAmount}',textColors: Colors.green,fontWeight: FontWeight.w700, )  
                        ],
                      ),
                      Divider(),
                    ],
                  ),
                ),
                           Column(
                            mainAxisAlignment:MainAxisAlignment.center,

                             children: [
                               TextViewMedium(name: 'Do you want to close this chit closing request?',fontWeight: FontWeight.w700,),
                             ],
                           ),  
              ],
            );}
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    context.read<ChitCloseCubit>().login(ChitCloseRequestModel(userId: ApiConstant.userId,id:id ,lang:ApiConstant.langCode));
                    // Close the dialog
                  },
                  child: TextViewLarge(title: 'Yes',textcolor: blackColor,),
                ),
                ButtonWidget(onPressed: (){
 Navigator.of(context).pop();
                }, buttonName: 'No', buttonColor: appColor,
                width: swidth/3,
                )
              ],
            ),
          ],
        );
      },
    );
  }

  void showSuccesAlert(BuildContext context,String? msg,String? ok) {
    showDialog(
        context: context,
       
        builder: (context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                  mainAxisSize: MainAxisSize
                      .min, // Ensure the dialog takes only as much space as needed
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextViewMedium(
                    name: msg,
                    fontWeight: FontWeight.w700,
                    textColors:blackColor,
                  ),
                  vericalSpaceMedium,
                          
                   
                          vericalSpaceLarge,
                         ButtonWidget(
                          width: 100,
                           buttonName: 'Ok',
                           onPressed: () {
                           context.router.pop();
                           },
                           buttonColor: appColor,
                         ),
                        
                        ],
                      ),
                    )
                  ]));
        });
  }

  

   

