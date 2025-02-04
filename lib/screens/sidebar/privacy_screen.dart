import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kasnew/cubits/privacy_cubit.dart';
import 'package:kasnew/request_model/about_us_request_model.dart';
import 'package:kasnew/states/privacy_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/constants/sharedpreference_help.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';

@RoutePage()
class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  late SharedPreferenceHelper sharedPreferenceHelper;

  @override
  void initState() {
    super.initState();
    context.read<PrivacyCubit>().login(AboutUsRequestModel(seourl: 'privacy-policy',
    lang: ApiConstant.langCode));
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TitleAppBarWidget(title:"Privacy"),
      body: SingleChildScrollView(
 child:   BlocConsumer<PrivacyCubit, PrivacyState>(
            listener: (context, state) {
           
      if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text=='Success') {
   
      }
      else if(state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text!='Success'){

      }
    },
     builder: (context, state) {
     if(  state.networkStatusEnum==NetworkStatusEnum.loading){
      return CircularWidgetC();
    }
    if( state.networkStatusEnum==NetworkStatusEnum.loaded){
     return
       Padding(padding: EdgeInsets.all(screenPadding),
       child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        TextViewLarge(title: "Privacy policy",textcolor: appColor,fontWeight: FontWeight.w800,),
        Html(data: state.model.data?.content??'')
       ]));
}
else
return CircularWidgetC();
})));} 

}
      