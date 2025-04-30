import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/cubits/get_feedback_cubit.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/screens/bottom_screens/homescreen/ticket_widget.dart';
import 'package:kasnew/states/get_feed_back_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/no_data_widget.dart';
import 'package:kasnew/widgets/review_widget.dart';
import 'package:kasnew/widgets/star_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/text_view_small.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';
@RoutePage()
class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  void initState(){
    super.initState();
    context.read<GetFeedBackCubit>().login(HomeRequestModel(userId: ApiConstant.userId,lang: ApiConstant.langCode));
  }
  @override
  Widget build(BuildContext context) {
    LangModel? lang=ApiConstant.language;
    var d=lang?.data;
     double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: TitleAppBarWidget(title:'${d?.feedBack?? 'Feedback'}'),
      body:  BlocConsumer<GetFeedBackCubit, GetFeedBackState>(
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
      var data=state.model.data?.reviews;
     return Padding(
       padding:  EdgeInsets.all(screenPadding),
       child: SingleChildScrollView(
         child: Column(children: [
          // ReviewWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextViewLarge(title: 'My Reviews',textcolor: appColor,fontWeight: FontWeight.bold,),
          (data?.length??0)==0?     ButtonWidget(onPressed: (){
              showAddReview(context:context);
              }, buttonName: 'Add Review', buttonColor: appColor,width: swidth/2.5,):Container()
            ],
          ),
          (data?.length??0)>0?    ListView.builder(
                itemCount: data?.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
         itemBuilder: (context, index) {
           
         var fData=data?[index];
                return Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(fData?.image??''),
                          ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Container(
                              width:swidth/2,
                              child: TextViewLarge(title: fData?.name,fontWeight: FontWeight.w700,textcolor: blackColor,)),
                            Row(children: [
                              StarWidget(value:double.parse(fData?.rating??'1') ),
                              TextViewMedium(name:fData?.rating),
                            ],),
                            TextViewSmall(title: fData?.dateTime,textcolor: blackColor,)
                           ],),
                         ) 
                        ],
                      ),
                      TextViewSmall(title: fData?.feedback,textcolor: blackColor,),
                      vericalSpaceSmall,
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
ButtonWidget(
  width:ApiConstant.langCode!='ta'? swidth/4:swidth/3,
  onPressed: (){
   showAddReview(context:context,reviewId: fData?.id,isTicket: false,star:fData?.rating!=null?double.parse(fData?.rating??'1'):0.0,reviewContent: fData?.feedback);
}, buttonName: 'Edit', buttonColor: appColor),

                      ],),
                    
                    ],),
                  ),
           );}
              ):NoDataWidget(title: 'No Reviews!'),
              vericalSpaceMedium,
                TicketWidget(tickets: state.model.data?.tickets,)
            ],),
       )
       
     );}
        else
return CircularWidgetC();
        }
      ),
    );
  }
}
 void showAddReview({required BuildContext context,String? reviewId,bool? isTicket,double? star,String? reviewContent}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: ReviewWidget(reviewId: reviewId,isTicket: isTicket,star: star,reviewContent: reviewContent,),
      );});}