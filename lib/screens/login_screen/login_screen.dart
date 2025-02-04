import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/cubits/login_cubit.dart';
import 'package:kasnew/request_model/login_request_model.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/router/router_path.dart';
import 'package:kasnew/states/login_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/sharedpreference_help.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/logo_widget.dart';
import 'package:kasnew/widgets/no_userId_function.dart';
import 'package:kasnew/widgets/text_form_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/text_view_small.dart';
import 'package:kasnew/widgets/toast_widget.dart';


@RoutePage()
class LoginScreen extends StatefulWidget {
 
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController loginController=TextEditingController();
  
  
 
    late SharedPreferenceHelper sharedPreferenceHelper;
  @override
   void initState() {
    super.initState();
    sharedPreferenceHelper = SharedPreferenceHelper();
    sharedPreferenceHelper.init();
  }
   
     String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'please enter an email!';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }
   String? _validatePhoneNumber(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a phone number';
    }
     else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Please enter a valid 10-digit phone number';
    }
    return null;
  } 
    void _login() async {
      if (loginKey.currentState!.validate()) {
      context
          .read<LoginCubit>()
          .login(LoginRequestModel(phoneNumber: loginController.text,
           ));}
    }
  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
            
           
      if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text=='Success') {
       
     ToastWidget(message: state.model.message,color: Colors.green,
        ).build(context);
    
       sharedPreferenceHelper.saveMpinStatus(state.model.data?[0].mpinStatus);
        context.router.push( OtpVerifyRoute(loginOtp: state.model.otp.toString(),
        isogin: true,
          mpinStatus: state.model.data?[0].mpinStatus,
          loginPhoneNumber:loginController.text,
          phoneNumber:loginController.text ,
         userId:state.model.data?[0].id
           ));
      }
      else if(state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text!='Success'){
Helper.showSignAlert(context:context,content:  state.model.message,onPressed: (){
  context.router.pop();
  context.router.replaceNamed(RouterPath.register_path);
 } , buttonName:'Register Here');
        
      }
    }, builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: loginKey,
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            
             LogoWidget(),
                const SizedBox(
                  height: 20,
                ),
              TextViewLarge(title: 'Login',textcolor:blackColor),
            vericalSpaceLarge,
              TextForm(
                controller: loginController,
                keyboardType: TextInputType.number,
                labelText:  'Mobile Number',
                hintText: 'Enter Your Mobile Number',
                 validating:_validatePhoneNumber,
                type: 'mobileNumber',
              ),
            vericalSpaceLarge,
             
             
             
           state.networkStatusEnum==NetworkStatusEnum.loading?CircularWidgetC():
              ButtonWidget(
                  onPressed: () async {
                     

 
                    _login();
                    
                  },
                  buttonName: 'Send OTP',
                  buttonColor: appColor,),
               vericalSpaceLarge,
                 Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 TextViewSmall(title: "Don't have an account? ",textcolor: appColor,),
                 InkWell(onTap: (){
                   context.router.pushNamed(RouterPath.register_path);
                 }, child:TextViewSmall(title: 'Register',fontWeight: headingWeight,textcolor: appColor,))
               ],
             ),
     Helper.isUser()?Container():          Row(
                mainAxisAlignment: MainAxisAlignment.end,
               
                children: [
                 TextButton(
                onPressed: () {
                  // Handle skip action
                  context.router.replaceNamed(RouterPath.bottom_path);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.7),
                
                ),
                child: Text(
                'Skip',
                  style: TextStyle(color: blackColor),
                ),
              ),
              ],),  
            ],
          ),
        ),
      );
  }));
  }
}

void _showUpdateAlert(BuildContext context,String? message) {
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
                              name: message),
                          vericalSpaceMedium,
                         ButtonWidget(
                          width: 100,
                           buttonName: 'Ok',
                           onPressed: () {
                           context.router.maybePop();
                           },
                           buttonColor: appColor,
                         ),
                        
                        ],
                      ),
                    )
                  ]));
        });
  }

  

   