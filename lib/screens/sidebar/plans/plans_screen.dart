import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/cubits/plans_cubit.dart';
import 'package:kasnew/response_model/plan_request_model.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/states/plans_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/text_view_small.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';

@RoutePage()
class PlansScreen extends StatefulWidget {
  String? type;
   PlansScreen({required this.type});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PlansCubit>().login(PlansRequestModel(userId: ApiConstant.userId,
    lang: ApiConstant.langCode,
    type:widget.type));
  }
  Widget build(BuildContext context) {
     double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return 
    BlocConsumer<PlansCubit, PlansState>(
            listener: (context, state) {
           
      if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text=='Success') {
   
      }
      else if(state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text!='Success'){

      }
    },
     builder: (context, state) {
     if(  state.networkStatusEnum==NetworkStatusEnum.loading){
      return Center(child: CircularProgressIndicator(color: appColor,));
    }
    if( state.networkStatusEnum==NetworkStatusEnum.loaded){
      var langData= state.model.data?.langData;
      var planData= state.model.data?.planData;
     return Scaffold(
      appBar: TitleAppBarWidget(title: state.model.data?.langData?.planTypeName),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(screenPadding),
          child: Column(
          
          children: [
            Container(
              height: sheight/8,
              width: swidth,
              decoration: BoxDecoration(
          color: appColor
              ),
              child: Center(
              child: TextViewMedium(name: langData?.planTypeName,textColors: whiteColor,fontWeight: FontWeight.bold,),
            ),),
            ListView.builder(
              scrollDirection: Axis.vertical,
              physics:NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:planData?.length,
              itemBuilder: (context,index){
              return Padding(
                padding:  EdgeInsets.only(top:screenPadding),
                child: InkWell(
                  onTap:(){
                    context.router.push(PlanDetailScreen(planId: planData![index].id));
                  },
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding:  EdgeInsets.all(screenPadding/2),
                      child: Center(
                        child: Column(
                         
                          children: [
                          TextViewLarge(title: planData?[index].planName,textcolor: appColor,fontWeight:FontWeight.bold,),
                        
                        
                        widget.type!='flexible_plan'?  TextViewSmall(title:'${langData?.duration}:${planData?[index].duration}',textcolor: appColor,):Container(),
                        
                         widget.type!='flexible_plan'?  TextViewSmall(title:'${langData?.payable}:${planData?[index].planAmount}',textcolor: appColor,):Container(),
                        ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            })
          ],
          ),
        ),
      ),);
  }
  else{
    return CircularWidgetS();
  }
});}}