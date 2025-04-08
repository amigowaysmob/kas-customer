import 'package:flutter/material.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/widgets/text_view_large.dart';

class PlanNameWidget extends StatelessWidget {
  String? title;
  Color? color;
  PlanNameWidget({this.title,this.color});

  @override
  Widget build(BuildContext context) {
    return  TextViewLarge(title: title,textcolor:color?? appColor,fontWeight: FontWeight.bold,);
  }
}