
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/widgets/text_view_medium.dart';



class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonName;
final Color buttonColor;
double? height;
double? width;
bool? isLeftRadius;
bool? isNoAction;
bool? isDownload;
final Widget? icon;
  ButtonWidget({
    required this.onPressed,
    required this.buttonName,
    required this.buttonColor,
    this.width,
    this.height,
    this.isLeftRadius,
    this.isNoAction,
    this.isDownload,
    this.icon
  });

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height??sheight/19,
        width:width?? swidth /1.1,
        decoration: BoxDecoration(
          color: buttonColor,
          border: Border.all(color: appColor),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(isLeftRadius==true?0:5.r),
          bottomRight: Radius.circular(5.r),
          topLeft: Radius.circular(isLeftRadius==true?0:5.r) ,topRight: Radius.circular(5.r) ,),
        ),
        child: Center(
          child:icon==null ? Text(
            
            buttonName,
            textAlign: TextAlign.center,
            style:  TextStyle(
              color: buttonColor!=appColor?appColor:whiteColor,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            
            ),
          ):Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                
                children: [
                  icon??Container(),
               
                horizontalSpaceSmall,
                TextViewMedium(name: buttonName,textColors: buttonColor!=appColor?appColor:whiteColor,
                fontSize:ApiConstant.langCode=='ta'?9:null,
                fontWeight: FontWeight.bold,)
              ],),
            ),
          )
        ),
      ),
    );
  }
}

class ButtonWidget1 extends StatelessWidget {

  final String? buttonName;
final Color? buttonColor;
double? width;
  ButtonWidget1({super.key, 
   
    required this.buttonName,
    required this.buttonColor,
    this.width
  });

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return Container(
      height: sheight / 19,
      width:width?? swidth /1.1,
      decoration: BoxDecoration(
        color: buttonColor,
        border: Border.all(color: whiteColor),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Center(
        child: Text(
          buttonName??'',
          style:  TextStyle(
            color: buttonColor!=whiteColor?whiteColor:blackColor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}



