import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kasnew/cubits/lucky_draw_cubit.dart';
import 'package:kasnew/cubits/lucky_months_cubit.dart';
import 'package:kasnew/cubits/winners_cubit.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/request_model/lucky_draw_request_mode.dart';
import 'package:kasnew/request_model/winners_request_model.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/router/router_path.dart';
import 'package:kasnew/screens/lucky_draw/widgets/detail_cart_widget.dart';
import 'package:kasnew/screens/lucky_draw/widgets/non_eligible_widget.dart';
import 'package:kasnew/screens/lucky_draw/widgets/paid_list_widget.dart';
import 'package:kasnew/screens/lucky_draw/widgets/title_container_widget.dart';
import 'package:kasnew/screens/lucky_draw/widgets/winners_widget.dart';
import 'package:kasnew/screens/paydues/pay_dues_screen.dart';
import 'package:kasnew/states/lucky_draw_state.dart';
import 'package:kasnew/states/lucky_months_state.dart';
import 'package:kasnew/states/winners_state.dart';

import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/drop_down_widget.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/no_data_widget.dart';
import 'package:kasnew/widgets/no_userId_function.dart';
import 'package:kasnew/widgets/plan_name_widget.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';

import '../../utils/constants/api_constants.dart';
@RoutePage()
class LuckyScreen extends HookWidget {
  const LuckyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
     LangModel? lang=ApiConstant.language;
  
    var d=lang?.data;
    var months=useState<List<String?>?>(null);
  var time=useState<String?>(null);
    useEffect(() {
      // Trigger the API call when the widget is first built
      context.read<LuckyMonthsCubit>().login(HomeRequestModel(
        userId: ApiConstant.userId,
        lang: ApiConstant.langCode,
         // Replace with the appropriate value for orderId
      ));
      context.read<LuckyDrawCubit>().login(LuckyDrawRequestModel(
        userId: ApiConstant.userId,
        lang: ApiConstant.langCode,
         // Replace with the appropriate value for orderId
      ));
      return null; // No cleanup needed
    }, []);
    return Scaffold(
      appBar: TitleAppBarWidget(title:d?.luckyDraw?? 'Lucky Draw',),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(screenPadding/2),
          child: Column(
            children: [
               TitleContainerWidget(iconData: Icons.description,
                title:d?.termsAndConditions??'Terms and Conditions',onTap: (){
                context.router.pushNamed(RouterPath.lucky_terms_path);
             },),
              
              TitleContainerWidget(
                                      iconData: Icons.chat,
                                      title:d?.contactUs??'Contact US' ,onTap: (){
                      context.router.push(ContactScreen(isLucky: true));
                                     },),
                                      BlocBuilder<LuckyMonthsCubit,LuckyMonthsState>(
                    builder: (context, mstate) {
                        if (mstate.networkStatusEnum == NetworkStatusEnum.loading) {
                      return Container();
                    } else if (mstate.networkStatusEnum == NetworkStatusEnum.loaded) {
                      print('month called');
                       List<String> monthLabels =
          mstate.model.data?.map((e) => e.label ?? '').toList() ?? [];
                                     return DropDownWidget1(hint:d?.selectMonth??'Select Month' ,items:monthLabels,
                                     width: swidth,
                                     onChanged: (p0){
                                       String? selectedValue = mstate.model.data
              ?.firstWhere((e) => e.label == p0, )
              .value;
time.value=selectedValue;
          if (selectedValue != null) {
            context.read<LuckyDrawCubit>().login(LuckyDrawRequestModel(
        userId: ApiConstant.userId,
        lang: ApiConstant.langCode,
        period: selectedValue
         // Replace with the appropriate value for orderId
      ));
                                     }},);
                                   }
                                   else{
                                    return Container();
                                   }
   } ),
   TitleContainerWidget(iconData: Icons.group,
                title:d?.winners??"Winners",onTap: (){
                 _showWinnersDialog(context,time.value) ;
             },), 
              MultiBlocListener(
                listeners: [
                  BlocListener<LuckyDrawCubit,LuckyDrawState>(
                    listener: (context,state){
                          
                    },),
                     BlocListener<LuckyMonthsCubit,LuckyMonthsState>(
                    listener: (context,state){
                    
                    },),
                    ],
                  child:  Helper.isUser()?  Column(
                    children: [
                      
                      BlocBuilder<LuckyDrawCubit,LuckyDrawState>(
                        builder: (context, state) {
                            if (state.networkStatusEnum == NetworkStatusEnum.loading) {
                          return CircularWidgetC();
                        } else if (state.networkStatusEnum == NetworkStatusEnum.loaded) {
                          var data=state.model.data;
                        
                               return Column(
                          children: [
                                     
                                     vericalSpaceMedium,
                              (data?.ledgerData?.length??0)>0?       ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount:data?.ledgerData?.length,
                                      itemBuilder: (context,index){
                                        var lData=data?.ledgerData?[index];
                              return  Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(color: appColor,borderRadius: BorderRadius.circular(10)),
                                    child: ExpansionTile(
                                    iconColor: whiteColor,
                                      title: Column(children: [
                                            PlanNameWidget(title:lData?.planName,color: whiteColor,),
                                 
                                            RowTextWidget(title:d?.acNumber?? 'A/C Number', value: lData?.accountNumber,color: whiteColor,),
                                           RowTextWidget(title:d?.planType?? 'Plan Type', value: lData?.planType,color: whiteColor,),
                                           ],),
                                           children: [ 
                                            DetailCardWidget(cData: lData,),
                                            PaidListWidget(ldata: lData,),
                                            NoneligibleWidget(eligible: lData?.luckyDrawEligible,win: lData?.win,time: time.value,nextLuckyDrawDate: lData?.nextLuckyDrawDate,),
                                           ],),
                                  ),
                      
                                  vericalSpaceMedium,
                                  
                                ],
                              );
                                     },):NoDataWidget(title:'No Plans'),
                      
                          
                                    //  TitleContainerWidget(title:'FAQ' ,
                                    //  iconData: Icons.book,
                                    //  onTap: (){
                      
                                    //  },),
                                    
                          ],
                        );
                        
                        }
                        else{
                          return Container();
                        }
                        }
                      ),
                    ],
                  ):Container(),
                
              ),
       ] )
          )
        ),
      ) ;
    
  }
}
void _showWinnersDialog(BuildContext context,String? time) {
  context.read<WinnersCubit>().login(WinnersRequestModel(userId: ApiConstant.userId,period: time));
  showDialog(
    context: context,
    builder: (BuildContext context) {
       LangModel? lang=ApiConstant.language;
  
    var d=lang?.data;
      return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocConsumer<WinnersCubit,WinnersState>(
            listener:(context,state){
          
          },
            builder: (context,state){
          if (state.networkStatusEnum == NetworkStatusEnum.loading) {
                              return CircularWidgetC();
                            } else if (state.networkStatusEnum == NetworkStatusEnum.loaded) {
                              return  (state.model.data?.winners?.length??0)>0? Column(
                                children: [
                                PlanNameWidget(title:d?.winners?? 'Winners',),
                                TitleContainerWidget(title:d?.luckyDrawVideo??  'Lucky Draw Video',  faIcon: FontAwesomeIcons.youtube,iconColor: redColor,),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: state.model.data?.winners?.length,
                                    physics: AlwaysScrollableScrollPhysics(),
                                    itemBuilder: (context,index){
                                      return WinnerWidget(data:state.model.data?.winners?[index]);
                                  }),
                                  vericalSpaceMedium,
                                  ButtonWidget(onPressed: (){
                                    context.router.pop();
                                  }, buttonName:d?.close?? 'Close', buttonColor: appColor,)
                                ],
                              ):NoDataWidget(title:d?.noWinnersYet??  'No Winners Yet!');
          }
          else{
          return Container();
          }
           },
           ),
        ],
      ), 
      
       
      );
    },
  );
}