import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';

class NoUseridScreen extends StatelessWidget {
  String? content;
  String? title;
 NoUseridScreen({this.content,this.title});

  @override
 
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return Padding(
       padding: const EdgeInsets.all(20),
       child: Center(
         child: Column(
         
            children: [
            Image.asset('assets/images/login.gif',height:sheight/2 ,width: swidth/2,),  
            TextViewLarge(title: content,textcolor: blackColor,),
            vericalSpaceMedium,
            ButtonWidget(onPressed: (){
              context.router.push(LoginScreen());
            }, buttonName:'Login', buttonColor: appColor,width: 100,)
          ],),
       ));
     
  }
}