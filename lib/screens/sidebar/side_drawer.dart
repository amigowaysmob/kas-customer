import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kasnew/cubits/update_profile_photo_cubit.dart';
import 'package:kasnew/cubits/view_profile_cubit.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/request_model/update_profile_photo_request_model.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/response_model/view_profile_model.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/router/router_path.dart';
import 'package:kasnew/states/update_profile_photo_state.dart';
import 'package:kasnew/states/view_profile_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/constants/sharedpreference_help.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/no_userId_function.dart';
import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerSection extends HookWidget {
  const DrawerSection({super.key});

  @override
  Widget build(BuildContext context) {
     LangModel? lang=ApiConstant.language;
  
    var d=lang?.data;
    final picker = useMemoized(() => ImagePicker());
    final imagePath = useState<File?>(null);
    final isBottomSheetVisible = useState(false);
var isLoading=useState(false);
    // Initialize SharedPreferencesHelper
    final sharedPreferenceHelper = useMemoized(() => SharedPreferenceHelper());
    useEffect(() {
      sharedPreferenceHelper.init();
      context.read<ViewProfileCubit>().login(HomeRequestModel(
            userId: ApiConstant.userId,
            lang: ApiConstant.langCode,
          ));
      return null;
    }, []);
 UserData? userData=UserData();
  Future<void> getImage(
        ImageSource source) async {
      final image = await picker.pickImage(source: source);
      if (image != null) {
        imagePath.value = File(image.path);
        context.read<UpdateProfilePhotoCubit>().login(UpdateProfilePhotoRequestModel(userId: ApiConstant.userId,photo: imagePath.value));
        
         
      }
     
    }
     Future<void> showImagePickerOptions(
        BuildContext context) async {
      isBottomSheetVisible.value = !isBottomSheetVisible.value;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Uncomment if you want to add camera option
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  getImage(ImageSource.camera,);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  getImage(ImageSource.gallery,);
                },
              ),
            ],
          );
        },
      );
      //  else {
      //   Navigator.pop(context); // Close the bottom sheet if it's already open
      // }
    }
  double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return MultiBlocListener(
      listeners: [
        BlocListener<ViewProfileCubit, ViewProfileState>(
                listener: (context, state) {
                 
                 if(state.networkStatusEnum==NetworkStatusEnum.loaded){
                  userData=state.model.data?.userData;
                
         sharedPreferenceHelper.savePhoto(state.model.data?.userData?.photo);
                 }
        },
        ),
        BlocListener<UpdateProfilePhotoCubit, UpdateProfilePhotoState>(
                listener: (context, state) {
                 if(state.networkStatusEnum==NetworkStatusEnum.loading){
                  isLoading.value=true;
                 }
              else   if(state.networkStatusEnum==NetworkStatusEnum.loaded){
                  isLoading.value=false;
                context.read<ViewProfileCubit>().login(HomeRequestModel(
            userId: ApiConstant.userId,
            lang: ApiConstant.langCode,
          ));
         
                 }
        },
        ),
        ],
        child: BlocBuilder<ViewProfileCubit, ViewProfileState>(
         builder: (context, state) { 
          
          return 
            Drawer(
              shape: Border(
                  // bottom: BorderSide(color:blackColor),
                  // left: BorderSide(color:blackColor),
                  // top: BorderSide(color: blackColor, width: 5),
                  right: BorderSide(color:blackColor)),
              backgroundColor: whiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                Container(
                     height: sheight/7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft:Radius.circular(50),bottomRight: Radius.circular(50))
                    ),
                    child: DrawerHeader(
                     
                      child:Row(
                    
                        children: [
                         InkWell(
                          onTap: () {
                         Helper.isUser()?     showImagePickerOptions(context):{context.router.pop(),
                     
                     context.router.push(LoginScreen())};
                          },
                          child:state.networkStatusEnum==NetworkStatusEnum.loading || isLoading.value==true?CircularWidgetC(): 
                        state.model.data?.userData?.photo!=null?  CircleAvatar(backgroundImage:NetworkImage(state.model.data?.userData?.photo??ApiConstant.logoUrl),radius: 40,):
                        CircleAvatar(child:SvgPicture.asset(
          'assets/images/user_profile.svg', // Path to your SVG file
         
          semanticsLabel: 'Example SVG',
        ),radius: 40,)),
                        
                          horizontalSpaceMedium,
                     Helper.isUser()?      Column(
                            //  mainAxisAlignment: MainAxisAlignment.,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
        
                             Container(
                              width: swidth/2.5,
                              child: TextViewMedium(name: '${state.model.data?.userData?.fullName??''}',textColors: blackColor,fontWeight: FontWeight.bold,)),
                           
                             vericalSpaceSmall,
                             TextViewMedium(name:userData?.phoneNumber??'',textColors: appColor,),
                             Row(
                               children: [
                                TextViewMedium(name: 'ID : ',textColors: greyColor,),
                                 TextViewMedium(name:userData?.customerId??'',textColors: blackColor,),
                               ],
                             )
                           ],):InkWell(
                            onTap: (){
                               context.router.pop();
                     
                     context.router.push(LoginScreen());
                            },
                            child: Center(child: Row(
                              children: [
                                horizontalSpaceLarge,
                                TextViewMedium(name:'Login / SignUp',fontWeight:FontWeight.bold),
                              ],
                            )))
                        ],
                      )
                    ),
                  ),
                
                  Expanded(
                    
                  child: ListView(
                    padding: const EdgeInsets.all(0),
                    children: [
                        Helper.isUser()?GreyTextWidget(title:'${d?.myAccount??"My Profile"}',):Container(),
             Helper.isUser()?        ItemWidget(iconData:Icons.person ,title: '${d?.myAccount??"My Profile"}',onTap: (){
                      context.router.pop();
                      print('clicked');
                     context.router.push(AccountScreen(isMenu: true));
                     },):Container(),
                    
             Helper.isUser()?   ItemWidget(iconData: Icons.currency_rupee_sharp,title: '${d?.myPlans??"My Plans"}',onTap: (){
                   context.router.pop();
                context.router.pushNamed(RouterPath.my_plan_list_path);
                },):Container(),
            Helper.isUser()?    ItemWidget(iconData:Icons.payment_outlined ,title: '${d?.myTransactions??"My Transactions"}',onTap: (){
                   context.router.pop();
                    context.router.push(TransScreen(isMenu: true));
                },):Container(),
                // ItemWidget(iconData:FontAwesomeIcons.book ,title: sidebar?.myReports,onTap: (){
                //    context.router.pop();
                //    context.router.pushNamed(RouterPath.reports_path);
                // },),
            Helper.isUser()?     ItemWidget(iconData:Icons.card_giftcard_outlined ,title: '${d?.myGifts??"My Gifts"}',onTap: (){
                   context.router.pop();
                     context.router.push(GiftListScreen());
                },):Container(),
                Helper.isUser()?     ItemWidget(iconData:Icons.book_online ,title: '${d?.myEPassbook??"My E-Passbook"}',onTap: (){
                   context.router.pop();
                   context.router.pushNamed(RouterPath.paasbook_path);
                },):Container(), 
              Helper.isUser()?  ItemWidget(iconData:Icons.handshake_outlined ,title: '${d?.inviteFriends??"Invite Friends"}',onTap: (){
                   context.router.pop();
              context.router.pushNamed(RouterPath.invite_path);
                },):Container(),
                Helper.isUser()?   ItemWidget(iconData:Icons.person,title:'${d?.contactPersons??"My contact persons"}',onTap: (){
                   context.router.pop();
              context.router.pushNamed(RouterPath.contact_person_path);
                },):Container(),
                 Helper.isUser()?  ItemWidget(iconData:Icons.currency_rupee_sharp,title:'${d?.payForOthers??"Pay for others"}',onTap: (){
                   context.router.pop();
              context.router.pushNamed(RouterPath.pay_others_path);
                },):Container(),
                  Helper.isUser()?  ItemWidget(iconData:Icons.pages,title:'${d?.eCatalogue??"E-Catalogue"}',onTap: (){
                   context.router.pop();
              context.router.pushNamed(RouterPath.product_list_path);
                },):Container(),
                GreyTextWidget(title: 'KAS Jewellery',),
                ItemWidget(iconData:Icons.list_outlined ,title: '${d?.ourPlansDetails??"Our Plans Details"}',onTap: (){
                   context.router.pop();
               context.router.pushNamed(RouterPath.plan_types_path);
                },),
                ItemWidget(iconData:Icons.photo_outlined,title: '${d?.ourGallery??"Our Gallery"}',onTap: (){
                   context.router.pop();
              context.router.pushNamed(RouterPath.gallery_path);
              
                },),
                 ItemWidget(iconData:Icons.photo_outlined,title: '${'Feedback'}',onTap: (){
                   context.router.pop();
              context.router.pushNamed(RouterPath.feed_back_path);
              
                },),
                 
                 ItemWidget(iconData:Icons.youtube_searched_for ,title: '${d?.ourYoutubeChannel??"Our Youtube Channel"}',onTap: (){
                   context.router.pop();
              // context.router.pushNamed(RouterPath.utube_path);
               _launchURL('https://www.youtube.com/@kasjewellerytvn'); 
                },),
              ItemWidget(iconData:Icons.store_outlined ,title:'${d?.ourStores??"Our Stores"}',onTap: (){
                 context.router.pop();
                context.router.pushNamed(RouterPath.stores_path);
              },),
              //  ItemWidget(iconData:Icons.library_books_outlined ,title: sidebar?.training_book,onTap: (){
              //    context.router.pop();
              //   context.router.pushNamed(RouterPath.training_path);
              // },),
                ItemWidget(iconData:Icons.info_outline,title: '${d?.aboutUs??"About Us"}',onTap: (){
                   context.router.pop();
                  context.router.pushNamed(RouterPath.about_us_path);
                },),
            
            //  Helper.isUser()?      
                //  ItemWidget(iconData:Icons.card_giftcard_outlined ,title: "Gifts",onTap: (){},),
              //   ItemWidget(iconData:Icons.circle_outlined ,title: "Lucky Draw",onTap: (){
              //      context.router.pop();
              // context.router.pushNamed(RouterPath.lucky_path);
              //   },),
              //     ItemWidget(iconData:Icons.percent_rounded ,title: "Offers",onTap: (){},),
             
              
                
                ItemWidget(iconData:Icons.phone_outlined ,title: '${d?.contactUs??"Contact Us"}',onTap: (){
                   context.router.pop();
              context.router.pushNamed(RouterPath.contact_path);
                },),
                 
              ItemWidget(iconData:Icons.book_outlined ,title: '${d?.termsAndConditions??"Terms Conditions"}',onTap: (){
                 context.router.pop();
               context.router.pushNamed(RouterPath.terms_path); 
              },),
                ItemWidget(iconData:Icons.menu_book_outlined,title:'${d?.privacyPolicy??"Privacy Policy"}',onTap: (){
                   context.router.pop();
              context.router.pushNamed(RouterPath.privacy_path);
                },),
             
           Helper.isUser()? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              
        GreyTextWidget(title: '${d?.settings??'Settings'}',),
         ItemWidget(iconData:Icons.notifications_outlined ,title:'${d?.notifications??"Notifications"}',onTap: (){
                       context.router.pop();
                 
                  context.router.pushNamed(RouterPath.notification_path);
                    },),
              //    ItemWidget(iconData:Icons.edit ,title:"Edit Profile",onT
              //ap: (){
              //      context.router.pop();
                 
              // context.router.pushNamed(RouterPath.notification_path);
              //   },),
                     ItemWidget(iconData:Icons.password_outlined ,title: '${d?.changeMpin??"Change mpin"}',onTap: (){
                context.router.pop();
              context.router.pushNamed(RouterPath.change_mpin_path);  
                },),
              //     ItemWidget(iconData:Icons.password_outlined ,title: 'Lucky Draw',onTap: (){
              //   context.router.pop();
              // context.router.pushNamed(RouterPath.lucky_path);  
              //   },),
         ItemWidget(iconData:Icons.delete_outlined ,title: '${d?.dataDeletionRequest??"Data deletion request"}',onTap: (){
                    context.router.pop();
                  context.router.pushNamed(RouterPath.delete_path);  
                    },)
            ]
           ):Container()
              
              
              
              
              
                     
                  
                  ],
                  
                  )
                  
                ),
                 Helper.isUser()
                    ? Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Divider(color: Colors.grey.shade400),
                          ItemWidget(
                            iconData: Icons.logout_outlined,
                            title: '${d?.logout??"Logout"}',
                            onTap: () {
                              _showLogoutDialog(context);
                            },
                          ),
                        ],
                      )
                    : Container(), ])
                
                );
                }
                
                            ),
    
    );
        }//Drawe;
    }

Future<void> logout() async {
      final prefs = await SharedPreferences.getInstance();
      // Clear user data (e.g., user tokens, session data, etc.)
      //prefs.remove("profile");
      // prefs.remove(PrefKeys.user_id);
    
      prefs.clear();
    }

    void _showLogoutDialog(BuildContext context) {
       LangModel? lang=ApiConstant.language;
  
    var d=lang?.data;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(d?.logout??'Logout'),
        content: Text('Are you sure you want to log out?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              context.router.pop();// Dismiss the dialog
            },
            child: TextViewMedium(name:'Cancel',textColors: appColor,),
          ),
          TextButton(
            onPressed: ()async {
             // Dismiss the dialog
           await   logout(); 
            await  context.router.replaceAll([LoginScreen()]);// Call your logout function
            },
            child:TextViewMedium(name:'Log out',textColors: appColor,),
          ),
        ],
      );
    },
  );
}
 _launchURL(String url) async {
    final Uri urll = Uri.parse(url);
  if (await canLaunchUrl(urll)) {
    await launchUrl(urll);
  } else {
    throw 'Could not launch $urll';
  }
}
class ItemWidget extends StatelessWidget {
  IconData? iconData;
  String? title;
  VoidCallback? onTap;
  bool? isFicon;
  ItemWidget({this.iconData,this.title,this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap:onTap,
      child: Padding(
        padding:  EdgeInsets.all(5),
        child: Row(
          children: [
            horizontalSpaceSmall,
       Icon(iconData,),
          horizontalSpaceMedium,
           TextViewMedium(name: title,fontSize: 11,fontWeight: FontWeight.bold,),
           
          ]
        ),
      ),
    );
  }
  
}

Future<String?> getVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String currentVersion = packageInfo.version;
      return currentVersion;
}

class GreyTextWidget extends StatelessWidget {
  String? title;
 GreyTextWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextViewMedium(name: title,textColors: appColor,fontWeight: FontWeight.bold,),
    );
  }
}
