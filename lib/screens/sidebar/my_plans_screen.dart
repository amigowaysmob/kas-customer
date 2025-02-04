import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/cubits/my_plans_cubit.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/states/my_plans_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/my_plans_widget.dart';
import 'package:kasnew/widgets/no_data_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';

@RoutePage()
class MyPlansScreen extends StatefulWidget {
  const MyPlansScreen({super.key});

  @override
  State<MyPlansScreen> createState() => _MyPlansScreenState();
}

class _MyPlansScreenState extends State<MyPlansScreen> {
  String? groupCode=null;
   String? planType=null;
   String? planCategory=null;
    @override
  void initState(){
    super.initState();
    context.read<MyPlansCubit>().login(HomeRequestModel(userId: ApiConstant.userId,lang: ApiConstant.langCode,
    ));
  }

  Widget build(BuildContext context) {
     LangModel? lang=ApiConstant.language;
  
    var d=lang?.data;
     double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: TitleAppBarWidget(title:'${d?.myPlans?? 'My Plans'}'),
      body:   BlocConsumer<MyPlansCubit, MyPlansState>(
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
     return
       SingleChildScrollView(
         child: Padding(padding: EdgeInsets.all(screenPadding),
         child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         Column(
       crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Scrollbar(
                  child: Card(
                    elevation:5,
                    shadowColor: appColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextViewLarge(title: '${d?.myPlans??'My Plans'}',fontWeight: FontWeight.w700,textcolor: blackColor,),
                             ( data?.myPlans?.length??0)>0?        ListView.builder(
                              itemCount: data?.myPlans?.length,
                             shrinkWrap: true,
                              physics:NeverScrollableScrollPhysics(),
                              itemBuilder: (context,index){
                              var myPlans=data?.myPlans?[index];
                                 return   MyPlansWidget(
                                  plans:myPlans ,
                                 );}):NoDataWidget(title:'${d?.noPlans?? 'No Plans!!'}'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
                
                //  TextViewLarge(title: 'Search Other Plans',fontWeight: FontWeight.w700,textcolor: blackColor,),
                //  Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: DropDownWidget1(size: planType,width:swidth ,
                //     hint: 'Select Plan Type', items: data?.planTypes??[], onChanged:(p0){
                //            setState(() {
                //              planType=p0;
                //            });
                //             setState(() {
                //             groupCode=null;
                //            });
                //             context.read<GroupCodeCubit>().login(GroupCodeRequestModel
                //             (userId: ApiConstant.userId,lang: ApiConstant.langCode,
                //            planType: planType?.toLowerCase()
                //                ));

                //   } ),
                // ),
                // planType?.toLowerCase()=='monthly'?Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: DropDownWidget1(size: planCategory,width:swidth ,
                //     hint: 'Select Plan category', items: data?.planCategories?.monthly??[], onChanged:(p0){
                //            setState(() {
                //              planCategory=p0;
                //            });
                //             setState(() {
                //             groupCode=null;
                //            });
                //             context.read<GroupCodeCubit>().login(GroupCodeRequestModel
                //             (userId: ApiConstant.userId,lang: ApiConstant.langCode,
                //            planType: planType?.toLowerCase(),planCategory: planCategory
                //                ));

                //   } ),
                // ):Container(),
                //  BlocConsumer<GroupCodeCubit,GroupCodeState>(
                //   listener: (context, gstate) {
                    
                //   },
                  
                //     builder: (context, gstate) {
                      
                //     if(gstate.networkStatusEnum==NetworkStatusEnum.loaded)
                //      return Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: DropDownWidget1(size: groupCode,width:swidth ,isSearch: true,
                      
                //         hint: 'Type Group code', items: gstate.model.data??[], onChanged:(p0){
                //                setState(() {
                //                  groupCode=p0;
                //                });
                //                 context.read<PlanGroupCodeCubit>().login(GiftListRequestModel
                //                 (userId: ApiConstant.userId,lang: ApiConstant.langCode,
                //                 groupCode: groupCode
                //                    ));
                //       } ),
                //                      );
                //                      else{
                //                       return Container();
                //                      }
                //        }),
                //  BlocConsumer<PlanGroupCodeCubit,PlanGroupCodeState>(
                //   listener: (context, pstate) {
                    
                //   },
                  
                //     builder: (context, pstate) {
                      
                //     if(pstate.networkStatusEnum==NetworkStatusEnum.loaded){
                //     var inPlan=pstate.model.data?.planData;

                //      return Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child:inPlan!=null ? Card(
                //         elevation: 10,
                //         child: Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             PlanNameWidget(title: inPlan?.planName,),
                //             RowTextWidget(title: 'Plan Type', value: inPlan?.planType),
                //             RowTextWidget(title: 'Duration', value: inPlan?.duration),
                //             RowTextWidget(title: 'Plan Amount', value:'₹${inPlan?.planAmount}'),
                //             vericalSpaceSmall,
                //             InkWell(
                //                                 child: Text('Click here to more Details'??'',style:TextStyle(
                //                  color:blackColor,
                //                  fontSize: 12,
                //                   fontWeight: FontWeight.bold,
                //                     decoration: TextDecoration.underline,
                //                      fontFamily: 'Monoserrat'
                //                 ),),
                //                                 onTap: (){
                //                                  context.router.push(PlanDetailScreen(planId: inPlan?.id));
                //                               },
                //                               )
                //           ],
                //                                 ),
                //         ),
                //         )
                //         :Container());
                //         }
                                     
                //                      else{
                //                       return Container();
                //                      }
                //        }),
          // (data?.gifts?.length??0)>0?        ListView.builder(
          //    itemCount: data?.gifts?.length,
          //    shrinkWrap: true,
          //    physics: NeverScrollableScrollPhysics(),
          //    itemBuilder: (context,index){
          //    var mGifts=data?.gifts?[index];
          //       return   GiftCardWidget(
          //         planName: mGifts?.planName,
          //         planAmount:  mGifts?.planAmount,
          //         planId:  mGifts?.groupCode,
          //         giftPrize:  mGifts?.giftAmount,
                  
          //         image: mGifts?.giftImage,
                 
          //         giftName:  mGifts?.giftName,
          //       );}):NoDataWidget(title: 'No Gifts for this plan '),
                ])),
       );
              
              }
              else{
  return CircularWidgetC();
              }   
    
  }));
  }}