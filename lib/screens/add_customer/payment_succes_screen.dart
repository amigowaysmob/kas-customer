

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/cubits/home_cubit.dart';
import 'package:kasnew/cubits/ledger_cubit.dart';
import 'package:kasnew/cubits/payment_status_cubit.dart';
import 'package:kasnew/cubits/trans_cubit.dart';
import 'package:kasnew/cubits/view_profile_cubit.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/request_model/payment_status_request_model.dart';
import 'package:kasnew/request_model/trans_request_model.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/states/payment_status_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';
@RoutePage()
class PaymentStatusScreen extends StatefulWidget {
  
  String? giftid;
  String? paymentStatusId;
  
   PaymentStatusScreen({ this.giftid,this.paymentStatusId});

  @override
  State<PaymentStatusScreen> createState() => _PaymentStatusScreenState();
}

class _PaymentStatusScreenState extends State<PaymentStatusScreen> {
  @override
  void initState() {
    super.initState();
    
  
     context.read<PaymentStatusCubit>().login(PaymentStatusRequestModel(
      userId: ApiConstant.userId,
      lang: ApiConstant.langCode,
      paymentOrderId:widget.paymentStatusId,
      transactionData: '',
      orderId: widget.giftid));

    
  }
  
  Widget build(BuildContext context) {
     double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
  return 
    BlocConsumer<PaymentStatusCubit, PaymentStatusState>(
            listener: (context, state) {
           
      if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text=='Success') {
   context.read<HomeCubit>().login(HomeRequestModel(userId: ApiConstant.userId,lang: ApiConstant.langCode));
     context.read<LedgerCubit>().login(HomeRequestModel(userId: ApiConstant.userId,
    lang: ApiConstant.langCode,));
     context.read<TransCubit>().login(TransRequestModel(
    userId: ApiConstant.userId,
    lang: ApiConstant.langCode,
   
   
  ));
   context.read<ViewProfileCubit>().login(HomeRequestModel(userId: ApiConstant.userId,lang: ApiConstant.langCode));
      }
      else if(state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text!='Success'){

      }
    },
     builder: (context, state) {
     if(  state.networkStatusEnum==NetworkStatusEnum.loading){
      return Center(child: CircularProgressIndicator(color: appColor,));
    }
    if( state.networkStatusEnum==NetworkStatusEnum.loaded){
      var data=state.model.data;
    
    return
    Scaffold(
      appBar: TitleAppBarWidget(title:data?.paymentStatus==true?'Payment Success':"Payment Failure"),
      body: Padding(
        padding: EdgeInsets.all(screenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
       Image.network(data?.paymentStatusIcon??'',height:sheight/3,width:swidth),
        vericalSpaceLarge,
        TextViewLarge(title:state.model.message,textcolor: blackColor,fontWeight: FontWeight.w700,),
        vericalSpaceLarge,
         ButtonWidget(onPressed: ()async{
                  
                  
          data?.paymentStatus==true?     data?.navigateGift==1?  
               context.router.replaceAll([GiftScreen(orderId: widget.giftid)]):
           context.router.replaceAll([ReceiptScreen(giftid: widget.giftid)]):context.router.replaceAll([BottomNavigationRoute()]);
                  
                }, buttonName:'Next', buttonColor: appColor,),
             
          ],
        ),
      ),
    );
  }
  else{
    return CircularWidgetS();
  }
  }
  );}}
