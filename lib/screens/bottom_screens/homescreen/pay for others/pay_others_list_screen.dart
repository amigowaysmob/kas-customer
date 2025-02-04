import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/cubits/pay_others_cubit.dart';
import 'package:kasnew/request_model/pay_others_request_model.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/router/app_router.gr.dart';

import 'package:kasnew/states/pay_others_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/no_data_widget.dart';
import 'package:kasnew/widgets/row_text_widget.dart';
import 'package:kasnew/widgets/text_view_small.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';

@RoutePage()
class PayOthersListScreen extends StatefulWidget {
  String? phoneNumber;
   PayOthersListScreen({this.phoneNumber});

  @override
  State<PayOthersListScreen> createState() => _PayOthersListScreenState();
}

class _PayOthersListScreenState extends State<PayOthersListScreen> {
  @override
  

  @override
  void initState() {
    super.initState();
    context.read<PayOthersCubit>().login(PayOthersRequestModel(
                  userId: ApiConstant.userId,
                  lang: ApiConstant.langCode,
                  searchTerm: widget.phoneNumber,
                  
                ));
  }
  Widget build(BuildContext context) {
     LangModel? lang=ApiConstant.language;
  
    var d=lang?.data;
    return  Scaffold(
      appBar: TitleAppBarWidget(title:d?.payForOthers??"Pay For Others"),
      body: SingleChildScrollView(
 child:    BlocConsumer<PayOthersCubit, PayOthersState>(
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
       (data?.length??0)>0?    Padding(
         padding:  EdgeInsets.all(screenPadding),
         child: ListView.builder(
              itemCount: data?.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
         
              var pData=data?[index];
              return Card(
                elevation: 10,
                child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  RowTextWidget(title: d?.name??'Name', value:pData?.customerName ),
                  RowTextWidget(title: d?.phoneNumber??'Phone Number', value:pData?.customerPhoneNumber ),
                 pData?.accountNo!=null &&( pData?.accountNo?.isNotEmpty??false)?   RowTextWidget(title: d?.acNumber??'A/c Number', value:pData?.accountNo ):Container(),
                pData?.planName!=null &&( pData?.planName?.isNotEmpty??false)?    RowTextWidget(title: d?.planName??'Plan Name', value:pData?.planName ):Container(),
                pData?.location!=null &&( pData?.location?.isNotEmpty??false)?  RowTextWidget(title: d?.location??'Location', value:pData?.location ):Container(),
                pData?.planCount!=null &&( pData?.planCount?.isNotEmpty??false)?  RowTextWidget(title: d?.planCount??'Plan Count', value:pData?.planCount ):Container(),
                   vericalSpaceSmall,
                   InkWell(
                      onTap:(){
                      context.router.push(PayDuesScreen(customerId:pData?.customerId ,)) ; 
                      },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.green
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: TextViewSmall(title:d?.viewDetails??'View Details',textcolor: whiteColor,fontWeight: FontWeight.bold,),
                                ),
                              ),
                            ),]),
              ));}),
       ):NoDataWidget(title: d?.noCustomer??'No Customer!');}
              else{
                return Container();
              }

})));} 

}
      