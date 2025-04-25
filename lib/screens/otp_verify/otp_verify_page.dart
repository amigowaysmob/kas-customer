
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kasnew/cubits/con_register_cubit.dart';
import 'package:kasnew/cubits/resend_otp_cubit.dart';
import 'package:kasnew/request_model/con_register_request_model.dart';
import 'package:kasnew/request_model/resend_otp_request_model.dart';
import 'package:kasnew/router/app_router.gr.dart';

import 'package:kasnew/router/router_path.dart';

import 'package:kasnew/states/con_register_state.dart';
import 'package:kasnew/states/resend_otp_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/constants/sharedpreference_help.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/logo_widget.dart';
import 'package:kasnew/widgets/resend_otp_widget.dart';

import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/toast_widget.dart';
import 'package:sms_autofill/sms_autofill.dart';


// class OtpVerifyPage extends StatefulWidget {
//   final resendWaitTime = 59;
//   String? phoneNumber;
//   String? loginPhoneNumber;
//   ConRegisterRequestModel? conRegisterRequestModel;
//   var mobileNumber = TextEditingController();
//   String? forgotMpinOtp;
//   dynamic data;
//   bool? isForgotMpin;
//  String? loginOtp;
//  String? registerOtp;
//   String? mpinStatus;
//   String? userName;
//   OtpVerifyPage(
//       {super.key,
//       this.mpinStatus,
//       this.conRegisterRequestModel,
//       this.data,
//       this.forgotMpinOtp,
//       this.userName,
//       this.isForgotMpin = false,
//       this.loginOtp,
//       this.registerOtp,
//       this.phoneNumber,
//       this.loginPhoneNumber});

//   @override
//   State<OtpVerifyPage> createState() => _OtpVerifyPageState();
// }

// class _OtpVerifyPageState extends State<OtpVerifyPage> {
//   final GlobalKey<FormState> verifyOtpKey = GlobalKey<FormState>();
//   TextEditingController otpController = TextEditingController();
//   late SharedPreferenceHelper sharedPreferenceHelper;
// int _resendWaitTime = 59;
// String? resendOtp; // Countdown time in seconds
//   Timer? _resendTimer;
//   bool _canResendOtp = false;
//   @override
//   void initState() {
//     _listenOtp();
//      _startResendTimer();
//     super.initState();
//     sharedPreferenceHelper = SharedPreferenceHelper();
//     sharedPreferenceHelper.init();
//   }
//  void dispose() {
//     SmsAutoFill().unregisterListener();
//     print("Unregistered Listener");
//      _resendTimer?.cancel();
//     super.dispose();
//   }
//   void _listenOtp() async {
//     await SmsAutoFill().listenForCode();
//     print("OTP Listen is called");
//   }
//   bool checkOTP(String otp, String? apiOTP) {
//     if (apiOTP == otp) {
//       return true;
//     }
//     ToastWidget(message: "Invalid OTP").build(context);
//     return false;
//   }
// void _startResendTimer() {
//     setState(() {
//       _resendWaitTime = 59;
//       _canResendOtp = false;
//     });

//     _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_resendWaitTime > 0) {
//           _resendWaitTime--;
//         } else {
//           _canResendOtp = true;
//           timer.cancel();
//         }
//       });
//     });
//   }

//   void _resendOtp() {
//     if (_canResendOtp) {
      
//       // ToastWidget(message: "OTP Resent!",).build(context);
//       context.read<ResendOtpCubit>().login(ResendOtpRequestModel(phoneNumber: widget.phoneNumber,userId: ApiConstant.userId));
//       _startResendTimer(); // Restart the timer
//     }
//   }

//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//           // backgroundColor: appBackColor,
//             body: MultiBlocListener(
//               listeners: [
//                 BlocListener<ConRegisterCubit, ConRegisterState>(
//                     listener: (context, state) {
//                       print(state.networkStatusEnum);
                
//                       if (state.networkStatusEnum == NetworkStatusEnum.loaded &&
//                           state.model.text == 'Success') {
//                        sharedPreferenceHelper.saveUserID(state.model.data?.userdata?.id);
                       
//                       //  showCustomAlertDialog(context, state.model.data?.notifyImage,
//                       //   state.model.data?.notifyTitle, 
//                       //   state.model.data?.notifyBody);
                
//                        ToastWidget(
//                           message: state.model.message,
//                           color: Colors.green,
//                         ).build(context);
//                         print(widget.mpinStatus);
//                         if (widget.mpinStatus == null || widget.mpinStatus == "0") {
//                         context.router.replaceNamed(RouterPath.create_mpin_path);
//                         } else {
//                          context.router.replaceNamed(RouterPath.verify_mpin_path);
//                         }
//                       } 
//                     //  context.router.replaceAll([BottomNavigationRoute()]);
                        
//                        else if (state.networkStatusEnum == NetworkStatusEnum.loaded &&
//                           state.model.text != 'Success') {
//                         ToastWidget(message: state.model.message).build(context);
//                       }
//                     },),
//                      BlocListener<ResendOtpCubit, ResendOtpState>(
//             listener: (context, state) {
           
//       if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text=='Success') {
//    setState(() {
//      resendOtp=state.model.data.toString();
//    });
//       }
//       else if(state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text!='Success'){

//       }
//     },
//              ) ], 
//                       child:      Padding(
//                                         // MultiBlocListener(
//                                         //           listeners: [
//                                         //             BlocListener<RegisterOtpCubit, RegisterOtpState>(
//                                         //               listener: (context, state) {
//                                         //                 if (state.networkStatusEnum == NetworkStatusEnum.loaded &&
//                                         //                     state.registerOtp.text == 'Success') {
//                                         //                   sharedPreferenceHelper?.saveUserID(state.registerOtp.data!.id);
//                                         //                   String userId = sharedPreferenceHelper.getUserId;
//                                         //                   print('user id----${userId}');
//                                         //                   ToastWidget(
//                                         //                     message: state.registerOtp.message,
//                                         //                     color: Colors.green,
//                                         //                   ).build(context);
//                                         //                   Navigator.push(
//                                         //                     context,
//                                         //                     MaterialPageRoute(builder: (context) => CreateMpinScreen()),
//                                         //                   );
//                                         //                 } else if (state.networkStatusEnum == NetworkStatusEnum.loaded &&
//                                         //                     state.registerOtp.text != 'Success') {
//                                         //                   ToastWidget(message: state.registerOtp.message).build(context);
//                                         //                 }
//                                         //               },
//                                         //             ),
//                                         //             BlocListener<ForgotMpinCubit, ForgotMpinState>(
//                                         //               listener: (context,forgotMpinstate) {
//                                         //                 // Handle state changes from ForgotMpinCubit here
//                                         //                 if (forgotMpinstate.networkStatusEnum == NetworkStatusEnum.loaded &&
//                                         //                     forgotMpinstate.forgotMpin.text == 'Success') {
//                                         //                   forgotMpinOtp=forgotMpinstate.forgotMpin.otp;
//                                         //                   ToastWidget(message:forgotMpinstate.forgotMpin.message).build(context);
//                                         //                   // Navigate to appropriate screen or handle logic
//                                         //                 } else if (forgotMpinstate.networkStatusEnum == NetworkStatusEnum.loaded &&
//                                         //                     forgotMpinstate.forgotMpin.text != 'Success') {
//                                         //                   // Handle error scenario
//                                         //                   ToastWidget(message:forgotMpinstate.forgotMpin.message).build(context);
//                                         //                   // Display error message or retry logic
//                                         //                 }
//                                         //               },
//                                         //             ),
//                                         //           ],
                                        
//                                         //      child:Padding(
//                           padding: const EdgeInsets.all(20.0),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                                          LogoWidget(),
//                                         const SizedBox(
//                                           height: 20,
//                                         ),
//                                         TextViewMedium(
//                                           name: "OTP Verification",
//                                           fontWeight: FontWeight.bold,
//                                           textColors: appColor,
//                                           fontSize: 18,
//                                         ),
//                                         vericalSpaceMedium,
//                                         TextViewMedium(
//                                           name: "Enter the OTP sent to Your Mobile number",
//                                           fontWeight: FontWeight.w900,
//                                           textAlign: TextAlign.center,
//                                           textColors: appColor,
                                         
                                          
//                                         ),
//                                         vericalSpaceMedium,
                            
//                                         Padding(
//                                            padding:const EdgeInsets.symmetric(
//                                 vertical: 8.0, horizontal:40),
//                                 child: 
//                                           //  child: PinCodeTextField(
//                                           //    appContext: context,
//                                           //    length: 4,
//                                           //    obscureText: false,
//                                           //    animationType: AnimationType.fade,
//                                           //    pinTheme: PinTheme(
//                                           //      shape: PinCodeFieldShape.underline,
//                                           //      borderRadius: BorderRadius.circular(5),
//                                           //      fieldHeight: 35,
//                                           //      fieldWidth: 35, // Adjusted for less space between fields
//                                           //      activeFillColor: whiteColor,
//                                           //      inactiveFillColor:whiteColor,
//                                           //      selectedFillColor:  whiteColor,
//                                           //     activeColor:greyColor,
//                                           //      inactiveColor: greyColor,
//                                           //      selectedColor: appColor, // Focused border color
//                                           //      borderWidth: 1, 
//                                           //  // Adjust border width if needed
                                           
//                                           //    ),
                                             
//                                           //    animationDuration: Duration(milliseconds: 300),
//                                           //    keyboardType: TextInputType.number,
//                                           //    enableActiveFill: true,
                                           
//                                           //    controller: otpController,
//                                           //    textStyle: TextStyle(fontSize: 12,color: appColor), // Reduced font size
//                                           //    onCompleted: (v) {
//                                           //      print("Completed");
//                                           //    },
//                                           //    onChanged: (value) {
//                                           //      print(value);
//                                           //     otpController.text=value;
//                                           //    },
//                                           //    beforeTextPaste: (text) {
//                                           //      print("Allowing to paste $text");
//                                           //      return true;
//                                           //    },
//                                           //  ),
//                                           PinFieldAutoFill(
//                                             controller: otpController,
//                               decoration: BoxLooseDecoration(
//                                 strokeColorBuilder: PinListenColorBuilder(appColor, Colors.black26),
//                                 bgColorBuilder: const FixedColorBuilder(Colors.white),
//                                 strokeWidth:1,
//                                 textStyle: TextStyle(
//                                   fontSize: 12,
//                                   color: appColor,
//                                   fontWeight: FontWeight.w600
//                                 )
//                               ),
//                               autoFocus: true,
//                               cursor: Cursor(color: Colors.red, enabled: true, width: 1),
                              
//                               currentCode: '',
//                               onCodeSubmitted: (code) {
//                               },
//                               codeLength: 4,
//                               onCodeChanged: (code) {
//                                if(code?.length==4){
//                                  if (otpController.text.isEmpty) {
//                           ToastWidget(
//                             message: 'Please Enter OTP',
//                           );
//                         }
//                         if (widget.isForgotMpin == true) {
//                           if (checkOTP(
//                               otpController.text, widget.forgotMpinOtp.toString())) {
//                            context.router.replaceNamed(RouterPath.reset_mpin_path);
//                           } else {
//                             ToastWidget(
//                               message: 'Invalid OTP',
                             
//                             ).build;
//                             otpController.clear();
//                           }
                                        
//                         }
//                         else if(widget.registerOtp!=null && checkOTP(otpController.text, widget.registerOtp.toString())){
//                            context
//                                   .read<ConRegisterCubit>()
//                                   .login(widget.conRegisterRequestModel!);
//                         }
//                          else {
//                           if (checkOTP(
//                               otpController.text, widget.loginOtp
//                               .toString())) {
//                             if (sharedPreferenceHelper.getMpinStatus == '1') {
                             
//                              context.router.replaceNamed(RouterPath.verify_mpin_path);
                                        
//                             } 
//                              else if (sharedPreferenceHelper.getMpinStatus== '0') {
                             
//                              context.router.replaceAll([CreateMpinScreen()]);
                                        
//                             } 
//                             // else {
//                             //   context
//                             //       .read<ConRegisterCubit>()
//                             //       .login(widget.conRegisterRequestModel!);
//                             // }
//                             //  context
//                             //         .read<RegisterOtpCubit>()
//                             //         .login(widget.registerOtpRequestModel);
//                           }
//                           else{
//                             otpController.clear();
//                           }
//                         }
                                            
                              
//                                }
//                               },
//                             ),
//                                           ),
//                                         vericalSpaceMedium,
//                                          _canResendOtp
//                         ? TextButton(
//                             onPressed: _resendOtp,
//                             child: Text(
//                               "Resend OTP",
//                               style: TextStyle(color: appColor),
//                             ),
//                           )
//                         : Text(
//                             "00 : $_resendWaitTime ",
//                             style: TextStyle(color: appColor),
//                           ),
//                                         // widget.loginOtp != null
//                                         //     ? TextViewSmall(title: '${widget.loginOtp}',textcolor: appColor,)
//                                         //     : TextViewSmall(title: widget.registerOtp??widget.forgotMpinOtp,textcolor: appColor,),
//                                           ButtonWidget(
//                                             onPressed: () {
                                             
//                         if (otpController.text.isEmpty) {
//                           ToastWidget(
//                             message: 'Please Enter OTP',
//                           );
//                         }
                        
//                         if (widget.isForgotMpin == true ) {
//                           if (checkOTP(
//                               otpController.text,resendOtp?? widget.forgotMpinOtp.toString())) {
//                            context.router.replaceNamed(RouterPath.reset_mpin_path);
//                           } else {
//                             ToastWidget(
//                               message: 'Invalid OTP',
                             
//                             ).build;
//                           }
                                        
//                         }
//                         else if(widget.registerOtp!=null && checkOTP(otpController.text,resendOtp?? widget.registerOtp.toString())){
//                            context
//                                   .read<ConRegisterCubit>()
//                                   .login(widget.conRegisterRequestModel!);
//                         }
//                          else {
//                           if (checkOTP(
//                               otpController.text,resendOtp?? widget.loginOtp
//                               .toString())) {
//                             if (sharedPreferenceHelper.getMpinStatus == '1') {
                             
//                              context.router.replaceNamed(RouterPath.verify_mpin_path);
                                        
//                             } 
//                              else if (sharedPreferenceHelper.getMpinStatus== '0') {
                             
//                              context.router.replaceNamed(RouterPath.create_mpin_path);
                                        
//                             } 
//                             // else {
//                             //   context
//                             //       .read<ConRegisterCubit>()
//                             //       .login(widget.conRegisterRequestModel!);
//                             // }
//                             //  context
//                             //         .read<RegisterOtpCubit>()
//                             //         .login(widget.registerOtpRequestModel);
//                           }
//                         }
//                                             },
//                                             buttonName: 'Verify OTP',
//                                             buttonColor: appColor)
//                             ],
//                           ),
//                         ))));
//   }
//                     }
              
            
  

// void showCustomAlertDialog(BuildContext context,String? image,String? title,String? subtitle) {
//   showDialog(
    
//     barrierDismissible: false,
//     context: context,
//     builder: (BuildContext context) {
//        double swidth = MediaQuery.of(context).size.width;
//     double sheight = MediaQuery.of(context).size.height;
//       return AlertDialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(screenPadding),
//         ),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Image.network(
//               image!, // Replace with your image URL or use Image.asset for local images
//               // height:sheight/5,
//               // width:swidth/3,
//             ),
//            vericalSpaceMedium,
//          TextViewLarge(title: title,textcolor: appColor,fontWeight: FontWeight.bold,),
//             vericalSpaceMedium,
//            TextViewMedium(name: subtitle),
//            vericalSpaceMedium,
//           ButtonWidget(onPressed: ()async{
//   final prefs = await SharedPreferences.getInstance();
//   prefs.clear();
//             SystemNavigator.pop(); 
//           }, buttonName: 'Close', buttonColor: appColor)
//           ],
//         ),
//       );
//     },
//   );
// }
@RoutePage()
class OtpVerifyPage extends HookWidget {
  final int resendWaitTime = 59;
  final String? phoneNumber;
  final String? loginPhoneNumber;
  final ConRegisterRequestModel? conRegisterRequestModel;
   String? forgotMpinOtp;
  final dynamic data;
  final bool? isForgotMpin;
   String? loginOtp;
   String? registerOtp;
  final String? mpinStatus;
  final String? userName;
final bool? isRegister;
  final bool? isogin;
  String? userId;
  OtpVerifyPage({
    super.key,
    this.mpinStatus,
    this.conRegisterRequestModel,
    this.data,
    this.forgotMpinOtp,
    this.userName,
    this.isForgotMpin = false,
    this.loginOtp,
    this.registerOtp,
    this.phoneNumber,
    this.loginPhoneNumber,
    this.isRegister,
    this.isogin,
    this.userId
  });

  @override
  Widget build(BuildContext context) {
    final otpController = useTextEditingController();
    final sharedPreferenceHelper = useMemoized(() => SharedPreferenceHelper()..init());
    final canResendOtp = useState(false);
    final resendOtp = useState<String?>(null);
var isLoading=useState(false);
    void startResendTimer() {
      canResendOtp.value = false;
    }

    void resendOtpAction() {
      if (canResendOtp.value) {
        context.read<ResendOtpCubit>().login(
              ResendOtpRequestModel(phoneNumber: phoneNumber, userId: ApiConstant.userId,smsSignature: ApiConstant.signature),
            );
        startResendTimer();
      }
    }

    bool checkOTP(String otp, String? apiOTP) {
      if (apiOTP == otp) {
        return true;
      }
       else{
     ToastWidget(message: 'Invalid OTP',).build(context);
      return false;}
    }

    return SafeArea(
      child: Scaffold(
        body: MultiBlocListener(
          listeners: [
            BlocListener<ConRegisterCubit, ConRegisterState>(
              listener: (context, state) {
                if (state.networkStatusEnum == NetworkStatusEnum.loading){
// isLoading.value=true;
                }
              else  if (state.networkStatusEnum == NetworkStatusEnum.loaded &&
                    state.model.text == 'Success') {
                      //  isLoading.value=false;
                  sharedPreferenceHelper.saveUserID(state.model.data?.userdata?.id);
                  ToastWidget(
                    message: state.model.message,
                    color: Colors.green,
                  ).build(context);

                  if (mpinStatus == null || mpinStatus == "0") {
                    sharedPreferenceHelper.savefirstLaunch(false);
                    context.router.replaceAll([CreateMpinScreen()]);
                  } else {
                    sharedPreferenceHelper.savefirstLaunch(false);
                    context.router.replaceAll([VerifyMpinScreen()]);
                  }
                } else if (state.networkStatusEnum == NetworkStatusEnum.loaded &&
                    state.model.text != 'Success') {
                      //  isLoading.value=false;
                  ToastWidget(message: state.model.message).build(context);
                }
              },
            ),
            BlocListener<ResendOtpCubit, ResendOtpState>(
              listener: (context, state) {
                 
                if (state.networkStatusEnum == NetworkStatusEnum.loaded &&
                    state.model.text == 'Success') {
                  resendOtp.value = state.model.data.toString();
                  
                }
              },
            ),
          ],
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
IconButton(onPressed: (){
Navigator.of(context).pop();
}, icon: Icon(Icons.close))
                ],),
                LogoWidget(),
                const SizedBox(height: 20),
                TextViewMedium(
                  name: "OTP Verification",
                  fontWeight: FontWeight.bold,
                  textColors: appColor,
                  fontSize: 18,
                ),
                vericalSpaceMedium,
           phoneNumber!=null?     TextViewMedium(
                  name: "Enter the OTP sent to +91 $phoneNumber",
                  fontWeight: FontWeight.w900,
                  textAlign: TextAlign.center,
                  textColors: appColor,
                ):TextViewMedium(
                  name: "Enter the OTP sent to Your Mobile Number",
                  fontWeight: FontWeight.w900,
                  textAlign: TextAlign.center,
                  textColors: appColor,
                ),
                vericalSpaceMedium,
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
                  child: PinFieldAutoFill(
                    controller: otpController,
                    decoration: BoxLooseDecoration(
                      strokeColorBuilder: PinListenColorBuilder(appColor, Colors.black26),
                      bgColorBuilder: const FixedColorBuilder(Colors.white),
                      strokeWidth: 1,
                      textStyle: TextStyle(
                        fontSize: 12,
                        color: appColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    autoFocus: true,
                    cursor: Cursor(color: Colors.red, enabled: true, width: 1),
                    codeLength: 4,
                    onCodeChanged: (code) {
                      if (code?.length == 4) {
                        print(registerOtp);
                         print(loginOtp
                         );
                        if (isForgotMpin ?? false)
                         {
                          if (checkOTP(code!, resendOtp.value ?? forgotMpinOtp)) {
                            context.router.replaceNamed(RouterPath.reset_mpin_path);
                          } else {
                            otpController.clear();
                          }
                        } 
                        else if(isRegister??false){
                         if (
                            checkOTP(code!, resendOtp.value ?? registerOtp)) {
                              print(registerOtp);
                          context.read<ConRegisterCubit>().login(conRegisterRequestModel??ConRegisterRequestModel());
                          }
                           else {
                            otpController.clear();
                          }
                        } else if(isogin??false){
                         if (checkOTP(code!, resendOtp.value ?? loginOtp)) {
                          sharedPreferenceHelper.saveUserID(userId);
                          sharedPreferenceHelper.saveMpinStatus(mpinStatus);
                          // final mpinStatus = sharedPreferenceHelper.getMpinStatus;
                          if (mpinStatus == '1') {
                            sharedPreferenceHelper.savefirstLaunch(false);
                             context.router.replaceAll([VerifyMpinScreen()]);
                          } else if (mpinStatus == '0') {
                            sharedPreferenceHelper.savefirstLaunch(false);
                             context.router.replaceAll([CreateMpinScreen()]);
                          }
                        } else {
                          otpController.clear();
                        }}
                      }
                    },
                  ),
                ),
                vericalSpaceMedium,
                if (canResendOtp.value)
                  TextButton(
                    onPressed: resendOtpAction,
                    child: TextViewMedium(name:"Resend OTP",textColors: appColor,),
                  ),
                if (!canResendOtp.value)
                  ResendTimerWidget(
                    initialTime: resendWaitTime,
                    onTimerComplete: () {
                      
                      canResendOtp.value = true;
                      loginOtp=null;
                      forgotMpinOtp=null;
                      registerOtp=null;
                    },
                  ),
              ],
            ),          ),
        ),
      ),
    );
  }
}
