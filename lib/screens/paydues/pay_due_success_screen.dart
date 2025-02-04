import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/cubits/due_payment_status_cubit.dart';
import 'package:kasnew/cubits/home_cubit.dart';
import 'package:kasnew/cubits/ledger_cubit.dart';
import 'package:kasnew/cubits/trans_cubit.dart';
import 'package:kasnew/request_model/due_payment_status_request_model.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/request_model/trans_request_model.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/router/router_path.dart';
import 'package:kasnew/states/pay_due_payment_status_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';

import '../../utils/constants/api_constants.dart';

@RoutePage()
class PayDueSuccessScreen extends StatefulWidget {
  
  String? giftid;
  String? paymentStatusId;
  
   PayDueSuccessScreen({ this.giftid,this.paymentStatusId});

  @override
  State<PayDueSuccessScreen> createState() => _PayDueSuccessScreenState();
}

class _PayDueSuccessScreenState extends State<PayDueSuccessScreen> {
  @override
  void initState() {
    super.initState();
    
 
     context.read<DuePaymentStatusCubit>().login(DuePaymentStatusRequestModel(
      userId: ApiConstant.userId,
      lang: ApiConstant.langCode,
      paymentOrderId:widget.paymentStatusId,
      transactionData: '',
     ));

    
  }
  
  Widget build(BuildContext context) {
     LangModel? lang=ApiConstant.language;
  
    var d=lang?.data;
  return 
    BlocConsumer<DuePaymentStatusCubit, DuePaymentStatusState>(
            listener: (context, state) {
           
      if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text=='Success') {
    context.read<HomeCubit>().login(HomeRequestModel(userId: ApiConstant.userId,lang: ApiConstant.langCode));
     context.read<LedgerCubit>().login(HomeRequestModel(userId: ApiConstant.userId,
    lang: ApiConstant.langCode,));
     context.read<TransCubit>().login(TransRequestModel(
    userId: ApiConstant.userId,
    lang: ApiConstant.langCode,
   
   
  ));
      }
      else if(state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text!='Success'){

      }
    },
     builder: (context, state) {
     if(  state.networkStatusEnum==NetworkStatusEnum.loading){
      return CircularWidgetS();
    }
    if( state.networkStatusEnum==NetworkStatusEnum.loaded){
      var data=state.model.data;
    
    return
    Scaffold(
      appBar: TitleAppBarWidget(title:data?.paymentStatus==true?'${d?.paymentSuccess??'Payment Success'}':'${d?.paymentFailure??"Payment Failure"}'),
      body: Padding(
        padding: EdgeInsets.all(screenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
       Image.network(data?.paymentStatusIcon??''),
        vericalSpaceLarge,
        TextViewLarge(title:state.model.message,textcolor: blackColor,fontWeight: FontWeight.w700,),
        vericalSpaceLarge,
         ButtonWidget(onPressed: ()async{
                  
                  
               context.router.replaceNamed(RouterPath.bottom_path);
                  
                }, buttonName:'${d?.next??'Next'}', buttonColor: appColor,),
             
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
