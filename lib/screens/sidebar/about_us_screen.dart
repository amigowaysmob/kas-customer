import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/cubits/about_us_cubit.dart';
import 'package:kasnew/request_model/about_us_request_model.dart';
import 'package:kasnew/states/about_us_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/constants/sharedpreference_help.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';
import 'package:flutter_html/flutter_html.dart';
@RoutePage()
class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  late SharedPreferenceHelper sharedPreferenceHelper;

  @override
  void initState() {
    super.initState();
    context.read<AboutUsCubit>().login(AboutUsRequestModel(seourl: 'about-us',
    lang: ApiConstant.langCode));
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TitleAppBarWidget(title:"AboutUs"),
      body: SingleChildScrollView(
 child:   BlocConsumer<AboutUsCubit, AboutUsState>(
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
        TextViewLarge(title: "AboutUs",textcolor: appColor,fontWeight: FontWeight.w800,),
        Html(data: state.model.data?.content??'')
       ]));
}
else
return CircularWidgetC();
})));} 

}
      