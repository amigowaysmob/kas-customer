import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kasnew/cubits/plan_detail_cubit.dart';
import 'package:kasnew/request_model/plan_detail_request_model.dart';
import 'package:kasnew/screens/add_customer/heading_widget.dart';
import 'package:kasnew/states/plan_detail_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';

@RoutePage()
class PlanDetailScreen extends StatefulWidget {
  String? planId;
   PlanDetailScreen({required this.planId});

  @override
  State<PlanDetailScreen> createState() => _PlanDetailScreenState();
}

class _PlanDetailScreenState extends State<PlanDetailScreen> {
  @override
 
  @override
  void initState() {
    super.initState();
    context.read<PlanDetailCubit>().login(PlanDetailRequestModel(userId: ApiConstant.userId,lang: ApiConstant.langCode,
    planId: widget.planId));
  }
  Widget build(BuildContext context) {
    return 
    BlocConsumer<PlanDetailCubit, PlanDetailState>(
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
var langData=state.model.data?.langData;
var planData =state.model.data?.planData;
     return Scaffold(
      appBar: TitleAppBarWidget(title: langData?.planDetails),
      body: SingleChildScrollView(
       child: Padding(padding: EdgeInsets.all(screenPadding),
       child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       HeadingWidget(title:planData?.planName ),
       vericalSpaceMedium,
       TextViewMedium(name: langData?.planSubHeading,fontWeight: FontWeight.w600,),
        TextViewMedium(name: langData?.welcomePlanDetail,fontWeight: FontWeight.w600,),
        vericalSpaceMedium,
        Html(data: planData?.description)

       ])),
    ));} 
else
return CircularProgressIndicator();
}
        );
  }
}