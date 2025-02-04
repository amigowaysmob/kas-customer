import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kasnew/cubits/pay_others_otp_cubit.dart';
import 'package:kasnew/request_model/pay_others_otp_request_model.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/states/pay_others_otp_state.dart';

import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';

import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';
import 'package:kasnew/widgets/toast_widget.dart';

@RoutePage()
class PayForOthersScreen extends HookWidget {
 PayForOthersScreen({super.key});

 


  @override
  
  Widget build(BuildContext context) {
     LangModel? lang=ApiConstant.language;
  
    var d=lang?.data;
     double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    var searchController=useTextEditingController();
    final showSuffixIcon = useState(false);
    return  Scaffold(
      appBar: TitleAppBarWidget(title:d?.payForOthers??"Pay For others"),
      body: SingleChildScrollView(
 child:  
        BlocConsumer<PayOthersOtpCubit, PayOthersOtpState>(
            listener: (context, state) {
           
      if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text=='Success') {
        ToastWidget(message: state.model.message,color: Colors.green,).build(context);
   context.router.push(PayOtpScreen(phoneNumber: searchController.text,apiOtp: state.model.data?.otp.toString()));
      }
      else if(state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text!='Success'){
ToastWidget(message: state.model.message,).build(context);
      }
    },
     builder: (context, state) {
         return Padding(padding: EdgeInsets.all(screenPadding),
         child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Row(
           mainAxisAlignment:MainAxisAlignment.spaceAround,
             children: [
               Container(
                            
                            width:swidth/2,
                            height: sheight/19,
                            decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft:Radius.circular(10),bottomLeft:Radius.circular(10) )),
                 child: TextField(
                          controller: searchController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                     FilteringTextInputFormatter.digitsOnly,
                     LengthLimitingTextInputFormatter(10),
             ],
                          // focusNode: focus,
                          onChanged: (val){
                           showSuffixIcon.value = searchController.text.isNotEmpty;
                          
                          },
                          
                          decoration: InputDecoration(
                        
                            hintText: d?.search??'Type here',
                           
                            suffixIcon: 
                            showSuffixIcon.value
                                ? 
                                IconButton(
                                    onPressed: () {
                                      searchController.clear();
                                      showSuffixIcon.value = false;
                                    },
                                    icon: Icon(Icons.close_rounded,
                                        color: Colors.black, size: 15),
                                  )
                                : null,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Colors.grey,
                                style: BorderStyle.solid,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: const BorderSide(
                                width: 0.5,
                                color: Colors.black,
                                style: BorderStyle.solid,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            
                          ),
                          
                        ),
               ),

             state.networkStatusEnum == NetworkStatusEnum.loading?CircularWidgetC() : ButtonWidget(onPressed: (){
                context.read<PayOthersOtpCubit>().login(PayOthersOtpRequestModel(
                  userId: ApiConstant.userId,
                  lang: ApiConstant.langCode,
                  phoneNumber: searchController.text,
                  
                ));
               }, buttonName: 'Send OTP',
               buttonColor: appColor,width: swidth/3,)
             ],
           ),
        ]));
})));} 
}
      