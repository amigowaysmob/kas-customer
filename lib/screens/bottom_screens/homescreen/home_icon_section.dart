import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kasnew/response_model/home_model.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/constants/sharedpreference_help.dart';

import 'package:kasnew/widgets/no_userId_function.dart';
import 'package:kasnew/widgets/text_view_small.dart';

class HomeIconSection extends StatefulWidget {
  Sections? section;
 HomeIconSection({this.section});

  @override
  State<HomeIconSection> createState() => _HomeIconSectionState();
}

class _HomeIconSectionState extends State<HomeIconSection> {
 
   late SharedPreferenceHelper sharedPreferenceHelper;
  @override
   void initState() {
    super.initState();
    sharedPreferenceHelper = SharedPreferenceHelper();
    sharedPreferenceHelper.init();
  }
  Widget build(BuildContext context) {
   
    return  SizedBox(
      // height: 400,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
         mainAxisExtent:  ApiConstant.langCode != 'ta' ?150:160,
         
          
          ),
          itemCount: widget.section?.homeIcons?.length,
          itemBuilder: (context, index) {
            var data=widget.section?.homeIcons?[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  
                  sharedPreferenceHelper.saveHomeIconKey(data?.key);
                
                  sharedPreferenceHelper.saveChitCount(data?.chitCount
                  .toString());
                 
                 sharedPreferenceHelper.saveLimit(data?.accountLimit
                  .toString());
                
if(ApiConstant.homeIconKey=='offers-gift'){
   context.router.push(GiftListScreen());
}
 

else{
                Helper.navigate(context);}
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                 
                 Card(
                  elevation:20,
                  shadowColor:Color(0xFFF0D53F),
               
                   child: Container(
                    height: 100,
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: yellowColor,width: 3),
                   top: BorderSide(color: yellowColor,width: 1), left: BorderSide(color: yellowColor,width: 1),
                    right: BorderSide(color: yellowColor,width: 1)
                    ),
                     borderRadius: BorderRadius.circular(10),
                      color: whiteColor
                      
                    ),
                    child: Center(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(data?.image??'',height: 60,width: 60,),
                    ))),
                 ),
                 Padding(
                   padding:  EdgeInsets.only(left:8.0),
                   child:SizedBox(
        height: 44,
                     child: TextViewSmall(
                      textAlign: TextAlign.center,
                      title: data?.label,textcolor: appColor,fontWeight: FontWeight.bold,
                     fontSizes: ApiConstant.langCode=='ta'?9.sp:null),
                   ),
                 )
                ],),
              ),
            );
          },
        ),
    );
  }
}

