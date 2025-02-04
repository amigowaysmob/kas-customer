import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kasnew/cubits/resend_otp_cubit.dart';
import 'package:kasnew/request_model/resend_otp_request_model.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/states/resend_otp_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/resend_otp_widget.dart';
import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/text_view_small.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';
import 'package:kasnew/widgets/toast_widget.dart';
import 'package:sms_autofill/sms_autofill.dart';

@RoutePage()
class PayOtpScreen extends HookWidget {
  final int resendWaitTime = 59;
  final String? phoneNumber;
  String? apiOtp;

  PayOtpScreen({
    super.key,
   
    this.phoneNumber,
    this.apiOtp
  });

  @override
  Widget build(BuildContext context) {
    final otpController = useTextEditingController();
  
    final canResendOtp = useState(false);
    final resendOtp = useState<String?>(null);

    void startResendTimer() {
      canResendOtp.value = false;
    }

    void resendOtpAction() {
      if (canResendOtp.value) {
        context.read<ResendOtpCubit>().login(
              ResendOtpRequestModel(phoneNumber: phoneNumber, userId: ApiConstant.userId),
            );
        startResendTimer();
      }
    }

    bool checkOTP(String otp, String? apiOTP) {
      if (apiOTP == otp) {
        return true;
      }
      else{
      ToastWidget(message: "Invalid OTP").build(context);
      return false;
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: TitleAppBarWidget(title: 'OTP verification',),
        body: MultiBlocListener(
          listeners: [
           
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
               
                TextViewMedium(
                  name: "OTP Verification",
                  fontWeight: FontWeight.bold,
                  textColors: appColor,
                  fontSize: 18,
                ),
                vericalSpaceMedium,
                TextViewMedium(
                  name: "Enter the OTP sent to $phoneNumber",
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
                        
                          if (checkOTP(code!, resendOtp.value ?? apiOtp)) {
                            context.router.replace(PayOthersListScreen(phoneNumber: phoneNumber));
                          } else {
                            otpController.clear();
                          }
                      
                      }
                    },
                  ),
                ),
                vericalSpaceMedium,
                if (canResendOtp.value)
                  Row(
                    children: [
                      TextViewSmall(title: "Didn't receive OTP?"),
                     InkWell(
                        onTap: resendOtpAction,
                        child: TextViewMedium(name:"Resend OTP",textColors: blackColor,fontWeight: FontWeight.w700,),
                      ),
                    ],
                  ),
                if (!canResendOtp.value)
                  ResendTimerWidget(
                    initialTime: resendWaitTime,
                    onTimerComplete: () {
                      
                      canResendOtp.value = true;
                     apiOtp=null;
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
