
import 'package:flutter/material.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/text_view_small.dart';

class EligibleWidget extends StatelessWidget {
 
  String? nextDateValue;
  EligibleWidget({this.nextDateValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(color:appColor,
      borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          TextViewLarge(title: "Congratulations! 🎉 You are eligible for our Lucky Draw!",fontWeight: FontWeight.w700,),
          Container(child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: redColor,borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))),
                child: Padding(padding: EdgeInsets.all(10.0),
              child: TextViewSmall(title: "Next Lucky Draw Date",textcolor: whiteColor,),),
              ),
              Container(child:Row(children: [
                Icon(Icons.calendar_month,color: appColor,),
                TextViewSmall(title: nextDateValue,textcolor: appColor,)
              ],),)
            ],
          ),)
        ],
      ),

    );
  }
}