import 'package:auto_route/annotations.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kasnew/cubits/invite_cubit.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/states/invite_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';

import 'package:kasnew/widgets/title_app_bar_widget.dart';
import 'package:kasnew/widgets/toast_widget.dart';
import 'package:flutter_share/flutter_share.dart';
@RoutePage()
class InviteScreen extends HookWidget {
  const InviteScreen({super.key});


  @override
  Widget build(BuildContext context) {
    var apiCall = useState(true);
    var dynamicLink = useState<String>('');

    
   
    

    Future<void> _refresh() async {
      context.read<InviteCubit>().login(HomeRequestModel(userId: ApiConstant.userId,lang: ApiConstant.langCode));
    }

    // Future<void> _generateDynamicLink(String key) async {
    //   print('key-------------------${key}');
    //   if (key != null) {
    //     dynamicLink.value = await createDynamicLink(
    //       key,
    //       "RKS DigiGold",
    //       loginModel?.data?.referralSettings?.invite_content ?? '',
    //       settingsModel?.data?.first.inviteLinkImage ?? "",
    //     );

    //     final referLinkRequestModel = ReferLinkRequestModel(
    //       userId: "",
    //       url: dynamicLink.value,
    //     );

    //     await context.read(referLinkStateProvider.notifier).referLinkApiCall(referLinkRequestModel);
    //     referLinkModel = context.read(referLinkStateProvider).referLinkModel;
    //   }
    // }

    Future<void> _copyReferralLink(String? referCode,String? copied) async {
      // if (dynamicLink.value.isNotEmpty) {
       
        Clipboard.setData(ClipboardData(text: referCode??'')).then((_) {
         ToastWidget(message: copied,color: Colors.green,).build(context);
        });
      // } 
      // else {
      //   ToastWidget(message: 'Referral link is not generated yet.').build(context);
      // }
    }

    Future<void> _shareReferralLink(String? referCode,String? content) async {
     
      try {
        // if (dynamicLink.value != null) {
        //   // final referLinkRequestModel = ReferLinkRequestModel(
        //   //   userId: "",
        //   //   url: dynamicLink.value,
        //   // );

        //   // await context.read(referLinkStateProvider.notifier).referLinkApiCall(referLinkRequestModel);
        //   // referLinkModel = context.read(referLinkStateProvider).referLinkModel;
          await FlutterShare.share(
         title: 'KAS DigiGold',
          text:"${'KAS DigiGold'}\n\n$content" ,
          linkUrl: referCode
          );
          print('text');
        //  
        // }

      } catch (e) {
       
        ToastWidget(message: 'Error generating referral link: $e',);
      }
    }

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _refresh();
      });
      return;
    }, []);

    return BlocConsumer<InviteCubit, InviteState>(
            listener: (context, state) {
           
      if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text=='Success') {
       
      }
      else if(state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text!='Success'){
    
      }
    },
     builder: (context, state) {
     if(  state.networkStatusEnum==NetworkStatusEnum.loading){
      return CircularWidgetS();
    }
    if( state.networkStatusEnum==NetworkStatusEnum.loaded){
      var langData=state.model.data?.langData;
      var data=state.model.data;
      var referData=state.model.data;
     return Scaffold(
      appBar: TitleAppBarWidget(title: state.model.data?.langData?.inviteYourFriends),
      body: SingleChildScrollView(
    child:Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5.sp, left: 5.sp, right: 5.sp),
                  padding: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextViewLarge(
                        title: langData?.inviteYourFriends,
                        fontWeight: FontWeight.bold,
                        textcolor: appColor,
                      ),
                      vericalSpaceSmall,
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: langData?.referralContent ?? "",
                              style: TextStyle(
                                color: blackColor,
                                fontSize: 14,
                                height: 1.5,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    vericalSpaceSmall,
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "${langData?.copyInvite} : ",
                                  style: TextStyle(
                                    color:blackColor,
                                    fontSize: 14,
                                    height: 1.5,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                TextSpan(
                                  text: data?.referralKey ?? "",
                                  style:  TextStyle(
                                    color: blackColor,
                                    fontSize: 14,
                                    height: 1.5,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          horizontalSpaceSmall,
                         
                          IconButton(onPressed: () async {
    //  await _generateDynamicLink(loginModel?.data?.referralSettings?.referralKey ?? "");
                              await _copyReferralLink(data?.referralKey,langData?.referralLinkCopied);  
                          }, icon: Icon(Icons.copy_outlined,size: 30,))
                        ],
                      ),
                     vericalSpaceSmall,
                     
                      ButtonWidget(onPressed: () async {
      // await _generateDynamicLink(loginModel?.data?.referralSettings?.referralKey ?? "");
                          await _shareReferralLink(data?.referralKey,langData?.referralContent);
                      }, buttonName:langData?.inviteYourFriends??'', buttonColor:appColor)
                    ],
                  ),
                ),
                
            
              ],
            ),
      ),
    );
      
      }
      else{
    return Container();
      }
    }
      );}}