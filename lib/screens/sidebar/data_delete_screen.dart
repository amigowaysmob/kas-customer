import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kasnew/cubits/delete_cubit.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/states/delete_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';
import 'package:kasnew/widgets/toast_widget.dart';

import 'package:shared_preferences/shared_preferences.dart';
@RoutePage()
class DeleteScreen extends StatefulWidget {
  const DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBarWidget(title: 'Data Deletion Request'),
      body: BlocConsumer<DeleteCubit,DeleteState>(
        listener: (context, state) {
            if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text=='Success') {
   ToastWidget(message: state.model.message,color: Colors.green,).build(context);
      logout(); 
context.router.replaceAll([RegisterRoute()]);
              
      }
       else if(state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text!='Success'){
ToastWidget(message: state.model.message,).build(context);
      }
        },
        builder: (context, state) {
          
        
        return Column(children: [
          Html(data: ApiConstant.delContent),
          vericalSpaceExtraMedium,
          ButtonWidget(onPressed: (){
             _showLogoutDialog1(context);
          }, 
          buttonName: 'Delete My Account', 
          buttonColor: appColor)
        ],);
  }),
    );
  }
}
Future<void> logout() async {
  
      final prefs = await SharedPreferences.getInstance();
      // Clear user data (e.g., user tokens, session data, etc.)
      //prefs.remove("profile");
      // prefs.remove(PrefKeys.user_id);
    
      prefs.clear();
      
    }

    void _showLogoutDialog1(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Data Deletion Request'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Html(data:ApiConstant.delreq),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              context.router.pop();// Dismiss the dialog
            },
            child: TextViewMedium(name:'No',textColors: appColor,),
          ),
          TextButton(
            onPressed: ()async {
             // Dismiss the dialog
              context.read<DeleteCubit>().login(HomeRequestModel(userId: ApiConstant.userId,lang: ApiConstant.langCode));
          // Call your logout function
            },
            child:TextViewMedium(name:'Yes',textColors: appColor,),
          ),
        ],
      );
    },
  );
}