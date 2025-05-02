import 'package:flutter/material.dart';
import 'package:kasnew/response_model/get_feedback_model.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/screens/bottom_screens/homescreen/feedback_scree.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/table_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';

class TicketWidget extends StatelessWidget {
  List<Tickets>? tickets;
 TicketWidget({this.tickets});

  @override
  Widget build(BuildContext context) {
      double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
      LangModel? lang=ApiConstant.language;
    var d=lang?.data;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          TextViewLarge(title:d?.myTickets?? 'My Tickets',textcolor: appColor,fontWeight: FontWeight.bold,),
          ButtonWidget(onPressed: (){
              showAddReview(context:context,isTicket: true);
          }, buttonName:d?.createTicket?? "Create Ticket", buttonColor:appColor,width:swidth/2 ,)
        ],),
        vericalSpaceMedium,
      TableWidget(data:tickets)
      ],
    );
  }
}