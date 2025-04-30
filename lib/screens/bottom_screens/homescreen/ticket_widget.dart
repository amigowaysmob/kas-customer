import 'package:flutter/material.dart';
import 'package:kasnew/response_model/get_feedback_model.dart';
import 'package:kasnew/screens/bottom_screens/homescreen/feedback_scree.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/table_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';

class TicketWidget extends StatelessWidget {
  List<Tickets>? tickets;
 TicketWidget({this.tickets});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          TextViewLarge(title: 'My Tickets',textcolor: appColor,fontWeight: FontWeight.bold,),
          ButtonWidget(onPressed: (){
              showAddReview(context:context);
          }, buttonName: "Create Ticket", buttonColor:appColor)
        ],),
        vericalSpaceMedium,
      TableWidget(data:tickets)
      ],
    );
  }
}