import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/cubits/month_plans_cubit.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/request_model/stepper_form_request_model.dart';
import 'package:kasnew/response_model/month_plans_model.dart';
import 'package:kasnew/response_model/stepper_model.dart' as s;
import 'package:kasnew/states/month_plans_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/plan_widget.dart';
import 'package:kasnew/widgets/text_view_medium.dart';



class MonthPlanForm extends StatefulWidget {
   String? type;
   final StepperFormRequestModel?formData;
  s. LangData? langData;
  VoidCallback? goToStep4;
 MonthPlanForm({ this.type,this.formData,this.langData,this.goToStep4});

  @override
  State<MonthPlanForm> createState() => _MonthPlanFormState();
}

class _MonthPlanFormState extends State<MonthPlanForm> {
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

     return 
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[  
        
            ExpansionTile(
              iconColor: appColor,
              title:Container(
               child: Center(
            child: TextViewMedium(name: 'Ponmagal Gold Plan',textColors: appColor,fontWeight: FontWeight.bold,),
          ),
            ) ,
            children: [
              SizedBox(
            // height: sheight/1.4,
            child: ListView.builder(
               shrinkWrap:true,
              physics: NeverScrollableScrollPhysics(),
              itemCount:planData?.ponmagal?.length,
              itemBuilder: (context,index){
                var plan=planData?.ponmagal?[index];
              return 
             PlanWidget(

currentId:plan?.id,
            id:widget.formData?.plan??'',
            planName: plan?.planName,
            durationName: langData?.duration,
            duration: plan?.duration,
            amountName: "payable",
            amount: plan?.planAmount,
click:widget.langData?.clickHereMoreDetails,
            join:
            //  isJoined.value==formData.plan? langData?.joined:
             widget.langData?.join,
              joined:widget.langData?.joined,
            buttonColor:
            // isJoined.value==formData.plan? Colors.green:
            appColor,
            onPressed: () {
           
            
                              // selectedPlanId = plan?.id;
                              widget.formData?.plan = plan?.id;
                              widget.formData?.planName = plan?.planName;
                              widget.formData?.duration = plan?.duration;
                              widget.formData?.dailyDue = plan?.planAmount;
                              widget.formData?.plan_type = plan?.planType;
                              widget.formData?.due_count_limit = plan?.dueCountLimit;
                        widget.goToStep4?.call();
          //  widget.  formData?.plan=plan?.id;

           
          //    widget.formData?.planName=plan?.planName;
          //    widget.formData?.duration=plan?.duration;
          //    widget.formData?.dailyDue=plan?.planAmount;
          //    widget.formData?.plan_type=plan?.planType;
          //    widget.formData?.due_count_limit=plan?.dueCountLimit;
            },
          );                       }
                  ),
                ),
              
            ]),
        
                
      
         ExpansionTile(
            iconColor: appColor,title:Container(
               child: Center(
            child: TextViewMedium(name: 'Virutcham Gold Plan',textColors: appColor,fontWeight: FontWeight.bold,),
          ),
            ) ,
            children: [
            SizedBox(
            // height: sheight/1.45,
            child: ListView.builder(
              shrinkWrap:true,
              physics: NeverScrollableScrollPhysics(),
              itemCount:planData?.virucham?.length,
              itemBuilder: (context,index){
                var plan=planData?.virucham?[index];
              return 
             PlanWidget(

currentId:plan?.id,
            id:widget.formData?.plan??'',
            planName: plan?.planName,
            durationName: langData?.duration,
            duration: plan?.duration,
            amountName: langData?.payable,
            amount: plan?.planAmount,
click:widget.langData?.clickHereMoreDetails,
            join:
            //  isJoined.value==formData.plan? langData?.joined:
             widget.langData?.join,
              joined:widget.langData?.joined,
            buttonColor:
            // isJoined.value==formData.plan? Colors.green:
            appColor,
            onPressed: () {
           
           widget.  formData?.plan=plan?.id;

       
           
        widget.  formData?.plan==   plan?.id?print('green color'):print('appcolor');
             widget.formData?.planName=plan?.planName;
             widget.formData?.duration=plan?.duration;
             widget.formData?.dailyDue=plan?.planAmount;
             widget.formData?.plan_type=plan?.planType;
             widget.formData?.due_count_limit=plan?.dueCountLimit;
              widget.goToStep4?.call();
            },
          );                       }
                  ),
                ),
                
        ])
            ],);
        
        
        
          
    
        
      
    } 
else
return CircularProgressIndicator();
}
  
  );}}