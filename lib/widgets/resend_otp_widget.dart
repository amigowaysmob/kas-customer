import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/widgets/text_view_small.dart';
import 'package:sms_autofill/sms_autofill.dart';

class ResendTimerWidget extends HookWidget {
  final int initialTime;
  final VoidCallback onTimerComplete;

  const ResendTimerWidget({
    required this.initialTime,
    required this.onTimerComplete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timeLeft = useState(initialTime);
    final timer = useRef<Timer?>(null);
 
 void _listenOtp() {
      SmsAutoFill().listenForCode().then((_) {
        SmsAutoFill().code.listen((otp) {
          print("Received OTP: $otp");
        }).onError((error) {
          print("Error listening for OTP: $error");
        });
      });
    }

  
    useEffect(() {
        _listenOtp();
      timer.value = Timer.periodic(const Duration(seconds: 1), (t) {
        if (timeLeft.value > 0) {
          timeLeft.value -= 1;
        } else {
          t.cancel();
          onTimerComplete();
        }
      });

    return () {
        // Clean up the timer
        timer.value?.cancel();
        
        // Stop listening for OTP
        SmsAutoFill().unregisterListener();
        print("OTP Listener disposed");
      };
    }, []);

    return TextViewSmall(title:"00 : ${timeLeft.value}s",textcolor: appColor,fontWeight: FontWeight.bold,);
  }
}
