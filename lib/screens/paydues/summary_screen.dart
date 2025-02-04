import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hypersdkflutter/hypersdkflutter.dart';
import 'package:kasnew/cubits/pay_now_cubit.dart';
import 'package:kasnew/cubits/summary_cubit.dart';
import 'package:kasnew/request_model/pay_now_request_model.dart';
import 'package:kasnew/response_model/jus_payment_model.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/response_model/pay_now_model.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/router/router_path.dart';
import 'package:kasnew/screens/paydues/pay_dues_screen.dart';
import 'package:kasnew/states/pay_now_state.dart';
import 'package:kasnew/states/summary_state.dart';

import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/no_data_widget.dart';
import 'package:kasnew/widgets/row_bold_text_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/text_view_small.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';
import 'package:kasnew/widgets/toast_widget.dart';

@RoutePage()
class SummaryScreen extends HookWidget {
 PayNowRequestModel payNowRequestModel;
 SummaryScreen({required this.payNowRequestModel});

  @override
  Widget build(BuildContext context) {
     LangModel? lang=ApiConstant.language;
  
    var d=lang?.data;
    var isChecked = useState(false);
    var isLoading=useState(false);
     useEffect(() {
  context.read<SummaryCubit>().login(payNowRequestModel);
  
  // Return a cleanup function or null if none is needed
  return null;
}, []);
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
 void _onTermsOfUseTap() {
    context.router.pushNamed(RouterPath.terms_path);
  }

  void _onPrivacyPolicyTap() {
   
   context.router.pushNamed(RouterPath.privacy_path);
  }
  final hyperSDKInstance = HyperSDK();
    var isPaymentCalled = useState(false);
    var isPaymentStatus=useState(false);
    onPaymentSucces(String? paymentStatusId) {
      
      
      context.router.replaceAll([PayDueSuccessScreen(paymentStatusId:paymentStatusId)]);
      
    }

    onPaymenFailed(String? paymentStatusId) {
        
     
      context.router.push(PayDueSuccessScreen(paymentStatusId:paymentStatusId));
    }
Future<void> navigateAndDisplayJusPayPayment(BuildContext context,
       Sdkpayload? payload,String? paymentStatusId) async {
      // Navigator.push returns a Future that completes after calling
      // Navigator.pop on the Selection Screen.

     
      isPaymentCalled.value = false;

      final paymentResponse = await context.router.push<JusPayPaymentModel>(
        PaymentRouteScreen(hyperSDK: hyperSDKInstance, payload: payload));

      if (paymentResponse!.paymentSuccess == false) {
        print('paymentResponse---------------------$paymentResponse');
        onPaymenFailed(paymentStatusId);
        isPaymentStatus.value = false;
      } else {
         print('paymentResponse---------------------$paymentResponse');
       onPaymentSucces(paymentStatusId);
        isPaymentStatus.value = true;
      }
    }
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return
     Scaffold(
      appBar: TitleAppBarWidget(title:'${d?.summary?? 'Summary'}'),
      body: Padding(padding: EdgeInsets.all(screenPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextViewLarge(title: '${d?.summary??'Summary'}',textcolor: blackColor,fontWeight: FontWeight.bold,),
              Divider(),
           MultiBlocListener(
          listeners: [
            BlocListener<SummaryCubit, SummaryState>(
                    listener: (context, state) {
                   
              if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text=='Success') {
               
              }
              else if(state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text!='Success'){
            
              }
            },
            ),
             BlocListener<PayNowCubit, PayNowState>(
                    listener: (context, state) {
              if(state.networkStatusEnum == NetworkStatusEnum.loading)  {
                isLoading.value=true;
              }   
              if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text=='Success') {
                isLoading.value=false;
                ToastWidget(message: state.model.message,color: Colors.green,).build(context);
              
              // context.router.replaceAll([  PaymentStatusScreen(paymentStatusId:state.model.data?.paymentOrderId.toString())]  );
              navigateAndDisplayJusPayPayment(context,state.model.data?.sdkpayload ,
 state.model?.data?.paymentOrderId);
              //  context.router.replaceAll([PayDueSuccessScreen(paymentStatusId:state.model.data?.paymentOrderId)]);
              }
              else if(state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text!='Success'){
            isLoading.value=false;
              }
            },
            ),
            ],
          child:   BlocBuilder<SummaryCubit,SummaryState>(
             builder: (context, state) {
             if(  state.networkStatusEnum==NetworkStatusEnum.loading){
              return Center(child: CircularProgressIndicator(color: appColor,));
            }
            if( state.networkStatusEnum==NetworkStatusEnum.loaded){
              var data=state.model.data;
              return (data?.summaryData?.length??0)>0 ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    itemCount:data?.summaryData?.length ,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder:( context,mainindex){
                    var nameData=data?.summaryData?[mainindex];
                          return Column(
                            children: [
                  ListView.builder(
                           itemCount:nameData?.dueItems?.length ,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context,subindex){
                          var subData=nameData?.dueItems?[subindex];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
               nameData?.passbookNumber!=null&& (nameData?.passbookNumber?.isNotEmpty??false)?      RowBoldTextWidget(title: 'Passbook Number', value: nameData?.passbookNumber,isNoPadding: true,):Container(),
                    TextViewMedium(name:nameData?.planName,fontWeight: FontWeight.bold,textColors: appColor, ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      TextViewSmall(title:subData?.date ),
                      TextViewSmall(title:'₹${ subData?.amount}')
                    ],),
                   
                    vericalSpaceSmall,
                   
                  ],
                            ),
                          );
                  }),
                  
                            ],
                          );
                          
                  }),
                  vericalSpaceMedium,
                  Divider(height: 3,),
                  vericalSpaceMedium,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextViewSmall(title:'${d?.totalPayable?? 'Total Payable'}'),
                        BigAmountWidget(rupees: data?.totalAmount)
                      ],
                    ), 
                ],
              ):NoDataWidget(title: '${d?.noSummaryData??'No Summary Data'}');
              }
              else{
                return NoDataWidget(title: '${d?.noSummaryData??'No Summary Data'}');
              }
              
          
            }),
          ),
          
          //  FormField<bool>(
          //             initialValue: isChecked.value,
          //             validator: (value) {
          //               if (!isChecked.value) {
          //                 return 'You must agree to the terms and conditions';
          //               }
          //               return null;
          //             },
          //             builder: (formFieldState) {
          //         return Column(
          //           children: [
          //             Row(
          //               children: [
          //                 Checkbox(
          //                     value: isChecked.value,
          //                     onChanged: (value) {
          //                       isChecked.value = value!;
          //                     }),
          //                Expanded(
          //                         child: RichText(
          //                           text: TextSpan(
          //                             style: TextStyle(color: Colors.black),
          //                             children: [
          //                               TextSpan(text: 'I agree to the ',style: TextStyle(color: appColor,fontSize: 14.sp, fontFamily: 'Monoserrat')),
          //                               TextSpan(
          //                                 text: 'Terms of Use',
          //                                 style: TextStyle(
          //                                   decoration: TextDecoration.underline,
          //                                   color:appColor,
          //                                   fontWeight: FontWeight.bold,
          //                                   fontFamily: 'Monoserrat'
          //                                 ),
          //                                 recognizer: TapGestureRecognizer()
          //                                   ..onTap = _onTermsOfUseTap,
          //                               ),
          //                               TextSpan(text: '  and  ',style: TextStyle(color: appColor, fontFamily: 'Monoserrat')),
          //                               TextSpan(
          //                                 text: 'Privacy Policy',
          //                                 style: TextStyle(
          //                                  color:appColor,
          //                                   fontWeight: FontWeight.bold,
          //                                     decoration: TextDecoration.underline,
          //                                      fontFamily: 'Monoserrat'
          //                                 ),
          //                                 recognizer: TapGestureRecognizer()
          //                                   ..onTap = _onPrivacyPolicyTap,
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                       ),
          //               ],
          //             ),
          //              if (formFieldState.hasError)
          //                     Padding(
          //                       padding: const EdgeInsets.only(top: 5.0),
          //                       child: Text(
          //                         formFieldState.errorText!,
          //                         style: TextStyle(color: Colors.red),
          //                       ),
          //                     ),
          //           ],
          //         );},
          //       )
          ],
          
          ),
        ),
      ),),
      bottomNavigationBar:isLoading.value!=true? ButtonWidget(onPressed: (){
         if (formKey.currentState!.validate() ) {
     
        context.read<PayNowCubit>().login(payNowRequestModel);
        }
      }, buttonName: '${d?.payNow??'Pay Now'}', buttonColor: appColor):Container(
        height:sheight/17 ,
        child: CircularWidgetC()),
    );
  }
}