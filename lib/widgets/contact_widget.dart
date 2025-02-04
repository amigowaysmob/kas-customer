import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kasnew/response_model/site_settings_model.dart';
import 'package:kasnew/router/router_path.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/widgets/text_view_small.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
     SiteSettingsModel? lang=ApiConstant.siteModel;
    var d=lang?.data;
    String? number;
    void aboutUs(){
context.router.pushNamed(RouterPath.about_us_path) ; 
}
 void locateUs(){
context.router.pushNamed(RouterPath.stores_path) ; 
}
void _makingPhoneCall() async {
  // Retrieve and sanitize the phone number
  String? rawPhoneNumber = d?[0].siteContactNumber?.replaceAll(RegExp(r'\s+'), '');
  
  if (rawPhoneNumber == null || rawPhoneNumber.isEmpty) {
    print("Error: No valid phone number provided.");
    return;
  }

  // Construct the `tel` URI
  var url = Uri.parse("tel:$rawPhoneNumber");
  print('Phone URL: $url');

  // Launch the phone dialer
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    print("Error: Could not launch $url");
    throw 'Could not launch $url';
  }
}


  _launchURL() async {
    final Uri urll = Uri.parse(d?[0].websiteUrl??'');
    if (await canLaunchUrl(urll)) {
      await launchUrl(urll);
    
     
      
    } else {
      throw 'Could not launch $urll';
    }
  }

    List<IconTextWidget?> iconList=[IconTextWidget(Icons.location_on, 'Locate Us',
    Colors.red,locateUs),
    IconTextWidget(Icons.info_outline, 'About Us',Colors.blue,aboutUs),
    IconTextWidget(Icons.phone, 'Contact Us',Colors.blue,_makingPhoneCall),
    IconTextWidget(Icons.web, 'Website',Colors.blue,_launchURL),];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap:iconList[0]?.onTap ,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
            Icon(iconList?[0]?.iconData,color: iconList[0]?.iconColor,),
            vericalSpaceSmall,
            TextViewSmall(title: iconList?[0]?.text)
              ],
            ),
          ),
        ),
         InkWell(
          onTap:iconList[1]?.onTap ,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
            Icon(iconList?[1]?.iconData,color: iconList[1]?.iconColor,),
            vericalSpaceSmall,
            TextViewSmall(title: iconList?[1]?.text)
              ],
            ),
          ),
        ),
         InkWell(
          onTap:iconList[2]?.onTap ,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
            Icon(iconList?[2]?.iconData,color: iconList[2]?.iconColor,),
            vericalSpaceSmall,
            TextViewSmall(title: iconList?[2]?.text)
              ],
            ),
          ),
        ),
         InkWell(
          onTap:iconList[3]?.onTap ,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
            Icon(iconList?[3]?.iconData,color: iconList[3]?.iconColor,),
            vericalSpaceSmall,
            TextViewSmall(title: iconList?[3]?.text)
              ],
            ),
          ),
        ),
      ],
    );
      }
    
  }

class IconTextWidget {
  IconData? iconData;
  String? text;
  Color? iconColor;
  void Function()? onTap;
  IconTextWidget(this.iconData,this.text,this.iconColor,this.onTap);
}
void locate(){

}

void contactUs(){

}
void website(){

}
