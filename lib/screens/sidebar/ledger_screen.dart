import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kasnew/cubits/ledger_cubit.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/states/ledger_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/join_plan_widget.dart';
import 'package:kasnew/widgets/no_userId_function.dart';
import 'package:kasnew/widgets/no_user_id_screen.dart';
import 'package:kasnew/widgets/plan_name_widget.dart';
import 'package:kasnew/widgets/row_bold_text_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/text_view_small.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';
@RoutePage()


class LedgerScreen extends StatefulWidget {
  bool? isChit;
  bool? isMenu;
   LedgerScreen({this.isChit,this.isMenu});
  

  @override
  State<LedgerScreen> createState() => _LedgerScreenState();
}

class _LedgerScreenState extends State<LedgerScreen> {
  @override
  void initState() {
    
    super.initState();
    context.read<LedgerCubit>().login(HomeRequestModel(userId: ApiConstant.userId,
    lang: ApiConstant.langCode,));

  
  }

  Widget build(BuildContext context) {
  
     double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: whiteColor,
      appBar:widget.isMenu==true? TitleAppBarWidget(title:widget.isChit==true?'Chit List': 'Ledger',):null,
    body:BlocConsumer<LedgerCubit, LedgerState>(
      listener: (context, state) {
        if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text == 'Success') {
          // Handle success case
        } else if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text != 'Success') {
          // Handle other loaded case
        }
      },
      builder: (context, state) {
        if (state.networkStatusEnum == NetworkStatusEnum.loading) {
          return CircularWidgetC();
        }
        if (state.networkStatusEnum == NetworkStatusEnum.loaded) {
          var data=state.model.data?.ledgerData;
          var d=state.model.data?.langData;
      return Helper.isUser()==true? SingleChildScrollView(
        child: (data?.length??0)>0? ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: data?.length,
          itemBuilder: (context,index){
          var leData=data?[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 5.0,
            child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PlanNameWidget(title: leData?.planName,),
                TextViewLarge(title:Helper.capitalizeFirstLetter(leData?.status??''),textcolor: getStatusColor(leData?.status),fontWeight: FontWeight.bold,),
              ],
            ),
        // leData?.accountNumber!=null &&(leData?.accountNumber?.isNotEmpty??false)?     RowBoldTextWidget(title: 'A/C Number', value:leData?.accountNumber ):Container(),
        //     RowBoldTextWidget(title: 'Installments', value:leData?.installments ),
        leData?.accountNumber!=null &&(leData?.accountNumber?.isNotEmpty??false)?     RowBoldTextWidget(title: 'A/C Number', value:leData?.accountNumber ):Container(),
            RowBoldTextWidget(title: '${d?.name??'Name'}', value:Helper.capitalizeFirstLetter(leData?.passbookName??'') ),
            
             RowBoldTextWidget(title: '${d?.planStartDate??'Plan Start Date'}', value:leData?.planStarted ),
            
             Row(
              mainAxisAlignment: MainAxisAlignment.start
              ,
              // crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                // RowBoldTextWidget(title: 'Pay mode', value:leData?.paymentMode ),
                   InkWell(
                    onTap:(){
                      widget.isChit==true?context.router.push(LedgerDetailScreen(id:leData?.id,isChit: true))
         : context.router.push(LedgerDetailScreen(id:leData?.id));
                    },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.green
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TextViewSmall(title:'${d?.viewDetails??'View Details'}',textcolor: whiteColor,fontWeight: FontWeight.bold,),
                              ),
                            ),
                          ),
                 
               ],
             ),
                  ],
            ),
          ),),
        );
        }):JoinPlanWidget(),
      ):NoUseridScreen(content: '${d?.viewLedgerDataLoginHere??'Login to access your Ledger securely'}');
   }
   else{
    return CircularWidgetS();
   } }));
  }
}

Color getStatusColor(String? status){
  switch(status?.toLowerCase()){
    
     case 'closed':
    return Colors.red;
     case 'pending':
    return Colors.yellow;
     case 'active':
    return Colors.green;
  default:
        return Colors.green;
    
  }}
  class LifecycleObserver extends WidgetsBindingObserver {
  final LifecycleCallback callback;

  LifecycleObserver(this.callback);

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    callback(null, state);
  }
}
