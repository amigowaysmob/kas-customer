import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpFieldWidget extends StatelessWidget {
  TextEditingController? controller;
  void Function(String)? onChanged;
 OtpFieldWidget({this.controller,this.onChanged});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
               appContext: context,
               length: 4,
               obscureText: false,
               animationType: AnimationType.fade,
               pinTheme: PinTheme(
                 shape: PinCodeFieldShape.box,
                 borderRadius: BorderRadius.circular(5),
                 fieldHeight: 45,
                 fieldWidth: 45, // Adjusted for less space between fields
                 activeFillColor: whiteColor,
                 inactiveFillColor: whiteColor,
                 selectedFillColor: whiteColor,
                 
                activeColor:greyColor,
                 inactiveColor: greyColor,
                 selectedColor: appColor, // Focused border color
                 borderWidth: 0.5, 
             // Adjust border width if needed
               ),
               
               animationDuration: Duration(milliseconds: 200),
               keyboardType: TextInputType.number,
               enableActiveFill: true,
             inputFormatters: [ FilteringTextInputFormatter.digitsOnly,],
               controller: controller,
               textStyle: TextStyle(fontSize: 12), // Reduced font size
               onCompleted: (v) {
                 
               },
               onChanged: onChanged,
               beforeTextPaste: (text) {
                 print("Allowing to paste $text");
                 return true;
               },
             );
  }
}