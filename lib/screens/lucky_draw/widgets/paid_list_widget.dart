import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kasnew/response_model/lucky_draw_model.dart';
import 'package:kasnew/screens/lucky_draw/widgets/eligible_widget.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/text_view_small.dart';

class PaidListWidget extends StatelessWidget {
  LedgerData? ldata;
 
   PaidListWidget({this.ldata});

  @override
  Widget build(BuildContext context) {
     double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        
        child: Column(children: [
        Container(
          decoration: BoxDecoration(color: redColor,borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
         topRight: Radius.circular(10) ),
        )
        ,
        child: Padding(
          padding: EdgeInsets.all(screenPadding/2),
          child: Row(
            children: [
              SizedTextWidget(width: swidth/10,text:'S.No'),
              SizedTextWidget(width: swidth/4,text:'Payable'),
              SizedTextWidget(width: swidth/6,text:'Paid '),
               SizedTextWidget(width: swidth/7,text:'Amount'),
              SizedTextWidget(width: swidth/7,text:'Status'),
            ],
          ),
        ),
        ),
      Container(
         height: (ldata?.luckyDrawDetails?.length??0)>3? sheight/3:null,
     decoration: BoxDecoration(
      color: whiteColor,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
         bottomRight: Radius.circular(10) ),
        ),
        child: Scrollbar(

          child: ListView.separated(
                physics: (ldata?.luckyDrawDetails?.length??0)>3?AlwaysScrollableScrollPhysics(): NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: ldata?.luckyDrawDetails?.length??0,
                separatorBuilder: (context, index) {
          return Divider();
                },
                itemBuilder: (context,index){
          var ldataa=ldata?.luckyDrawDetails?[index];
                return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            SizedBox(width: swidth/10,child:TextViewSmall(title:ldataa?.sNo ,
            textcolor: blackColor,fontWeight: FontWeight.bold,textAlign: TextAlign.center,)),
                SizedBox(width: swidth/4,child:TextViewSmall(title:ldataa?.payableDate ,textcolor: blackColor,textAlign: TextAlign.center,fontWeight: FontWeight.bold,fontSizes: 10.sp,)),
                SizedBox(width: swidth/5.6,child:TextViewSmall(title:ldataa?.paidDate ,textcolor: blackColor,textAlign: TextAlign.center,fontSizes: 10.sp,)),
                  SizedBox(width: swidth/7,child:TextViewSmall(title:'₹${ldataa?.paidAmount}' ,textcolor: blackColor,textAlign: TextAlign.center,fontWeight: FontWeight.bold,)),
               SizedBox(width: swidth/7.5,child:ldataa?.eligible=="1"? Icon(Icons.check_circle,color: Colors.green,):Icon(Icons.close,color: redColor,),),
                SizedBox(width: swidth/12,child:ldataa?.eligible!="1"? InkWell(
                  onTap:(){
          showwinAlert(context,ldataa?.reason);
                  },
                  child: Icon(Icons.visibility,color: blackColor,size: 10,)):Container(),)
          ],),
                ) ;
          }),
        ),
        
      ),
      
      
      ],),),
    );
  }
}
class SizedTextWidget extends StatelessWidget {
 double? width;
 String? text;
  SizedTextWidget({this.width,this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width,child: 
    TextViewSmall(title: text,textcolor: whiteColor,textAlign: TextAlign.center,fontWeight: FontWeight.bold,),);
  }
}

void showwinAlert(BuildContext context,String? text) {
    showDialog(
        context: context,
       
        builder: (context) {
          
          return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                  mainAxisSize: MainAxisSize
                      .min, // Ensure the dialog takes only as much space as needed
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        
                          
                          TextViewMedium(
                    name:  text,
                    fontWeight: FontWeight.w700,
                    textColors:blackColor,
                  ),
                 vericalSpaceLarge,
                         ButtonWidget(
                          width: 100,
                           buttonName: 'Ok',
                           onPressed: () {
                           context.router.pop();
                           },
                           buttonColor: appColor,
                         ),
                        
                        ],
                      ),
                    )
                  ]));
        });
  }

  

   
