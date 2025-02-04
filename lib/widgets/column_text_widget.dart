import 'package:flutter/material.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/text_view_small.dart';

class ColumnTextWidget extends StatelessWidget {
  String? title;
  String? value;
  int? position;
   ColumnTextWidget({required this.title,required this.value, this.position});

  @override
  Widget build(BuildContext context) {
  double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return Container(
      width:swidth/3.5,
      child: Column(
        crossAxisAlignment: getAlign(position),
        children: [
        TextViewSmall(title:title,textcolor: blackColor,fontSizes: ApiConstant.langCode=='ta' ?10:null, ),
       
        TextViewMedium(name: value,textColors: blackColor,fontWeight: FontWeight.bold,fontSize:ApiConstant.langCode=='ta' ?10: 12,)
      ],),
    );
  }
}

CrossAxisAlignment getAlign(int? position){
  switch(position){
    case 0:
    return CrossAxisAlignment.start;
    case 1:
    return CrossAxisAlignment.center;
    case 2:
    return CrossAxisAlignment.end;
    default:
     return CrossAxisAlignment.center;
  }

}