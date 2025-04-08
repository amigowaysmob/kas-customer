import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/widgets/text_view_large.dart';

class TitleAppBarWidget extends HookWidget implements PreferredSizeWidget {
  String? title;

   TitleAppBarWidget({required this.title});
  
  @override
  Size get preferredSize => Size.fromHeight(50.0); 

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
        return AppBar(
          
           backgroundColor: appColor,
         title:  FittedBox(
    fit: BoxFit.scaleDown,child: TextViewLarge(title:'$title' ,textcolor: whiteColor,fontWeight: FontWeight.bold,)),
          );
         
   
  }}

