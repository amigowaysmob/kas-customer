import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kasnew/cubits/view_profile_cubit.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/response_model/view_profile_model.dart';
import 'package:kasnew/router/app_router.gr.dart';

import 'package:kasnew/states/view_profile_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/sharedpreference_help.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/no_userId_function.dart';
import 'package:kasnew/widgets/no_user_id_screen.dart';
import 'package:kasnew/widgets/proof_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/text_view_small.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';

@RoutePage()
class AccountScreen extends StatefulWidget {
  bool? isMenu;
 AccountScreen({this.isMenu});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late SharedPreferenceHelper sharedPreferenceHelper;
  UserData? userData = UserData();
 LangData? langData=LangData();
  bool _isFirstLoad = true;

  @override
  void initState() {
    super.initState();
    sharedPreferenceHelper = SharedPreferenceHelper();
    sharedPreferenceHelper.init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isFirstLoad) {
      _loadProfile();
      _isFirstLoad = false;
    }
  }

  @override
  void didUpdateWidget(covariant AccountScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _loadProfile();
  }

  void _loadProfile() {
    final userId = sharedPreferenceHelper.getUserId;
    final langCode = sharedPreferenceHelper.getLanguageCode;
    if (userId != null && langCode != null) {
      context.read<ViewProfileCubit>().login(HomeRequestModel(userId: userId, lang: langCode));
    }
  }

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return BlocConsumer<ViewProfileCubit, ViewProfileState>(
      listener: (context, state) {
        if (state.networkStatusEnum == NetworkStatusEnum.loaded &&
            state.model.text == 'Success') {
          userData = state.model.data?.userData;
          langData = state.model.data?.langData;
          print(userData);
        } else if (state.networkStatusEnum == NetworkStatusEnum.loaded &&
            state.model.text != 'Success') {
          // Handle failure
        }
      },
      builder: (context, state) {
         if(  state.networkStatusEnum==NetworkStatusEnum.loading){
      return CircularWidgetS();
    }
    if( state.networkStatusEnum==NetworkStatusEnum.loaded){
    
    

        return  Scaffold(
          backgroundColor: Color.fromARGB(255, 242, 237, 237),
          appBar:widget.isMenu==true? TitleAppBarWidget(title: 'My Profile',):null,
          body: Helper.isUser()==true? SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(screenPadding),
              child: SizedBox(
                // height: sheight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //   height: sheight / 8,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(5),
                    //       border: Border.all(color: greyColor),
                    //       color: whiteColor),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Row(
                    //       children: [
                    //         LogoWidget(),
                    //         horizontalSpaceLarge,
                    //         Column(
                    //           children: [
                    //             TextViewMedium(
                    //               name: userData?.fullName,
                    //               fontWeight: FontWeight.bold,
                    //             ),
                    //             TextViewMedium(
                    //               name: userData?.phoneNumber,
                    //             ),
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    vericalSpaceSmall,
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: greyColor,width: 0.5),
                        borderRadius: BorderRadius.circular(20.r),
                        color: whiteColor
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all( screenPadding,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextViewLarge(
                                  title:langData?.personalDetails,
                                  textcolor: blackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                EditIconWidget(
                                  edit: langData?.edit,
                                  onTap: (){
                                     
context.router.push(BasicDetailEditScreen(userData: userData,));
                                })
                              ],
                            ),
                            vericalSpaceMedium,
                            TitleValueWidget(
                              title: langData?.fullName,
                              value: userData?.fullName,
                            ),
                             TitleValueWidget(
                              title: langData?.guardianName,
                              value: userData?.guardianName,
                            ),
                            TitleValueWidget(
                              title: langData?.mobileNumber,
                              value: userData?.phoneNumber,
                            ),
                            TitleValueWidget(
                              title: langData?.whatsappNumber,
                              value: userData?.whatsappNumber,
                            ),
                            TitleValueWidget(
                              title: langData?.birthday,
                              value: userData?.birthday,
                            ),
                            TitleValueWidget(
                              title: langData?.email,
                              value: userData?.email,
                            ),
                            TitleValueWidget(
                              title: langData?.address,
                              value: userData?.address,
                            ),
                          ],
                        ),
                      ),
                    ),
                    vericalSpaceSmall,
                   
                     Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: greyColor,width: 0.5),
                        borderRadius: BorderRadius.circular(20.r),
                        color: whiteColor
                      ),
                      child: Padding(
                        padding:  EdgeInsets.only(top: screenPadding,left: screenPadding,bottom: 5.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                   Container(
                                  width:swidth/2,
                                    child: TextViewLarge(
                                      title: langData?.idProof,
                                      textcolor: blackColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  EditIconWidget(
                                    edit: langData?.edit,
                                    onTap: (){
                              context.router.push(ProofEditScreen(userData:userData));
                                  })
                                ],
                              ),
                            ),

                            userData?.aadharCardFront!=null &&(userData?.aadharCardFront?.isNotEmpty??false)?
                            ProofWidget(front: userData?.aadharCardFront,back: userData?.aadharCardBack,title:langData?.aadharNumber):Container(),
                          userData?.panCardFront!=null &&(userData?.panCardFront?.isNotEmpty??false)?
                            ProofWidget(front: userData?.panCardFront,back: userData?.panCardBack,title:'PAN'):Container(),   
                            ])
                            ),
                            ),
                    vericalSpaceSmall,
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: greyColor,width: 0.5),
                        borderRadius: BorderRadius.circular(20.r),
                        color: whiteColor
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(screenPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextViewLarge(
                                  title:langData?.nomineeDetails,
                                  textcolor: blackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                EditIconWidget(
                                   edit: langData?.edit,
                                  onTap: (){
context.router.push(NomineeBasicEditScreen(userData: userData));
                                })
                              ],
                            ),
                            vericalSpaceMedium,
                            TitleValueWidget(
                              title: langData?.nomineeName,
                              value: userData?.nomineeName,
                            ),
                            
                            TitleValueWidget(
                              title: langData?.nomineeMobileNumber,
                              value: userData?.nomineeMobileNumber,
                            ),
                           
                            
                            TitleValueWidget(
                              title: langData?.nomineeGender,
                              value: userData?.nomineeGender,
                            ),
                            TitleValueWidget(
                              title: langData?.nomineeAddress,
                              value: userData?.nomineeAddress,
                            ),
                              TitleValueWidget(
                              title: langData?.nomineeBankName,
                              value: userData?.nomineeBankName,
                            ),
                              TitleValueWidget(
                              title: langData?.nomineeBankIfscCode,
                              value: userData?.nomineeBankIfscCode,
                            ),
                              TitleValueWidget(
                              title: langData?.nomineeBankAccountNumber,
                              value: userData?.nomineeBankAccountNumber,
                            ),
                              TitleValueWidget(
                              title: langData?.nomineeBankUpiId,
                              value: userData?.nomineeBankUpiId,
                            ),
                          ],
                        ),
                      ),
                    ),
                    vericalSpaceSmall,
                   
                     Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: greyColor,width: 0.5),
                        borderRadius: BorderRadius.circular(20.r),
                        color: whiteColor
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(screenPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:swidth/2,
                                  child: TextViewLarge(
                                    title: langData?.nomineeIdProof,
                                    textcolor: blackColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                EditIconWidget(
                                  edit: langData?.edit,
                                  onTap: (){
context.router.push(NomineeProofEditScreen(userData: userData,),
);
                                })
                              ],
                            ),
                            
                            userData?.nomineeAadharCardFront!=null &&(userData?.nomineeAadharCardFront?.isNotEmpty??false)?
                            ProofWidget(front: userData?.nomineeAadharCardFront,back: userData?.nomineeAadharCardBack,title:'Nominee Aadhar'):Container(),
                          userData?.nomineePanCardFront!=null &&(userData?.nomineePanCardFront?.isNotEmpty??false)?
                            ProofWidget(front: userData?.nomineePanCardFront,back: userData?.nomineePanCardBack,title:'Nominee PAN'):Container(),
                            ]),
                            )),
                   
                    
                  ],
                ),
              ),
            ),
          ):NoUseridScreen(content: 'Login to access your account.',),
        );
      }
      else{
        return CircularWidgetS();
      }
      }

    );
  }

  String _addCommaIfNotEmpty(String? value, bool? isLast) {
    return value != null && value.isNotEmpty
        ? (isLast ?? true)
            ? "$value,"
            : "$value"
        : "";
  }
}

class TitleValueWidget extends StatelessWidget {
  final String? title;
  final String? value;
  const TitleValueWidget({this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextViewSmall(title: title, textcolor: greyColor),
        TextViewSmall(title: value, textcolor: blackColor,fontWeight: FontWeight.bold,),
        vericalSpaceMedium,
      ],
    );
  }
}

class EditIconWidget extends StatelessWidget {
  VoidCallback? onTap;
  String? edit;
   EditIconWidget({required this.onTap,this.edit});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(Icons.edit),
          TextViewSmall(title: edit??'Edit')
        ],
      ),
    );
  }
}
