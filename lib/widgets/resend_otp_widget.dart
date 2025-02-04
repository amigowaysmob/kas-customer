import 'dart:async';
import 'dart:ui';

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
 
  void _listenOtp() async {
    await SmsAutoFill().listenForCode();
    print("OTP Listen is called");
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

      return () => timer.value?.cancel();
    }, []);

    return TextViewSmall(title:"00 : ${timeLeft.value}s",textcolor: appColor,fontWeight: FontWeight.bold,);
  }
}
