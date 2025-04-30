import 'package:flutter/material.dart';
import 'package:kasnew/response_model/get_feedback_model.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/widgets/text_view_small.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';
class TableWidget extends StatelessWidget {
  final List<Tickets>? data;
  TableWidget( {super.key,this.data,});

  @override
  Widget build(BuildContext context) {
    LangModel? lang=ApiConstant.language;
     var d=lang?.data;
     double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    
    return Container(
      height: sheight/1.1,
      child: data!.isEmpty
          ? TextViewSmall(
              title:d?.noData?? "No Data !",
              textAlign: TextAlign.center,
              textcolor: appColor,
              fontWeight: FontWeight.bold)
          : TableView.builder(
            keyboardDismissBehavior:ScrollViewKeyboardDismissBehavior.onDrag,
              columnCount: 6,
              rowCount: data!.length + 1,
              columnBuilder: buildTableSpan,
              rowBuilder: buildTableeSpan,
              cellBuilder: (BuildContext context, TableVicinity vicinity) {
                return TableViewCell(
                    child: Container(
                        child: Center(child: addText(vicinity, context))));
              }),
    );
  }

  TableSpan buildTableSpan(int index) {
    TableSpanDecoration decoration = const TableSpanDecoration(
        border: TableSpanBorder(
            // trailing: BorderSide(color: Colors.grey),
            leading: BorderSide(color: Colors.grey)));
    return TableSpan(
        extent: const FractionalTableSpanExtent(0.45),
        foregroundDecoration: decoration);
  }

  TableSpan buildTableeSpan(int index) {
    TableSpanDecoration decoration = const TableSpanDecoration(
        border: TableSpanBorder(
            trailing: BorderSide(color: Colors.grey, width: 0.5),
            leading: BorderSide(color: Colors.grey, width: 0.5)));
    return TableSpan(
        extent: index != 0
            ? FractionalTableSpanExtent(0.05)
            : FractionalSpanExtent(0.07),
        foregroundDecoration: decoration);
  }

  Widget addText(TableVicinity vicinity, BuildContext context) {
    LangModel? lang=ApiConstant.language;
     var d=lang?.data;
    if (vicinity.yIndex == 0 && vicinity.xIndex == 0) {
      return Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: TextViewSmall(
              title:'Ticket No.',
              textAlign: TextAlign.center,
              textcolor:appColor,
              fontWeight: FontWeight.bold));
    } 
    else if (vicinity.yIndex == 0 && vicinity.xIndex == 1) {
      return Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: TextViewSmall(
              title:"Subject",
              textAlign: TextAlign.center,
              textcolor:appColor,
              fontWeight: FontWeight.bold));
    }
    else if (vicinity.yIndex == 0 && vicinity.xIndex == 2) {
      return Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: TextViewSmall(
              title:' Type',
              textAlign: TextAlign.center,
              textcolor:appColor,
              fontWeight: FontWeight.bold));
    } else if (vicinity.yIndex == 0 && vicinity.xIndex == 3) {
      return Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8,),
          child: TextViewSmall(
              title:"Description",
              textAlign: TextAlign.center,
              textcolor:appColor,
              fontWeight: FontWeight.bold));
    } else if (vicinity.yIndex == 0 && vicinity.xIndex == 4) {
      return Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: TextViewSmall(
              title:"Created Date",
              textAlign: TextAlign.center,
              textcolor: appColor,
              fontWeight: FontWeight.bold));
    } 
    // else if (vicinity.yIndex == 0 && vicinity.xIndex == 5) {
    //   return Padding(
    //       padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    //       child: TextViewSmall(
    //           title:"Updated Date",
    //           textAlign: TextAlign.center,
    //           textcolor:appColor,
    //           fontWeight: FontWeight.bold));
    // }
     else if (vicinity.yIndex == 0 && vicinity.xIndex == 5) {
      return Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: TextViewSmall(
              title:"Status",
              textAlign: TextAlign.center,
              textcolor:appColor,
              fontWeight: FontWeight.bold));
    } 
    // else if (vicinity.yIndex == 0 && vicinity.xIndex == 7) {
    //   return Padding(
    //       padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    //       child: TextViewSmall(
    //           title:d?.debitAmount??"Debit amount",
    //           textAlign: TextAlign.center,
    //           textcolor:appColor,
    //           fontWeight: FontWeight.bold));
    // } 
    // else if (vicinity.yIndex == 0 && vicinity.xIndex == 8) {
    //   return Padding(
    //       padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
    //       child: TextViewSmall(
    //           title:d?.balanceAmount??"Balance amount",
    //           textAlign: TextAlign.center,
    //           textcolor:appColor,
    //           fontWeight: FontWeight.bold));
    // }
     else if (vicinity.xIndex == 0) {
      return Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child:
              TextViewSmall(title: data![vicinity.yIndex - 1].ticketNo.toString(),textcolor: appColor,));
    } 
    else if (vicinity.xIndex == 1) {
      return Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child:
              TextViewSmall(title: data![vicinity.yIndex - 1].ticketType.toString(),textcolor: appColor,));
    }
    else if (vicinity.xIndex == 2) {
      return Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child:
              TextViewSmall(title: data![vicinity.yIndex - 1].issueType.toString(),textcolor: appColor,));
    } else if (vicinity.xIndex == 3) {
      return Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: TextViewSmall(
            
              title: data![vicinity.yIndex - 1].description.toString(),textcolor: appColor,));
    } else if (vicinity.xIndex == 4) {
      return Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: TextViewSmall(
              title: data![vicinity.yIndex - 1].dateTime.toString(),textcolor: appColor,));
    } else if (vicinity.xIndex == 5) {
      return Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child:   InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: getColor(data![vicinity.yIndex - 1].status),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TextViewSmall(title:data![vicinity.yIndex - 1].statusContent.toString() ,
                                textcolor:data![vicinity.yIndex - 1].status=='1'? appColor:whiteColor,fontWeight: FontWeight.bold,),
                              ),
                            ),
                          ),
          // TextViewSmall(
          //     title: data![vicinity.yIndex - 1].statusContent.toString(),textcolor:getColor(data![vicinity.yIndex - 1].status),)
          );
    }
    //  else if (vicinity.xIndex == 6) {
    //   return Padding(
    //       padding: const EdgeInsets.only(left: 8, right: 8),
    //       child: TextViewSmall(
    //           title: data![vicinity.yIndex - 1].creditAmount.toString(),textcolor: appColor,));
    // } else if (vicinity.xIndex == 7) {
    //   return Padding(
    //       padding: const EdgeInsets.only(left: 8, right: 8),
    //       child: TextViewSmall(
    //           title: data![vicinity.yIndex - 1].debitAmount.toString(),textcolor: appColor,));
    // } else if (vicinity.xIndex == 8) {
    //   return Padding(
    //       padding: const EdgeInsets.only(left: 8, right: 8),
    //       child: TextViewSmall(
    //           title: data![vicinity.yIndex - 1].balanceAmount.toString(),textcolor: appColor,));
    // }
    return TextViewSmall(title: "");
  }
}
Color getColor(String? status){
  switch(status){
    
     case '1':
    return Colors.yellow;
     case '2':
    return Colors.orange;
      case '3':
    return Colors.orange;
     case '4':
    return Colors.green;
  default:
        return Colors.green;
    
  }}