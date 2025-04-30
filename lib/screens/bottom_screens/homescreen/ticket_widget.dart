import 'package:flutter/material.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          TextViewLarge(title: 'My Tickets',textcolor: appColor,fontWeight: FontWeight.bold,),
          ButtonWidget(onPressed: (){
            
          }, buttonName: "Create Ticket", buttonColor:appColor)
        ],)
      ],
    );
  }
}