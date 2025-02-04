import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/cubits/reset_mpin_cubit.dart';
import 'package:kasnew/request_model/register_mpin_request_model.dart';

import 'package:kasnew/router/router_path.dart';
import 'package:kasnew/states/reset_mpin_state.dart';
import 'package:kasnew/utils/constant.dart';
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
class ResetMpinScreen extends StatefulWidget {
 
  @override
  State<ResetMpinScreen> createState() => _ResetMpihScreenState();
}

class _ResetMpihScreenState extends State<ResetMpinScreen> {
  final GlobalKey<FormState> _resetMpinKey = GlobalKey<FormState>();
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
    
    void _resetMpin() async {
      if (_resetMpinKey.currentState!.validate()) {
      context
          .read<ResetMpinCubit>()
          .login(RegisterMpinRequestModel(userId:sharedPreferenceHelper?.getUserId,
          mpin:createMpinController.text,confirmMpin: confirmMpinController.text  ));}
    }
  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocConsumer<ResetMpinCubit, ResetMpinState>(
            listener: (context, state) {
              print(state.networkStatusEnum);
           
      if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text=='Success') {
        // sharedPreferenceHelper?.saveUserID(state.registerMpin.data!.id);
        // String userId=sharedPreferenceHelper.getUserId;
        // print('user id----${userId}');
     ToastWidget(message: state.model.message,color: Colors.green,
        ).build(context);
        context.router.pushNamed(RouterPath.verify_mpin_path);
      }
      else if(state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text!='Success'){
 ToastWidget(message: state.model.message).build(context);
        
      }
    }, builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _resetMpinKey,
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               LogoWidget(),
                const SizedBox(
                  height: 20,
                ),
              TextViewLarge(title: 'Reset MPIN',textcolor:appColor),
              const SizedBox(
                height: 20,
              ),
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
                 type:'mpin'
              ),
              const SizedBox(
                height: 20,
              ),
             
             
              
       state.networkStatusEnum == NetworkStatusEnum.loading?CircularWidgetC() :        ButtonWidget(
                  onPressed: () {
                    _resetMpin();
                    
                  },
                  buttonName: 'Reset MPIN',
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