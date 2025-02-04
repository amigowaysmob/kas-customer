import 'package:flutter/material.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/widgets/text_view_large.dart';

class PlanNameWidget extends StatelessWidget {
  String? title;
  PlanNameWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return  TextViewLarge(title: title,textcolor: appColor,fontWeight: FontWeight.bold,);
  }
}