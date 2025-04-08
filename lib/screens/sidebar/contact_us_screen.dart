import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/cubits/contact_cubit.dart';
import 'package:kasnew/cubits/submit_enquiry_cubit.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/request_model/submit_enquiry_request_model.dart';
import 'package:kasnew/response_model/contact_model.dart';
import 'package:kasnew/states/contact_state.dart';
import 'package:kasnew/states/submit_enquiry_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/drop_down_widget.dart';
import 'package:kasnew/widgets/text_form_widget.dart';
import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/text_view_small.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';
import 'package:kasnew/widgets/toast_widget.dart';
import 'package:url_launcher/url_launcher.dart';
@RoutePage()
class ContactScreen extends StatefulWidget {
  bool? isLucky;
  ContactScreen({this.isLucky});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
 
  ContactData? contactData = ContactData();

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  final GlobalKey<FormState> contacctKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<ContactCubit>().login(
        HomeRequestModel(userId: ApiConstant.userId, lang: ApiConstant.langCode));
        if(widget.isLucky==true){
           subjectController.text='Lucky Draw';
        }
        
  }

  String? _validateName(String? value, String? errorMessage) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }
    return null;
  }

  String? _validateSubject(String? value, String? errorMessage) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }
    return null;
  }

  String? _validateMessage(String? value, String? errorMessage) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }
    return null;
  }

  String? _validatePhoneNumber(String? value, String? errorMessage) {
    if (value!.isEmpty) {
      return errorMessage;
    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Please enter a valid 10-digit phone number';
    }
    return null;
  }
  @override

  void submit() async {
    if (contacctKey.currentState!.validate()) {
      context.read<SubmitEnquiryCubit>().login(SubmitEnquiryRequestModel(
          userId: ApiConstant.userId,
          fullname: nameController.text,
          email: emailController.text,
          phone: phoneNumberController.text,
          subject: subjectController.text,
          message: messageController.text,
          lang: ApiConstant.langCode));
    }
  }

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;

    return MultiBlocListener(
      listeners: [
        BlocListener<ContactCubit, ContactState>(
          listener: (context, contactState) {
            // Handle state changes from ContactCubit here
             final userData = contactState.model.data?.userData;
    emailController.text = userData?.email ?? '';
    nameController.text = userData?.name ?? '';
    phoneNumberController.text = userData?.phone ?? '';
          },
        ),
        BlocListener<SubmitEnquiryCubit, SubmitEnquiryState>(
          listener: (context, submitState) {
            if (submitState?.networkStatusEnum == NetworkStatusEnum.loaded) {
              ToastWidget(
                      message: submitState.model.message, color: Colors.green)
                  .build(context);
              context.router.pop();
            }
          },
        ),
      ],
      child: BlocBuilder<ContactCubit, ContactState>(
        builder: (context, contactState) {
          if (contactState.networkStatusEnum == NetworkStatusEnum.loading) {
            return Center(child: CircularProgressIndicator(color: appColor));
          }
          if (contactState.networkStatusEnum == NetworkStatusEnum.loaded) {
            
            contactData = contactState.model.data?.contactData;

            return Scaffold(
              appBar: TitleAppBarWidget(title: "Contact Us"),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(screenPadding),
                  child: Form(
                    key: contacctKey,
                    child: Column(
                      children: [
                        TextForm(
                          keyboardType: TextInputType.name,
                          labelText: 'FullName',
                          hintText: 'FullName',
                          controller: nameController,
                          type:'name',
                          validating: (value) =>
                              _validateName(value,"Name Required"),
                              readOnly: contactState.model.data?.userData?.name!=null && (contactState.model.data?.userData?.name?.isNotEmpty??false)? true:false,
                        ),
                        vericalSpaceExtraMedium,
                        TextForm(
                          keyboardType: TextInputType.number,
                          labelText: 'Phone Number',
                          hintText: 'Phone Number',
                          controller: phoneNumberController,
                          type: 'mobileNumber',
                          readOnly: contactState.model.data?.userData?.phone!=null && (contactState.model.data?.userData?.phone?.isNotEmpty??false)? true:false,
                          validating: (value) =>
                              _validatePhoneNumber(value, "Mobile Required"),
                        ),
                        vericalSpaceExtraMedium,
                        TextForm(
                          keyboardType: TextInputType.emailAddress,
                          labelText: 'Email',
                          hintText: 'Email',
                          controller: emailController,
                          readOnly:contactState.model.data?.userData?.email!=null && (contactState.model.data?.userData?.email?.isNotEmpty??false)? true:false,
                          // Assuming no validation needed for email
                        ),
                        vericalSpaceExtraMedium,
                       
                        DropDownWidget1(items:contactState.model.data?.subjectTypes??[] ,
                         hint: 'Select Subject',
                         size: subjectController.text,
                         width: swidth,
                         onChanged: (p0) {
                           subjectController.text=p0??'';
                         },),
                        vericalSpaceExtraMedium,
                        TextForm(
                          keyboardType: TextInputType.text,
                          // labelText: '${langData?.message}',
                          hintText: 'message',
                          controller: messageController,
                          maxLines: 5,
                          validating: (value) =>
                              _validateMessage(value, "Message Required"),
                        ),
                        vericalSpaceExtraMedium,
                        ButtonWidget(
                          onPressed: submit,
                          buttonName: 'Submit',
                          buttonColor: appColor,
                        ),
                       

              vericalSpaceLarge,
              Row(
               
                children: [
          RoundIconWidget(iconData: Icons.location_on_outlined,),
          horizontalSpaceMedium,
          TextViewMedium(name: "Address",fontWeight: FontWeight.w700,textColors: appColor,)]),
          
          Row(
           
            children: [
            SizedBox(width: 30,),
            horizontalSpaceMedium,
            Container(
              width: swidth/1.5,
              child: TextViewSmall(title: contactData?.address,textcolor: greyColor,))
          ],),
          // vericalSpaceMedium,
           Row(
               
                children: [
          RoundIconWidget(iconData: Icons.phone_outlined,),
          horizontalSpaceMedium,
          TextViewMedium(name:"Phone Number",fontWeight: FontWeight.w700,textColors: appColor,)]),
          
          Row(
           
            children: [
            SizedBox(width: 30,),
            horizontalSpaceMedium,
            SizedBox(
              width: swidth/1.5,
              height: sheight/10,
              child: ListView.builder(
          itemCount: contactData?.contactNameNumbers?.length,
          itemBuilder: (context,index){
            var name=contactData?.contactNameNumbers?[index].name;
            var number=contactData?.contactNameNumbers?[index].number;
           return Column(
             children: [
               Row(children: [
                         TextViewSmall(title:'${ name} ',fontWeight: FontWeight.w700,textcolor: appColor,),
                         TextViewSmall(title: '  :  ${number}',textcolor: greyColor,)
               ],),
               vericalSpaceSmall
             ],
           );
              }))
          ],),

           Row(
               
                children: [
          RoundIconWidget(iconData: Icons.phone_outlined,),
          horizontalSpaceMedium,
          TextViewMedium(name: "Whatsapp",fontWeight: FontWeight.w700,textColors: appColor,)]),
          
          Row(
           
            children: [
            SizedBox(width: 30,),
            horizontalSpaceMedium,
            SizedBox(
              width: swidth/1.5,
              height: sheight/13,
              child: ListView.builder(
          itemCount: contactData?.whatsappNameNumbers?.length,
          itemBuilder: (context,index){
            var name=contactData?.whatsappNameNumbers?[index].name;
            var number=contactData?.whatsappNameNumbers?[index].number;
           return Column(
             children: [
               Row(children: [
                         TextViewSmall(title:'${ name} ',fontWeight: FontWeight.w700,textcolor: appColor,),
                         TextViewSmall(title: '  :  ${number}',textcolor: greyColor,)
               ],),
               vericalSpaceSmall
             ],
           );
              }))
          ],),
           Row(
               
                children: [
          RoundIconWidget(iconData: Icons.email_outlined,),
          horizontalSpaceMedium,
          TextViewMedium(name: "email",fontWeight: FontWeight.w700,textColors: appColor,)]),
           Row(
           
            children: [
            SizedBox(width: 30,),
            horizontalSpaceMedium,
            Container(
              width: swidth/1.5,
              child: InkWell(
                onTap: (){
                  launchEmail(contactData?.email??'');
                },
                child: TextViewSmall(title: contactData?.email,textcolor: greyColor,)))
          ],),
              ],)
          ),
        ),
      ));
   }
   else{
    return Center(child: CircularProgressIndicator(color: appColor,));
   }
   } 
   )
   );
  }
  }
class RoundIconWidget extends StatelessWidget {
  IconData? iconData;
  Color? iconcolor;
  Color? backColor;
  double? iconSize;
  double? boxSize;
   RoundIconWidget({required this.iconData,this.iconcolor,this.backColor,this.iconSize,this.boxSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:boxSize?? 30,
      width:boxSize?? 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:backColor?? appColor,
      ),
      child:Icon(iconData,color:iconcolor?? whiteColor,size: iconSize??20,)
    );
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
