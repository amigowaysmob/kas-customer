import 'package:flutter/material.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/widgets/text_view_large.dart';

class NoDataWidget extends StatelessWidget {
  String? title;
   NoDataWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:  EdgeInsets.all(screenPadding),
        child: TextViewLarge(title: title,textcolor: appColor,fontWeight: FontWeight.w700,),
      ),
    );
  }
}