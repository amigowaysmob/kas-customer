import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypersdkflutter/hypersdkflutter.dart';
import 'package:kasnew/cubits/stepper_cubit.dart';
import 'package:kasnew/cubits/stepper_form_cubit.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/request_model/stepper_form_request_model.dart';
import 'package:kasnew/response_model/jus_payment_model.dart';
import 'package:kasnew/response_model/stepper_form_model.dart';
import 'package:kasnew/response_model/stepper_model.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/screens/add_customer/step_form3.dart';
import 'package:kasnew/screens/add_customer/step_form4.dart';
import 'package:kasnew/states/stepper_form_state.dart';
import 'package:kasnew/states/stepper_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/constants/sharedpreference_help.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/text_view_small.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';
import 'package:kasnew/widgets/toast_widget.dart';
@RoutePage()
class ExistStepperScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    
    final currentStep = useState(0);
    final formKeys = List.generate(4, (_) => useMemoized(() => GlobalKey<FormState>()));
    final formData = useMemoized(() => StepperFormRequestModel());
    final sharedPreferenceHelper = useState<SharedPreferenceHelper?>(null);
    final isSubmit = useState(false);
    LangData langData = LangData();

   useEffect(() {
  context.read<StepperCubit>().login(HomeRequestModel(
    userId: ApiConstant.userId,
    lang: ApiConstant.langCode,
  ));
  
  // Return a cleanup function or null if none is needed
  return null;
}, []);


    Future<void> _submitAllData(StepperFormRequestModel data) async {
      formData.userid = ApiConstant.userId;
      context.read<StepperFormCubit>().login(data);

      print('API call with all data: ${data.toJson()} completed');
    }

    void _onStepContinue() {
      final formKey = formKeys[currentStep.value];
      final formState = formKey.currentState;

      if (currentStep.value == 0) {
        currentStep.value += 1;
      }

      if (formState != null && formState.validate()) {
        formState.save();
        if (currentStep.value < 1) {
          currentStep.value += 1;
        }
      } else {
        formState?.validate();
      }
    }

    void _onSubmit() async {
      final formKey = formKeys[currentStep.value];
      final formState = formKey.currentState;

      if (formState != null && formState.validate() && isSubmit.value == false) {
       
        formState.save();
        isSubmit.value = true;
        await _submitAllData(formData);
        // isSubmit.value = false; // Reset after submission
      } else {
        formState?.validate();
      }
    }

    void _onStepCancel() {
      if (currentStep.value > 0) {
        currentStep.value -= 1;
      }
    }
void _goToStep1() {
    
      currentStep.value =0;
 
  }
  void _goToStep2() {
    
      currentStep.value =0;
 
  }
   void _goToStep4() {
    
      currentStep.value =1;
 
  }
    void _onStepTapped(int step) {
      if (step < currentStep.value) {
        currentStep.value = step;
      }
    }

    Future<bool?> _showDialog(BuildContext context, String? title, String? ok, String? no,String? type,String?orderId) {
     
      return showDialog<bool>(
        barrierDismissible:type!='exit'?false:true,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title??''),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                 if( type=='exit'){
                  context.router.pop(true);}
                   else
                    {
                      
                      context.router.pop();
                       
                        // context.router.replace(BottomNavigationRoute()); 
                   context.router.replace(GiftScreen(orderId:orderId ));
                   }
                  // Return true
                },
                child: TextViewMedium(name: ok, textColors: appColor),
              ),
              ButtonWidget(
                onPressed: () {
                   if( type=='exit'){
                 
                 context.router.pop(false);}
               else  {
                  context.router.pop();
                  //  context.router.replace(BottomNavigationRoute()) ;
                 context.router.replace(ReceiptScreen(giftid: orderId));
                 } // Return false
                },
                buttonName: no??'',
                buttonColor: appColor,
                width: 100.w,
              ),
            ],
          );
        },
      );
    }

    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
final hyperSDKInstance = HyperSDK();
    var isPaymentCalled = useState(false);
    var isPaymentStatus=useState(false);
    onPaymentSucces(String? orderId,String? paymentStatusId,) {
      
      
      context.router.replaceAll([PaymentStatusScreen(giftid:orderId,
 paymentStatusId: paymentStatusId )]);
      
    }

    onPaymenFailed(String? orderId,String? paymentStatusId) {
        
      
     context.router.replaceAll([PaymentStatusScreen(giftid:orderId,
 paymentStatusId: paymentStatusId )]);
    }
Future<void> navigateAndDisplayJusPayPayment(BuildContext context,
       Sdkpayload? payload,String? orderId,String? paymentStatusId) async {
      // Navigator.push returns a Future that completes after calling
      // Navigator.pop on the Selection Screen.

     
      isPaymentCalled.value = false;

      final paymentResponse = await context.router.push<JusPayPaymentModel>(
        PaymentRouteScreen(hyperSDK: hyperSDKInstance, payload: payload));

      if (paymentResponse!.paymentSuccess == false) {
        print('paymentResponse---------------------$paymentResponse');
        onPaymenFailed(orderId,paymentStatusId);
        isPaymentStatus.value = false;
      } else {
         print('paymentResponse---------------------$paymentResponse');
       onPaymentSucces(orderId,paymentStatusId);
        isPaymentStatus.value = true;
      }
    }
    return
     MultiBlocListener(
      listeners:[ BlocListener<StepperCubit, StepperState>(
        listener: (context, state) {
          // Handle state changes
        },),
         BlocListener<StepperFormCubit, StepperFormState>(
        listener: (context, state) {
         if(state.networkStatusEnum==NetworkStatusEnum.loaded&& state.model.text=='Success'){
// context.router.replace(ReceiptScreen(giftid:state.model.data?.orderId.toString() )); 
// customer: state.model.message));
// _showDialog(context, langData?.doYouWantGift,  langData?.yes,
//                       langData?.no,'submit',state.model.data?.orderId.toString());
 navigateAndDisplayJusPayPayment(context,state.model.data?.sdkpayload , state.model.data?.orderId.toString(),
 state.model?.data?.paymentOrderId); 
// context.router.replace(PaymentStatusScreen(giftid:state.model.data?.orderId.toString(),
//  paymentStatusId: state.model.data?.paymentOrderId ));                       
         }
else if(state.networkStatusEnum==NetworkStatusEnum.loaded&& state.model.text!='Success'){
  ToastWidget(message: state.model.message,).build(context);
}
        },
     )],
        child: BlocBuilder<StepperCubit, StepperState>( 
        builder: (context, state) {
          if (state.networkStatusEnum == NetworkStatusEnum.loading) {
            return CircularWidgetS();
          } else if (state.networkStatusEnum == NetworkStatusEnum.loaded) {
            langData = state.model.data!.langData!;
            return WillPopScope(
              onWillPop: () async {
                if (isSubmit.value) {
                  return false; // Disable back button during submission
                }
                return await _showDialog(
                      context,
                      langData?.leaveCustomerForm,
                      langData?.yes,
                      langData?.no,
                      'exit',
                      ''
                    ) ??
                    false;
              },
              child: Stack(
                children: [
                  Scaffold(
                    appBar: TitleAppBarWidget(title: 'Customer Form'),
                    body: Column(
                      children: [
                        Expanded(
                          child: Theme(
                            data: ThemeData(
                              colorScheme: Theme.of(context).colorScheme.copyWith(
                                    primary: appColor,
                                    secondary: Colors.green,
                                  ),
                            ),
                            child: Stepper(
                              type: StepperType.horizontal,
                              currentStep: currentStep.value,
                              onStepTapped: _onStepTapped,
                              controlsBuilder: (BuildContext context, ControlsDetails details) {
                                // Custom controls
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (currentStep.value > 0)
                                        ButtonWidget(
                                          onPressed: _onStepCancel,
                                          buttonColor: whiteColor,
                                          buttonName: state.model.data?.langData?.back ?? '',
                                          width: swidth / 3,
                                        ),
                                      if (currentStep.value < 1)
                                        ButtonWidget(
                                          onPressed: _onStepContinue,
                                          buttonColor: appColor,
                                          buttonName: state.model.data?.langData?.next ?? '',
                                          width: swidth / 3,
                                        ),
                                      if (currentStep.value == 1)
                                        ButtonWidget(
                                          onPressed: _onSubmit,
                                          buttonColor: isSubmit.value ? Colors.green : appColor,
                                          buttonName: isSubmit.value ? 'Submitting..' : state.model.data?.langData?.submit ?? '',
                                          width: swidth / 3,
                                        ),
                                    ],
                                  ),
                                );
                              },
                              steps: [
                               
                                Step(
                                  title: TextViewSmall(title: ''),
                                  content: StepForm3(
                                    formKey: formKeys[0],
                                    formData: formData,
                                    data: state.model.data,
                                    langData: state.model.data?.langData,
                                    isExists: true,
                                    goToStep4:_goToStep4,
                                  ),
                                  isActive: currentStep.value >= 1,
                                  state: currentStep.value == 1 ? StepState.indexed : StepState.complete,
                                ),
                                Step(
                                  title: TextViewSmall(title: ''),
                                  content: Step4Form(
                                    formKey: formKeys[1],
                                    formData: formData,
                                    data: state.model.data,
                                    langData: state.model.data?.langData,
                                  
                                    goToStep1: _goToStep1,
                                    goToStep2: _goToStep2,
                                    isExists: true,
                                  ),
                                  isActive: currentStep.value >= 1,
                                  state: currentStep.value == 1 ? StepState.indexed : StepState.complete,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isSubmit.value)
                    ModalBarrier(
                      dismissible: false,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  if (isSubmit.value)
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            );
          } else {
            return CircularWidgetS();
          }
        },
           ),
     );
  }
}
