import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kasnew/cubits/lucky_terms_cubit.dart';
import 'package:kasnew/request_model/about_us_request_model.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/screens/lucky_draw/widgets/title_container_widget.dart';
import 'package:kasnew/states/luck_terms_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/constants/sharedpreference_help.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/no_userId_function.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';

@RoutePage()
class LuckyTermsScreen extends StatefulWidget {
  const LuckyTermsScreen({super.key});

  @override
  State<LuckyTermsScreen> createState() => _LuckyTermsScreenState();
}

class _LuckyTermsScreenState extends State<LuckyTermsScreen> {
  @override
  late SharedPreferenceHelper sharedPreferenceHelper;

  @override
  void initState() {
    super.initState();
    context.read<LuckyTermsCubit>().login(AboutUsRequestModel(seourl: 'terms-and-conditions',
    lang: ApiConstant.langCode));
  }
  Widget build(BuildContext context) {
      LangModel? lang=ApiConstant.language;
  
    var d=lang?.data;
    return  Scaffold(
      appBar: TitleAppBarWidget(title:d?.termsAndConditions??" Terms & Conditions"),
      body: SingleChildScrollView(
 child:   BlocConsumer<LuckyTermsCubit, LuckyTermsState>(
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

        // TextViewLarge(title: "Lucky Draw Terms & Conditions",textcolor: appColor,fontWeight: FontWeight.w800,),
     state.model.data?.video!=null && (state.model.data?.video?.isNotEmpty??false)?   TitleContainerWidget(
      faIcon: FontAwesomeIcons.youtube,iconColor: redColor,
                title:d?.termsAndConditionsVideo??'Terms and Conditions Video',onTap: (){
                Helper.launchURL(state.model.data?.video??'');
             },):Container(),
        Html(data: state.model.data?.content??'')
       ]));
}
else
return CircularWidgetC();
})));} 

}
      