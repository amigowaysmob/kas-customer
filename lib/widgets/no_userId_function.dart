import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/router/router_path.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/constants/sharedpreference_help.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/logo_widget.dart';
import 'package:kasnew/widgets/text_view_medium.dart';


class Helper {
  
 
  static void goToLogin(BuildContext context) {
    context.router.push(LoginScreen());
  }
  static bool isUser(){
if(ApiConstant.userId!=null && ApiConstant.userId.isNotEmpty){
  return true;
}
else
return false;
  }
// static Future<XFile?> compressImage(File file) async {
//     final directory = await getTemporaryDirectory();
//     final targetPath = '${directory.path}/${DateTime
//         .now()
//         .millisecondsSinceEpoch}.jpg';

//     // Compress the image with 80% quality (you can adjust quality level)
//     var result = await FlutterImageCompress.compressAndGetFile(
//       file.absolute.path,
//       targetPath,
//       quality: 80, // Adjust compression quality (0-100)
//     );

//     return result;
//   }
  static void navigate(BuildContext context){
    final sharedPreferenceHelper = SharedPreferenceHelper();
 if(  isUser()==false){context.router.push(const LoginScreen());}
 else{
context.router.pop();
     context.router.replaceNamed(RouterPath.bottom_path);
    switch (ApiConstant.homeIconKey){
     
      case "pay-dues":
      
      
      context.router.pushNamed(RouterPath.pay_due_path);
       case "join-plans":
      
       final chitCount = int.tryParse(ApiConstant.chitCount ?? '0') ?? 0;
       final limit=int.tryParse(ApiConstant.limit?? '0') ?? 0;
       print('chit count-----------$chitCount');
        print('limit-----------$limit');
       if(limit<=chitCount){
 _showChitDialog(context);
       }
       else  if(chitCount>0){
      context.router.pushNamed(RouterPath.exist_add_customer);}
      
      else{
context.router.pushNamed(RouterPath.add_customer_path);
      }
       case "my-ledger":
    context.router.push(LedgerScreen(isMenu: true));
      case "paid-amount-details":
 context.router.push(TransScreen(isMenu: true));
   case "chit-closing":
 context.router.push(LedgerScreen(isChit: true,isMenu: true));
case"feedback":
context.router.pushNamed(RouterPath.feed_back_path);
case"pay-for-others":
context.router.pushNamed(RouterPath.pay_others_path);
case"e-catalogue":
context.router.pushNamed(RouterPath.product_list_path);
case"my-contact-persons":
context.router.pushNamed(RouterPath.contact_person_path);
    }
 sharedPreferenceHelper.saveHomeIconKey('');
    }
  }
static  void showSignAlert({required BuildContext context,String? content,required VoidCallback onPressed,required String buttonName   }) {
     double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
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
                          LogoWidget(),
                        TextViewMedium(name:content,fontWeight: FontWeight.bold, ),
                          vericalSpaceLarge,
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                            ButtonWidget(onPressed: onPressed,
                          
                            buttonName: buttonName,buttonColor: appColor,width:swidth/3.5 ,),
                             ButtonWidget(
                              width: 100,
                               buttonName: 'Ok',
                               onPressed: () {
                               context.router.pop();
                               },
                               buttonColor: whiteColor,
                             ),
                           ],
                         ),
                        
                        ],
                      ),
                    )
                  ]));
        });
  }

  

   

}
void _showChitDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
       
        content: Text('You have reached maximum chit counts'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              context.router.pop();// Dismiss the dialog
            },
            child: TextViewMedium(name:'Ok',textColors: appColor,),
          ),
        
        ],
      );
    },
  );
}