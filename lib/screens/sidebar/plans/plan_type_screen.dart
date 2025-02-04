import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/cubits/plan_types_cubit.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/states/plan_types_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/text_view_small.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';

@RoutePage()
class PlanTypesScreen extends StatefulWidget {
  const PlanTypesScreen({super.key});

  @override
  State<PlanTypesScreen> createState() => _PlanTypesScreenState();
}

class _PlanTypesScreenState extends State<PlanTypesScreen> {
  @override
   void initState() {
    super.initState();
    context.read<PlanTypesCubit>().login(HomeRequestModel(userId: ApiConstant.userId,
    lang: ApiConstant.langCode,
   ));
  }
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
      return 
    BlocConsumer<PlanTypesCubit, PlanTypesState>(
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
     return Scaffold(
   appBar:TitleAppBarWidget(title: state.model.data?.langData?.ourPlans??'') ,
      body:  ListView.builder(
              padding: EdgeInsets.all(screenPadding),
             
              itemCount: state.model.data?.planData?.length,
              itemBuilder: (context, index) {
                var image=state.model.data?.planData?[index].image;
                var title=state.model.data?.planData?[index].title;
                // var titlee=state.model.data?.langData.
                return 
                    Column(
                      children: [
                        InkWell(
                          onTap: (){
                            if(state.model.data?.planData?[index].type=='daily_gold_plan' || state.model.data?.planData?[index].type=='weekly_gold_plan'||state.model.data?.planData?[index].type=='flexible_plan')
                            context.router.push(PlansScreen(type:state.model.data?.planData?[index].type ));
                            else if(state.model.data?.planData?[index].type=='monthly_gold_plan')
                             context.router.push(MonthPlansScreen(type:state.model.data?.planData?[index].type ));
 else if(state.model.data?.planData?[index].type=='flexible_plan'){
// context.router.push(PlanDetailScreen(planId:state.model.data?.planData?[index].id )
 }
                          },
                          child: Card(
                            elevation: 5,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Image.network(
                                    image??'',
                                    fit: BoxFit.fill,
                                    height: sheight/7,
                                    width: swidth,
                                  ),
                                ),
                                
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child:ApiConstant.langCode!='ta'? TextViewMedium(name: title,fontSize:13):TextViewSmall(title: title,fontSizes: 12,),
                          )
                              ],
                            ),
                          ),
                        ),
                        vericalSpaceMedium
                      ],
                    );
                  
                 
              },
            ),

    );
  }
  else{
    return CircularWidgetS();
  }
});}}