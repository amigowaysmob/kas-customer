import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kasnew/request_model/stepper_form_request_model.dart';
import 'package:kasnew/screens/add_customer/heading_widget.dart';
import 'package:kasnew/screens/add_customer/month_plan_form.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/widgets/plan_widget.dart';
import 'package:kasnew/widgets/text_form_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';

import '../../response_model/stepper_model.dart';


class StepForm3 extends HookWidget {
  final GlobalKey<FormState> formKey;
  final StepperFormRequestModel formData;
  final Data? data;
  final LangData? langData;
 VoidCallback? goToStep4;
 bool? isExists;
  StepForm3({
    required this.formKey,
    required this.formData,
    required this.data,
    required this.langData,
    required this.goToStep4,
    this.isExists
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController passBookController=useTextEditingController();
   
    final isExpandedd = useState<List<bool>>([false, false, false]);
    final isLoading = useState(true);
final isJoined=useState('');
  List<  PlanData>?planData = data?.planData;
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;


   

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingWidget(title: langData?.selectYourPlan),
          vericalSpaceLarge,
        isExists==true?  TextForm(
                            controller: passBookController,
                            keyboardType: TextInputType.text,
                            labelText: 'Passbook name',
                            onSaved: (value) => formData.passbook_name = value,
                            // validating: _validatecity,
                            // readOnly: true,
                          ):Container(),
          vericalSpaceLarge,
          Column(
            children: [
              ListView.builder(
                itemCount: planData?.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                var main=planData?[index];
              return index!=2? ExpansionTile(
                          initiallyExpanded:false ,
                          iconColor: appColor,
                          title: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:  Container(
                              height: sheight/18,
              width: swidth,
              color: appColor,
                              child: Center(child: TextViewLarge(title: main?.title,fontWeight: FontWeight.w700,)))),
                            children: [
                            ListView.builder(
                               itemCount: main?.values?.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context,subIndex){
                                var plan=main?.values?[subIndex];
                            return PlanWidget(
                              isJoined:isJoined.value,
                              currentId:plan?.id,
                              planType:plan?.planType ,
                                          id:formData.plan??'',
                                          planName: plan?.planName,
                                          durationName: langData?.duration,
                                          duration: plan?.duration,
                                          amountName: getAmount(index, langData),
                                          amount: plan?.planAmount,
                              click:langData?.clickHereMoreDetails,
                                          join:
                                            // isJoined.value==formData.plan? langData?.joined:
                                           langData?.join,
                                            joined:langData?.joined,
                                          buttonColor:
                                          // isJoined.value==formData.plan? Colors.green:
                                          appColor,
                                          onPressed: () {
                                           isJoined.value=plan?.id??'';
                                           formData.plan=plan?.id;
                              formData.passbook_name =passBookController.text;
                                         
                                           formData.planName=plan?.planName;
                                           formData.duration=plan?.duration;
                                           formData.dailyDue=plan?.planAmount;
                                           formData.plan_type=plan?.planType;
                                           formData.due_count_limit=plan?.dueCountLimit;
                                           goToStep4?.call();
                                          },
                                        );
              })  
                            ],):ExpansionTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                                height: sheight/18,
                            width: swidth,
                             color: appColor,
                           
                                child: Center(child: TextViewLarge(title:'Monthly',textcolor: whiteColor,fontWeight: FontWeight.w700,))),
                ),
                children: [
                  MonthPlanForm(formData: formData,langData: langData,goToStep4:goToStep4),
                ],
              );
              }),
              
            ],
          )
          // ExpansionPanelList(
          //  expansionCallback: (int index, bool isExpanded) {
          //     final newExpandedState = List<bool>.from(isExpandedd.value);
          //     newExpandedState[index] = !newExpandedState[index];
          //     isExpandedd.value = newExpandedState;
          //   },
          //   children: [
          //     _buildExpansionPanel(
          //      langData?.dailyGoldPlan?? '',
          //       planData?.daily,
          //       0,
          //       isExpandedd.value,
          //     ),
            
          //     _buildExpansionPanel(
          //       langData?.weeklyGoldPlan ?? '',
          //       planData?.weekly,
          //       1,
          //       isExpandedd.value,
          //     ),
          //     _buildExpansionPanel(
          //       langData?.monthlyGoldPlan ?? '',
          //       planData?.monthly,
          //       2,
          //       isExpandedd.value,
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

//   ExpansionPanel _buildExpansionPanel(
//       String header, List<Plan>? plans, int index, List<bool> isExpandedd) {
//         var isJoined=useState('');
//     return ExpansionPanel(
//       headerBuilder: (BuildContext context, bool isExpanded) {
//          double swidth = MediaQuery.of(context).size.width;
//     double sheight = MediaQuery.of(context).size.height;
//         return Container(
//           width: swidth,
//           color: appColor,
//          child: Center(child: TextViewLarge(title: header),),
//         );
//       },
//       body:
//       index==2?MonthPlanForm(formData: formData,langData: langData,goToStep4:goToStep4):
//        Column(

//         children: plans?.map((plan) {
//           var amountName;
//           if (index == 0) {
//             amountName = langData?.payableInDays;
//           } else if (index == 1) {
//             amountName = langData?.payableInWeeks;
//           } else {
//             amountName = langData?.payableInMonths;
//           }
//       var planIndex = plans!.indexOf(plan);
//       print(planIndex);
      
//           return PlanWidget(
// isJoined:isJoined.value,
// currentId:plan.id,
//             id:formData.plan??'',
//             planName: plan.planName,
//             durationName: langData?.duration,
//             duration: plan.duration,
//             amountName: amountName,
//             amount: plan.planAmount,
// click:langData?.clickHereMoreDetails,
//             join:
//             //  isJoined.value==formData.plan? langData?.joined:
//              langData?.join,
//               joined:langData?.joined,
//             buttonColor:
//             // isJoined.value==formData.plan? Colors.green:
//             appColor,
//             onPressed: () {
//              isJoined.value=plan.id??'';
//              formData.plan=plan.id;

//              print( isJoined.value) ;
//              print(formData.plan);
//              formData.planName=plan.planName;
//              formData.duration=plan.duration;
//              formData.dailyDue=plan.planAmount;
//              formData.plan_type=plan.planType;
//              formData.due_count_limit=plan.dueCountLimit;
//              goToStep4?.call();
//             },
//           );
//         }).toList() ?? [],
//       ),
//       isExpanded: isExpandedd[index],
//     );
//   }
}

String? getAmount(int? index,LangData? langData){
  switch(index){
    
     case 0:
    return langData?.payableInDays;
     case 1:
    return langData?.payableInWeeks;
     case 2:
    return langData?.payableInMonths;
    case 3:
    return '';
  default:
        return '';
    
  }}