import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/cubits/register_mpin_cubit.dart';
import 'package:kasnew/request_model/register_mpin_request_model.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/states/register_mpin_state.dart';

import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/constants/sharedpreference_help.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/contact_widget.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/logo_widget.dart';
import 'package:kasnew/widgets/text_form_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/toast_widget.dart';
@RoutePage()
class CreateMpinScreen extends StatefulWidget {
 
  @override
  State<CreateMpinScreen> createState() => _CreateMpihScreenState();
}

class _CreateMpihScreenState extends State<CreateMpinScreen> {
  final GlobalKey<FormState> _createMpinKey = GlobalKey<FormState>();
  TextEditingController createMpinController=TextEditingController();
  TextEditingController confirmMpinController=TextEditingController();
  
 
    late SharedPreferenceHelper sharedPreferenceHelper;
  @override
   void initState() {
    super.initState();
    sharedPreferenceHelper = SharedPreferenceHelper();
    sharedPreferenceHelper.init();
  }
   String? _validateMpin(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a MPIN';
    }
    if (value.length != 4) {
      return 'MPIN must be 4 characters';
    }
    //   if (!RegExp(r'^[0-9]{4}$').hasMatch(value)) {
    // //   return 'Please enter a valid 10-digit phone number';
    // }
    return null;
    }
     String? _validateConfirmMpin(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a MPIN';
    }
    if (value.length != 4) {
      return 'MPIN must be 4 characters';
    }
   if(value!=createMpinController.text){
    return "Your Mpin and Confirm MPIN doesn't match";
   }
    return null;
    }
    
    void _createMpin() async {
      if (_createMpinKey.currentState!.validate()) {
      context
          .read<RegisterMpinCubit>()
          .login(RegisterMpinRequestModel(userId:ApiConstant.userId,
          mpin:createMpinController.text,confirmMpin: confirmMpinController.text  ));}
    }
  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocConsumer<RegisterMpinCubit, RegisterMpinState>(
            listener: (context, state) {
              print(state.networkStatusEnum);
           
      if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text=='Success') {
          sharedPreferenceHelper?.saveMpinStatus(state.model.data?[0].mpinStatus);
         
        // String userId=sharedPreferenceHelper.getUserId;
        // print('user id----${userId}');
     ToastWidget(message: state.model.message,color: Colors.green,
        ).build(context);
        context.router.replaceAll([VerifyMpinScreen()]);
      }
      else if(state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text!='Success'){
 ToastWidget(message: state.model.message).build(context);
        
      }
    }, builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _createMpinKey,
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             LogoWidget(),
                const SizedBox(
                  height: 20,
                ),
              TextViewLarge(title: 'Create MPIN',textcolor:blackColor),
              const SizedBox(
                height: 20,
              ),
             
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                    TextForm(
                controller: createMpinController,
                keyboardType: TextInputType.number,
                labelText: 'Create MPIN',
                hintText: 'Create Your MPIN',
                validating: _validateMpin,
                type:'mpin'
              ),
              const SizedBox(
                height: 20,
              ),
              TextForm(
                controller:confirmMpinController,
                keyboardType: TextInputType.number,
                labelText: 'Confirm MPIN',
                hintText: 'Confirm MPIN',
                validating: _validateConfirmMpin,
                type:'mpin',
              ),
              const SizedBox(
                height: 20,
              ),
                ],
              ),
             
             
              
    state.networkStatusEnum == NetworkStatusEnum.loading?CircularWidgetC() :         ButtonWidget(
                  onPressed: () {
                    _createMpin();
                    
                  },
                  buttonName: 'Create MPIN',
                  buttonColor: appColor,),
                 const SizedBox(
                height: 20,
              ),
             ContactWidget()  
            ],
          ),
        ),
      );
  }));
  }
}