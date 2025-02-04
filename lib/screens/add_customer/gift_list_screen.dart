import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/cubits/gift_list_cubit.dart';
import 'package:kasnew/cubits/group_code_cubit.dart';
import 'package:kasnew/request_model/gift_list_request_model.dart';
import 'package:kasnew/request_model/group_code_request_model.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/states/gift_list_state.dart';
import 'package:kasnew/states/group_code_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/drop_down_widget.dart';
import 'package:kasnew/widgets/gift_card_widget.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/no_data_widget.dart';
import 'package:kasnew/widgets/no_userId_function.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';
@RoutePage()
class GiftListScreen extends StatefulWidget {
  const GiftListScreen({super.key});

  @override
  State<GiftListScreen> createState() => _GiftListScreenState();
}

class _GiftListScreenState extends State<GiftListScreen> {
  String? groupCode=null;
   String? planType=null;
   String? planCategory=null;
    @override
  void initState(){
    super.initState();
    context.read<GiftListCubit>().login(GiftListRequestModel(userId: ApiConstant.userId,lang: ApiConstant.langCode,
    ));
  }

  Widget build(BuildContext context) {
    LangModel? lang=ApiConstant.language;
  
    var d=lang?.data;
     double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: TitleAppBarWidget(title: 'Gifts'),
      body:   BlocConsumer<GiftListCubit, GiftListState>(
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
     Helper.isUser()==true?       Column(
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
                          TextViewLarge(title: '${d?.myGifts??'My Gifts'}',fontWeight: FontWeight.w700,textcolor: blackColor,),
                             ( data?.myGifts?.length??0)>0?        SizedBox(
                            height:(data?.myGifts?.length??0)>1? sheight/2.2:sheight/3.5,
                            child: ListView.builder(
                             itemCount: data?.myGifts?.length,
                            
                             physics:AlwaysScrollableScrollPhysics(),
                             itemBuilder: (context,index){
                             var mGifts=data?.myGifts?[index];
                                return   GiftCardWidget(
                                  planName: mGifts?.planName,
                                  planAmount:  mGifts?.planAmount,
                                  planId:  mGifts?.groupCode,
                                  giftPrize:  mGifts?.giftAmount,
                                  acNumber:  mGifts?.accountNo,
                                  image: mGifts?.giftImage,
                                  status:  mGifts?.giftStatus,
                                  giftName:  mGifts?.giftName,
                                  orderId: mGifts?.orderId,
                                );}),
                          ):NoDataWidget(title: '${d?.noGifts??'No Gifts'}!!'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ):Container(),
                
                 TextViewLarge(title: '${d?.otherPlanGifts??'Other Plan Gifts'}',fontWeight: FontWeight.w700,textcolor: blackColor,),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropDownWidget1(size: planType,width:swidth ,
                    hint: '${d?.selectPlanType??'Select Plan Type'}', items: data?.planTypes??[], onChanged:(p0){
                           setState(() {
                             planType=p0;
                           });
                            setState(() {
                            groupCode=null;
                           });
                            context.read<GroupCodeCubit>().login(GroupCodeRequestModel
                            (userId: ApiConstant.userId,lang: ApiConstant.langCode,
                           planType: planType?.toLowerCase()
                               ));

                  } ),
                ),
                planType?.toLowerCase()=='monthly'?Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropDownWidget1(size: planCategory,width:swidth ,
                    hint: '${d?.selectPlanCategory??'Select Plan category'}', items: data?.planCategories?.monthly??[], onChanged:(p0){
                           setState(() {
                             planCategory=p0;
                           });
                            setState(() {
                            groupCode=null;
                           });
                            context.read<GroupCodeCubit>().login(GroupCodeRequestModel
                            (userId: ApiConstant.userId,lang: ApiConstant.langCode,
                           planType: planType?.toLowerCase(),planCategory: planCategory
                               ));

                  } ),
                ):Container(),
                 BlocConsumer<GroupCodeCubit,GroupCodeState>(
                  listener: (context, gstate) {
                    
                  },
                  
                    builder: (context, gstate) {
                      
                    if(gstate.networkStatusEnum==NetworkStatusEnum.loaded)
                     return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropDownWidget1(size: groupCode,width:swidth ,isSearch: true,
                      
                        hint: '${d?.typeGroupCode??'Type Group code'}', items: gstate.model.data??[], onChanged:(p0){
                               setState(() {
                                 groupCode=p0;
                               });
                                context.read<GiftListCubit>().login(GiftListRequestModel
                                (userId: ApiConstant.userId,lang: ApiConstant.langCode,
                                groupCode: groupCode
                                   ));
                      } ),
                                     );
                                     else{
                                      return Container();
                                     }
                       }),
                 
          (data?.gifts?.length??0)>0?        ListView.builder(
             itemCount: data?.gifts?.length,
             shrinkWrap: true,
             physics: NeverScrollableScrollPhysics(),
             itemBuilder: (context,index){
             var mGifts=data?.gifts?[index];
                return   GiftCardWidget(
                  planName: mGifts?.planName,
                  planAmount:  mGifts?.planAmount,
                  planId:  mGifts?.groupCode,
                  giftPrize:  mGifts?.giftAmount,
                  
                  image: mGifts?.giftImage,
                 
                  giftName:  mGifts?.giftName,
                );}):NoDataWidget(title: '${d?.noGiftsForThisPlan??'No Gifts for this plan '}'),
                ])),
       );
              
              }
              else{
  return CircularWidgetC();
              }   
    
  }));
  }}