import 'package:flutter/material.dart';
import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/text_view_small.dart';

class FaqWidget extends StatelessWidget {
  String? title;
  String? value;
   FaqWidget({this.title,this.value});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextViewMedium(name:title,fontWeight: FontWeight.bold,),
      TextViewSmall(title: value),
    ],);
  }
}