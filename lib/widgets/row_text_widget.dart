import 'package:flutter/material.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/text_view_small.dart';

class RowTextWidget extends StatelessWidget {
  String? title;
  String? value;
   RowTextWidget({required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      TextViewSmall(title:'$title : ',textcolor: blackColor,),
TextViewMedium(name: value,fontWeight: FontWeight.bold,textColors: blackColor,fontSize: 13,)
    ],);
  }
}