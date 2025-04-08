import 'package:flutter/material.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/text_view_medium.dart';


class GrandTotalWidget extends StatelessWidget {
  String? chitAmount;
  String? advanceAmount;
  String? grandTotalAmount;
 GrandTotalWidget({this.chitAmount,this.advanceAmount,this.grandTotalAmount});

  @override
  Widget build(BuildContext context) {
    LangModel? lang=ApiConstant.language;
  
    var d=lang?.data;
     double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        TextViewLarge(title:d?.grandTotal?? 'Grand Total',fontWeight: FontWeight.bold,textcolor: blackColor,),
        vericalSpaceSmall,
        Card(
          elevation: 5,
          child: Container(
          
            decoration: BoxDecoration(
               border: Border.all(color: greyColor),
            borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width:swidth/2.5,
                        child: Column(
                          children: [
                            TextViewMedium(name:d?.chitAmount??"Chit Amount" , fontSize: 11),
                            SizedBox(height:10),
                            TextViewMedium(name:d?.advanceAmount??"Advance Amount" , fontSize: 11),
                              SizedBox(height:10),
                          ],
                        ),
                      ),
                       Container(
                        width:20,
                        child: Column(
                          children: [
                            TextViewMedium(name:":" , fontSize: 11),
                             SizedBox(height:10),
                              TextViewMedium(name:":" , fontSize: 11),
                             SizedBox(height:10),
                          ],
                        ),
                      ),
                       Container(
                     
                        child: Column(
                          children: [
                       chitAmount!=null && (chitAmount?.isNotEmpty??false)?     TextViewMedium(name:'₹$chitAmount' , fontSize: 11):  TextViewMedium(name:'-' , fontSize: 11),
                             SizedBox(height:10),
                          advanceAmount!=null && (advanceAmount?.isNotEmpty??false)?   TextViewMedium(name:'₹$advanceAmount' , fontSize: 11): TextViewMedium(name:'-' , fontSize: 11),
                              SizedBox(height:10),
                            
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.black,),
                    borderRadius: BorderRadius.circular(10),),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                             width:swidth/2.5,
                            child:  TextViewMedium(name:d?.grandTotal??"Grand Total Amount" , fontSize: 12,fontWeight: FontWeight.bold,textColors: appColor,) ,
                          ),
                           Container(
                        width:20,
                        child:    TextViewMedium(name:":" , fontSize: 15,fontWeight: FontWeight.bold, textColors: appColor),),
                         Container(
                       
                        child:   TextViewMedium(name:'₹$grandTotalAmount', fontSize: 15,fontWeight: FontWeight.bold,textColors: appColor),)
                        ],
                      ),
                    ))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}