import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/cubits/change_mpin_cubit.dart';
import 'package:kasnew/request_model/change_mpin_request_model.dart';
import 'package:kasnew/states/change_mpin_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/constants/sharedpreference_help.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/text_form_widget.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';
import 'package:kasnew/widgets/toast_widget.dart';

@RoutePage()
class ChangeMpinScreen extends StatefulWidget {
 
  @override
  State<ChangeMpinScreen> createState() => _ChangeMpihScreenState();
}

class _ChangeMpihScreenState extends State<ChangeMpinScreen> {
  final GlobalKey<FormState> _resetMpinKey = GlobalKey<FormState>();
  TextEditingController createMpinController=TextEditingController();
  TextEditingController confirmMpinController=TextEditingController();
  TextEditingController currentMpinController=TextEditingController();
 void initState() {
    super.initState();
    
  }
    late SharedPreferenceHelper sharedPreferenceHelper;
  @override
   
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
    
    void changeMpin() async {
      if (_resetMpinKey.currentState!.validate()) {
      context
          .read<ChangeMpinCubit>()
          .login(ChangeMpinRequestModel(userId:ApiConstant.userId,currentMpin:currentMpinController.text ,
          mpin:createMpinController.text,confirmMpin: confirmMpinController.text,  ));}
    }
  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return  BlocConsumer<ChangeMpinCubit, ChangeMpinState>(
            listener: (context, state) {
             
           
      if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text=='Success') {
        // sharedPreferenceHelper?.saveUserID(state.registerMpin.data!.id);
        // String userId=sharedPreferenceHelper.getUserId;
        // print('user id----${userId}');
     ToastWidget(message: state.model.message,color: Colors.green,
            ).build(context);
            context.router.pop();
      }
      else if(state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text!='Success'){
 ToastWidget(message: state.model.message).build(context);
        
      }
    }, builder: (context, state) {
      return 
           Scaffold(
      appBar: TitleAppBarWidget(title: "changeMpin"),
      body: 
               Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _resetMpinKey,
                child: Column(
                   
                  children: [
                    // LogoWidget(),
                  vericalSpaceLarge,
                   TextForm(
                      controller: currentMpinController,
                      keyboardType: TextInputType.number,
                      labelText: "Current Mpin",
                      hintText:  "Current Mpin",
                      validating: _validateMpin,
                      type: 'mpin',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextForm(
                      controller: createMpinController,
                      keyboardType: TextInputType.number,
                      labelText:'New Mpin',
                      hintText: 'New Mpin',
                      validating: _validateMpin,
                      type: 'mpin',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextForm(
                      controller:confirmMpinController,
                      keyboardType: TextInputType.number,
                      labelText: "Confirm Mpin",
                      hintText: "Confirm Mpin",
                      validating: _validateConfirmMpin,
                      type: 'mpin',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                   
                   
                    
          state.networkStatusEnum == NetworkStatusEnum.loading?CircularWidgetC() :            ButtonWidget(
                        onPressed: () {
                          changeMpin();
                          
                        },
                        buttonName:"Change Mpin",
                        buttonColor: appColor,),
                       const SizedBox(
                      height: 20,
                    ),
                     
                  ],
                ),
              ),
               ));});}}



            
        
      
  
