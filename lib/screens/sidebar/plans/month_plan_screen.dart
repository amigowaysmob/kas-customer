import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/cubits/month_plans_cubit.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/response_model/month_plans_model.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/states/month_plans_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/text_view_small.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';

@RoutePage()
class MonthPlansScreen extends StatefulWidget {
   String? type;
 MonthPlansScreen({required this.type});

  @override
  State<MonthPlansScreen> createState() => _MonthPlansScreenState();
}

class _MonthPlansScreenState extends State<MonthPlansScreen> {
LangData? langData=LangData();
PlanData? planData=PlanData();
  
  @override
  void initState() {
    super.initState();
    context.read<MonthPlansCubit>().login(HomeRequestModel(userId: ApiConstant.userId,
    lang: ApiConstant.langCode,));
  }
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return 
    BlocConsumer<MonthPlansCubit, MonthPlansState>(
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
 langData= state.model.data?.langData;
 planData=state.model.data?.planData;

     return Scaffold(
      appBar: TitleAppBarWidget(title: state.model.data?.langData?.planTypeName),
      body: SingleChildScrollView(
       child: Padding(padding: EdgeInsets.all(screenPadding),
       child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[  Container(
            height: sheight/9,
            width: swidth,
            decoration: BoxDecoration(
        color: appColor
            ),
            child: Center(
            child: TextViewMedium(name: langData?.planTypeName,textColors: whiteColor,fontWeight: FontWeight.bold,),
          ),),
        
            ExpansionTile(
              iconColor: appColor,
              title:Container(
               child: Center(
            child: TextViewMedium(name: 'PONMAGAL GOLD PLAN',textColors: appColor,fontWeight: FontWeight.bold,),
          ),
            ) ,
            children: [
              SizedBox(
            height: sheight/1.5,
            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              itemCount:planData?.ponmagal?.length,
              itemBuilder: (context,index){
                var ponmagal=planData?.ponmagal?[index];
              return Padding(
                padding:  EdgeInsets.only(top:screenPadding),
                child: InkWell(
                  onTap:(){
                    
                    context.router.push(PlanDetailScreen(planId:ponmagal?.id));
                  },
                  child: Card(
                    elevation: 5,
                    child: Container(
                          height: sheight/9,
                         decoration: BoxDecoration(border: Border.all(color: greyColor,width: 0.5,),
                         borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding:  EdgeInsets.all(screenPadding/2),
                            child: Center(
                              child: Column(
                               
                                children: [
                                TextViewLarge(title:ponmagal?.planName,textcolor: appColor,fontWeight:FontWeight.bold,),
                                TextViewSmall(title:'${langData?.duration}:${ponmagal?.duration}',textcolor: appColor,),
                              
                                Expanded(child: TextViewSmall(title:'${langData?.payable}:${ponmagal?.planAmount}',textcolor: appColor,)),
                              ],
                              ),
                            ),
                          ),
                        ),
                  ),
                ),
              );
            }),
          )
                
        ]),
         ExpansionTile(
            iconColor: appColor,title:Container(
               child: Center(
            child: TextViewMedium(name: 'VIRUTCHAM GOLD PLAN',textColors: appColor,fontWeight: FontWeight.bold,),
          ),
            ) ,
            children: [
              SizedBox(
            height: sheight/1.9,
            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              itemCount:planData?.virucham?.length,
              itemBuilder: (context,index){
                var virucham=planData?.virucham?[index];
              return Padding(
                padding:  EdgeInsets.only(top:screenPadding),
                child: InkWell(
                  onTap:(){
                    context.router.push(PlanDetailScreen(planId:virucham?.id));
                  },
                  child: Card(
                    elevation: 5,
                    child: Container(
                          height: sheight/9,
                         decoration: BoxDecoration(border: Border.all(color: greyColor,width: 0.5,),
                         borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding:  EdgeInsets.all(screenPadding/2),
                            child: Center(
                              child: Column(
                               
                                children: [
                                TextViewLarge(title:virucham?.planName,textcolor: appColor,fontWeight:FontWeight.bold,),
                                TextViewSmall(title:'${langData?.duration}:${virucham?.duration}',textcolor: appColor,),
                              
                                Expanded(child: TextViewSmall(title:'${langData?.payable}:${virucham?.planAmount}',textcolor: appColor,)),
                              ],
                              ),
                            ),
                          ),
                        ),
                  ),
                ),
              );
            }),
          )
                
        ])
            ],)
        
        
        
          
          )
        
      ));
    } 
else
return CircularProgressIndicator();
}
        );
  }
}