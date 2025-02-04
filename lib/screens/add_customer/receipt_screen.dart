import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kasnew/cubits/receipt_cubit.dart';
import 'package:kasnew/request_model/gift_request_model.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/states/receipt_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';

import 'package:url_launcher/url_launcher.dart';
@RoutePage()
class ReceiptScreen extends StatefulWidget {
  String? customer;
  String? receipt;
  String? link;
  String? close;
  String? giftid;
   ReceiptScreen({ this.giftid});

  @override
  State<ReceiptScreen> createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
  @override
  void initState() {
    super.initState();
    
     context.read<ReceiptCubit>().login(GiftRequestModel(userId: ApiConstant.userId,lang: ApiConstant.langCode,orderId: widget.giftid));
    
  }
   _launchURL(String url) async {
    final Uri urll = Uri.parse(url);

    
  if (await canLaunchUrl(urll)) {
    await launchUrl(urll);
  } else {
    throw 'Could not launch $urll';
  }
}
  Widget build(BuildContext context) {
  return 
    BlocConsumer<ReceiptCubit, ReceiptState>(
            listener: (context, state) {
           
      if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text=='Success') {
   
      }
      else if(state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text!='Success'){

      }
    },
     builder: (context, state) {
     if(  state.networkStatusEnum==NetworkStatusEnum.loading){
      return Center(child: CircularProgressIndicator(color: appColor,));
    }
    if( state.networkStatusEnum==NetworkStatusEnum.loaded){
      var link=state.model?.link;
     var langData=state.model.data?.langData ;
    return
    Scaffold(
      appBar: TitleAppBarWidget(title:langData?.downloadReceipt),
      body: Padding(
        padding: EdgeInsets.all(screenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        Icon(Icons.verified_outlined,color: Colors.green,size:90.r),
        vericalSpaceLarge,
        TextViewLarge(title:'Customer Created Succesfully!',textcolor: blackColor,fontWeight: FontWeight.w700,),
        vericalSpaceLarge,
         ButtonWidget(onPressed: ()async{
                  
                  
                 _launchURL(link??''); 
                //  context.router.pop();
                  
                }, buttonName:langData?.download??'', buttonColor: appColor,),
               vericalSpaceLarge,
                ButtonWidget(onPressed: (){
                  context.router.replace(HomeScreen());
                  // context.read<HomeCubit>().login(HomeRequestModel(userId: ApiConstant.userId,lang: ApiConstant.langCode));
                 
                }, buttonName:langData?.close??'', buttonColor:whiteColor,),
                 vericalSpaceMedium,
          ],
        ),
      ),
    );
  }
  else{
    return CircularWidgetS();
  }
  }
  );}}
