import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:kasnew/cubits/feed_back_cubit.dart';
import 'package:kasnew/cubits/feed_sub_cat_cubit.dart';
import 'package:kasnew/cubits/get_feedback_cubit.dart';
import 'package:kasnew/cubits/submit_ticket_cubit.dart';
import 'package:kasnew/request_model/feed_sub_cat_request_model.dart';
import 'package:kasnew/request_model/feedback_request_model.dart';
import 'package:kasnew/request_model/submit_ticket_request_model.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/states/feed_back_state.dart';
import 'package:kasnew/states/feed_sub_cat_state.dart';
import 'package:kasnew/states/submit_ticket_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/drop_down_widget.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/text_view_small.dart';
import 'package:kasnew/widgets/toast_widget.dart';

import '../request_model/home_request_model.dart';
@RoutePage()
class ReviewWidget extends HookWidget {
  String? reviewContent;
 double? star;
 String? reviewId;
 bool? isTicket;
  ReviewWidget({this.reviewContent,this.star,this.reviewId,this.isTicket});

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    final lang = ApiConstant.language; // Language configuration
    final d = lang?.data;
    var revTypeKey=useState<List<String>>([]);
       var revTypevalue=useState<List<String>>([]);
        var revSubKey=useState<List<String>>([]);
       var revSubvalue=useState<List<String>>([]);

var site=ApiConstant.siteModel;
var ratingError=useState<String?>(null);
 var reviewController = useTextEditingController();
    var ratingValue = useState<double>(0.0);
    var reviewSubError=useState<String?>(null);
    var reviewTypeError=useState<String?>(null);
 useEffect(() {
      // Trigger the API call when the widget is first built
  //   for (var option in site?.data?[0].reviewTypes??[]) {
  //   revTypeKey.value.add(option.key??'');
  //   revTypevalue.value.add(option.value??'');
  // }
   for (var option in site?.data?[0].reviewSubject??[]) {
    revSubKey.value.add(option.key??'');
    revSubvalue.value.add(option.value??'');
  }
  reviewController.text=reviewContent??'';
  ratingValue.value=star??0.0;
  context.read<FeedSubCatCubit>().clear();
      return null; // No cleanup needed
    }, []);
 
  print('review typekey------------${revTypeKey.value}');
 print('review subkey------------${revSubKey.value}');
    // State controllers
  
    final formKey = useMemoized(() => GlobalKey<FormState>());
var reviewType=useState<String?>(null);
var reviewFor=useState<String?>(null);
var reviewTypeKey=useState<String?>(null);
var reviewForKey=useState<String?>(null);
    // Review validation
    String? _validateReview(String? value) {
      if (value == null || value.trim().isEmpty) {
        return 'Please enter your review';
      }
      return null;
    }

    return   MultiBlocListener(
                listeners: [
                  BlocListener<SubmitTicketCubit,SubmitTicketState>(
                    listener: (context,state){
                     if(state.networkStatusEnum==NetworkStatusEnum.loaded && state.model.text=='Success'){
                    Navigator.pop(context);
                       context.read<GetFeedBackCubit>().login(HomeRequestModel(userId: ApiConstant.userId,lang: ApiConstant.langCode));
                      ToastWidget(message: state.model.message,color: Colors.green,).build(context);
                     } 
                     else   if(state.networkStatusEnum==NetworkStatusEnum.loaded && state.model.text!='Success'){
                      ToastWidget(message: state.model.message,).build(context);
                     }   
                    },),
                     BlocListener<FeedBackCubit,FeedBackState>(
                    listener: (context,state){
                    if(state.networkStatusEnum==NetworkStatusEnum.loaded && state.model.text=='Success'){
                    Navigator.pop(context);
                       context.read<GetFeedBackCubit>().login(HomeRequestModel(userId: ApiConstant.userId,lang: ApiConstant.langCode));
                      ToastWidget(message: state.model.message,color: Colors.green,).build(context);
                     } 
                     else   if(state.networkStatusEnum==NetworkStatusEnum.loaded && state.model.text!='Success'){
                      ToastWidget(message: state.model.message,).build(context);
                     }   
                    },),],
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize:MainAxisSize.min,
              // isTicket!=true? MainAxisSize.min:MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                TextViewLarge(
                  title: isTicket!=true?reviewId!=null?'Edit Ratings':'Add Ratings':'Add Ticket',
                  textcolor: blackColor,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 16),
                  
                // Rating Stars Widget
                     isTicket!=true?     Column(
                  children: [
                    RatingStars(
                      axis: Axis.horizontal,
                      value: ratingValue.value,
                      onValueChanged: (v) { ratingValue.value = v;
                    ratingError.value=null;
                      },
                      starCount: 5,
                      starSize: 24,
                      valueLabelColor: const Color(0xff9b9b9b),
                      valueLabelTextStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                      ),
                      starSpacing: 4,
                      maxValue: 5,
                      maxValueVisibility: true,
                      valueLabelVisibility: false,
                      animationDuration: const Duration(milliseconds: 500),
                      starOffColor: const Color.fromARGB(255, 202, 208, 218),
                      starColor: sandleColor,
                    ),
                       ratingError.value!=null?TextViewSmall(title: ratingError.value,textcolor: Colors.red,):Container(),                                                                                                                                                                                                                                                                                                                                                                                                                                                
                      vericalSpaceLarge,
                  ],
                ):Container(),
                
                
              isTicket==true?    Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextViewSmall(title: d?.reviewSubject??'Choose Review Subject',fontWeight: FontWeight.bold,),
                     vericalSpaceMedium,
                     DropDownWidget1(
                      width: swidth,
                       size: reviewFor.value,
                      hint: d?.reviewSubject??'Choose Review Subject', items:revSubvalue.value , onChanged: (p0){
                    reviewFor.value=p0;
                    reviewSubError.value=null;
                    var index=revSubvalue.value.indexOf(p0??'');
                    reviewForKey.value=revSubKey.value[index];
                    context.read<FeedSubCatCubit>().login(FeedSubCatRequestModel(userId: ApiConstant.userId,categoryId: reviewForKey.value,
                    lang:ApiConstant.langCode));
                    }),
                      reviewSubError.value!=null?TextViewSmall(title: reviewSubError.value,textcolor: Colors.red,):Container(),         
                  vericalSpaceMedium,
                    BlocConsumer<FeedSubCatCubit,FeedSubCatState>(
                      listener:(context,feeState){
                        if(feeState.networkStatusEnum==NetworkStatusEnum.loaded){
                           // Trigger the API call when the widget is first built
                  for (var option in feeState.model.data??[]) {
                  revTypeKey.value.add(option.key??'');
                  revTypevalue.value.add(option.value??'');
                    }  
                        }
                      },
                      builder:(context,feeState){
                       if(feeState.networkStatusEnum==NetworkStatusEnum.loading){
                        return Container();
                       }
                       else if(feeState.networkStatusEnum==NetworkStatusEnum.loaded && revTypevalue.value.length>0)
                  {
                    return   
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  
                    TextViewSmall(title: d?.reviewType??'Choose Review Type',fontWeight: FontWeight.bold,),
               vericalSpaceMedium,
                DropDownWidget1(
                  width: swidth,
                  size: reviewType.value,
                  hint:  d?.reviewType??'Choose Review Type', items: revTypevalue.value, onChanged: (p0){
                reviewType.value=p0;
                var index=revTypevalue.value.indexOf(p0??'');
                
                reviewTypeKey.value=revTypeKey.value[index];
                reviewTypeError.value=null;
                print('review type key-------------${reviewTypeKey.value}');
                }),
                reviewTypeError.value!=null?TextViewSmall(title: reviewTypeError.value,textcolor: Colors.red,):Container(),
                vericalSpaceMedium 
                  ],
                    );
                    
                
                  }
                  else{
                    return Container();
                  }
                       
                      }
                    )
                  ],
                ):Container(),
                // Review Input Field
                TextFormField(
                  controller: reviewController,
                  // validator: _validateReview,
                  decoration: InputDecoration(
                    labelText: 'Write your review*',
                    hintText: 'Write your review',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: appColor, width: 2.0),
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines:5,
                ),
              // vericalSpaceLarge,
              //   TextViewSmall(title: d?.reviewType??'Choose Review Type',fontWeight: FontWeight.bold,),
              //   vericalSpaceMedium,
              //   DropDownWidget1(
              //     width: swidth,
              //     size: reviewType.value,
              //     hint:  d?.reviewType??'Choose Review Type', items: revTypevalue.value, onChanged: (p0){
              //   reviewType.value=p0;
              //   var index=revTypevalue.value.indexOf(p0??'');
                
              //   reviewTypeKey.value=revTypeKey.value[index];
              //   print('review type key-------------${reviewTypeKey.value}');
              //   }),
              
                // Buttons
                vericalSpaceMedium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Cancel Button
                    ButtonWidget(
                      onPressed: () => context.router.pop(),
                      buttonName: 'Cancel',
                      buttonColor: whiteColor,
                      width: 100,
                    ),
                    const SizedBox(width: 24),
                  
                    // Send Review Button
                    ButtonWidget(
                      onPressed: () async {
                        if(isTicket!=true){
                        if (formKey.currentState!.validate() &&
                            ratingValue.value != 0.0) {
                          // Call feedback submission API
                          context.read<FeedBackCubit>().login(
                                FeedBackRequestModel(
                                  userId: ApiConstant.userId,
                                  feedback: reviewController.text,
                                  rating: ratingValue.value.toString(),
                                  lang: ApiConstant.langCode,
                                  ratingTerm: reviewTypeKey.value,
                                  ratingIssueType: reviewForKey.value,reviewId: reviewId
                                ),
                              );
                  
                          // await context.router.pop();
                        } else if (ratingValue.value == 0.0) {
                          // ToastWidget(
                          //   message: 'Please give your ratings',
                          // ).build(context);
                          ratingError.value='Please give your ratings';
                        }
                      }
                      else{
                  if(reviewFor.value==null){
                    reviewSubError.value='Please Select the Review Subject';
                  }else if(revTypevalue.value.length>0 && reviewType.value==null){
                    reviewTypeError.value='Please Select the Review Type';
                  }
                  else{
                   context.read<SubmitTicketCubit>() .login(SubmitTicketRequestModel(
                    userId: ApiConstant.userId,
                    lang: ApiConstant.langCode,
                    description: reviewController.text,
                    ticketType:reviewForKey.value,
                    issueType: reviewTypeKey.value,
                   ));
                  }
                      }
                      }
                      ,
                      buttonName: 'Send Review',
                      buttonColor: appColor,
                      width: 100,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}