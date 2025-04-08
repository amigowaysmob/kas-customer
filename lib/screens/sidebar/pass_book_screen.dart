import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/cubits/e_passbook_cubit.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/states/e_passbook_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/file_downloader.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/no_data_widget.dart';
import 'package:kasnew/widgets/plan_name_widget.dart';
import 'package:kasnew/widgets/row_bold_text_widget.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';
import 'package:url_launcher/url_launcher.dart';
@RoutePage()
class PassBookScreen extends StatefulWidget {
  const PassBookScreen({super.key});

  @override
  State<PassBookScreen> createState() => _PassBookScreenState();
}

class _PassBookScreenState extends State<PassBookScreen> {
  void initState(){
    super.initState();
context.read<EPassBookCubit>().login(HomeRequestModel(userId: ApiConstant.userId,
    lang: ApiConstant.langCode,));
  }
  downloadFileLocal(String url) {
      if (url.isNotEmpty) {
       
        final fileDownloader = FileDownloader();
        fileDownloader.downloadFile(url );
      }
    }
  @override
  Widget build(BuildContext context) {
       LangModel? lang=ApiConstant.language;
  
    var d=lang?.data;
     double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: TitleAppBarWidget(title: d?.passbook??'Pass Book'),
      body: BlocConsumer<EPassBookCubit,EPassBookState>(
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
      var data=state.model.data;
     return data!=null && data.isNotEmpty? ListView.builder(
      shrinkWrap: true,
      itemCount:data?.length ,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context,index){
      var pData=data?[index];
          return Padding(
            padding:  EdgeInsets.all(screenPadding),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   PlanNameWidget(title:pData?.planName ,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           RowBoldTextWidget(title: d?.acNumber??'A/C Number', value:pData?.accountNo ),
                           RowBoldTextWidget(title: d?.groupCode??'Group Code', value: pData?.groupCode),
                           RowBoldTextWidget(title: d?.planAmount??'Plan Amount', value:'₹${pData?.planAmount}' ),
                         ],
                       ),
                      ButtonWidget(onPressed: (){
                           downloadFileLocal(pData?.downloadLink??'');
                      }, buttonName: d?.download??'Download', buttonColor: appColor,
                      width: swidth/3,
                      icon: Icon(Icons.download_outlined,color: whiteColor,),)
                     ],
                   ),
                 ],
                ),
              ),
            ),
          );
          
        }
        ):NoDataWidget(title: 'No passbook Data!');
  }
  else{
    return CircularWidgetC();
  }}
  ));
  }
}

_launchURL(String url) async {
    final Uri urll = Uri.parse(url);
  if (await canLaunchUrl(urll)) {
    await launchUrl(urll);
  } else {
    throw 'Could not launch $urll';
  }
}