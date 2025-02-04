import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kasnew/cubits/contact_person_cubit.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/screens/sidebar/contact_us_screen.dart';
import 'package:kasnew/states/contact_person_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/text_view_small.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';
import 'package:url_launcher/url_launcher.dart';
@RoutePage()
class ContactPersonScreen extends StatefulWidget {
  const ContactPersonScreen({super.key});

  @override
  State<ContactPersonScreen> createState() => _ContactPersonScreenState();
}

class _ContactPersonScreenState extends State<ContactPersonScreen> {
  @override
  
  @override
  void initState() {
    super.initState();
    context.read<ContactPersonCubit>().login(HomeRequestModel(userId: ApiConstant.userId,
    lang: ApiConstant.langCode));
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TitleAppBarWidget(title:"Contact Persons"),
      body: SingleChildScrollView(
 child:   BlocConsumer<ContactPersonCubit, ContactPersonState>(
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
       Padding(padding: EdgeInsets.all(screenPadding),
       child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       ListView.builder(
        itemCount: data?.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
        var cData=data?[index];
        return Card(
          child: ExpansionTile(title: Row(children: [
            CircleAvatar(backgroundImage: NetworkImage(cData?.image??'',),radius: 30.r,),
            horizontalSpaceSmall,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               TextViewMedium(name:cData?.name,fontWeight: FontWeight.w700, ),
               Padding(
                 padding: const EdgeInsets.all(5),
                 child: TextViewSmall(title: cData?.designation,textcolor: appColor,),
               ) ,
               Row(
                 children: [
                   RoundIconWidget(iconData: Icons.phone,boxSize: 20,iconSize: 15,),
                   horizontalSpaceSmall,
TextViewSmall(title:'+91 ${ cData?.mobileNumber}',textcolor: greyColor,) ,
                 ],
               ),
               vericalSpaceSmall,
               Row(
                 children: [
                   RoundIconWidget(iconData: Icons.email,boxSize: 20,iconSize: 15,),
                   horizontalSpaceSmall,
                   TextViewSmall(title: cData?.email,textcolor: greyColor,) ,
                 ],
               ),
              ],
            )
          ],
          ),
          
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
ContactPersonWidget(onTap: () {
 _makingPhoneCall(cData?.mobileNumber);  
},
title: 'Call',
iconData: Icons.call,),

ContactPersonWidget(onTap: () {
  launchSmsApp(cData?.mobileNumber); 

},
title: 'Sms',
iconData: Icons.sms,),

ContactPersonWidget(onTap: () {
 launchEmail(cData?.email??'') ; 
},
title: 'Email',
iconData: Icons.email,),
ContactPersonWidget(onTap: () {
openWhatsApp(cData?.whatsappNumber); 
},
title: 'Whatsapp',
iconData: Icons.call,),

            ],)
          ],),
        );
       })
       ]));
}
else
return CircularWidgetC();
})));} 

}

class ContactPersonWidget extends StatelessWidget {
  VoidCallback? onTap;
  IconData? iconData;
  String? title;
   ContactPersonWidget({required this.onTap,required this.iconData,required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.all(screenPadding),
        child: Column(
         
          children: [
            RoundIconWidget(iconData: iconData,backColor: Color.fromARGB(255, 229, 224, 224),iconcolor:title=='Whatsapp'?Colors.green: appColor,),
            TextViewSmall(title: title,textcolor: blackColor,fontSizes: 10,fontWeight: FontWeight.w700,)
          ],
        ),
      ),
    );
  }
}
      void _makingPhoneCall(String? number) async {
  // Retrieve and sanitize the phone number
  String? rawPhoneNumber = number?.replaceAll(RegExp(r'\s+'), '');
  
  if (rawPhoneNumber == null || rawPhoneNumber.isEmpty) {
   
    return;
  }

  // Construct the `tel` URI
  var url = Uri.parse("tel:$rawPhoneNumber");


  // Launch the phone dialer
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
   
    throw 'Could not launch $url';
  }
}
void openWhatsApp(String? phoneNumber, ) async {
  // Construct the message with product details
  String message =
   "Hello, I want more details \n\n"
                   
                   "Thank you!";

  // Encode the message to be URL-friendly
  String encodedMessage = Uri.encodeComponent(message);

  // Create the WhatsApp URL with the pre-filled message
  final whatsappUrl = "https://wa.me/$phoneNumber?text=$encodedMessage";
  
 
  
  // Check if WhatsApp can be launched and launch the URL
  if (await canLaunch(whatsappUrl)) {
    await launch(whatsappUrl);
  } else {
    throw 'Could not launch WhatsApp';
  }
}
void launchEmail(String emailAddress) async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: emailAddress,
    query: encodeQueryParameters(<String, String>{
      'subject': 'Customer Inquiry', // Optional: customize the subject
      'body': 'Hello, I have a question regarding...', // Optional: customize the body
    }),
  );

  if (await canLaunchUrl(emailUri)) {
    await launchUrl(emailUri);
  } else {
    throw 'Could not launch $emailUri';
  }
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
Future<void> launchSmsApp(String? phoneNumber, {String? message}) async {
  final Uri smsUri = Uri(
    scheme: 'sms',
    path: phoneNumber,
    queryParameters: message != null ? {'body': message} : null,
  );

  if (await canLaunchUrl(smsUri)) {
    await launchUrl(smsUri);
  } else {
    throw 'Could not open SMS app';
  }
}