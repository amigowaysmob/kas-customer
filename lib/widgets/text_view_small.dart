import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextViewSmall extends StatelessWidget{
  final String? title;
  final FontWeight? fontWeight;
  final Color? textcolor;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final double? fontSizes;

  const TextViewSmall( {Key? key,required this.title,this.fontWeight,this.textcolor,this.textAlign = TextAlign.start,this.decoration,this.fontSizes}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title?? "",style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: fontWeight,fontSize :  fontSizes??12.sp,color: textcolor,decoration: decoration,
    ),
      textAlign: textAlign,

    );
  }
}
