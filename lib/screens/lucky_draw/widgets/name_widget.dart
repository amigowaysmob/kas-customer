
import 'package:flutter/material.dart';
import 'package:kasnew/widgets/text_view_medium.dart';

class NameWidget extends StatelessWidget {
  String? title;
  NameWidget({this.title});

  @override
  Widget build(BuildContext context) {
     double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return Container(
      width: swidth/2,
      child: TextViewMedium(name: title,fontWeight: FontWeight.bold,));
  }
}