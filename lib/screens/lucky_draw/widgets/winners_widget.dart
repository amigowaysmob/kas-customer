
import 'package:flutter/material.dart';
import 'package:kasnew/screens/lucky_draw/widgets/name_widget.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/widgets/no_userId_function.dart';
import 'package:kasnew/widgets/row_text_widget.dart';
import 'package:kasnew/widgets/text_view_small.dart';
import 'package:kasnew/response_model/winners_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class WinnerWidget extends StatelessWidget {
Winners? data;
 WinnerWidget({this.data});

  @override
  Widget build(BuildContext context) {
    return Card(elevation: 5,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage:NetworkImage(data?.image??'') ,
            ),
            horizontalSpaceMedium,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              NameWidget(title:data?.name ,),
             Row(children: [
          TextViewSmall(title: data?.gram,textcolor: greyColor,fontSizes: 10,),
           TextViewSmall(title: 'gm',textcolor: greyColor,fontSizes: 10,),
         
        ],),
 ( data?.video!=null && (data?.video?.isNotEmpty??false))?         InkWell(onTap: (){
     Helper.launchURL(data?.video??'');
          },
          child: Row(
            children: [
             FaIcon(FontAwesomeIcons.youtube,color: redColor,),
              TextViewSmall(title: ' Video',textcolor:Colors.blue
              ),
            ],
          )):Container()
          
            ],),
          ],
        ),
        
      ],),
    ),);
  }
}