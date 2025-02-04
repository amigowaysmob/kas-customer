import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kasnew/cubits/ecat_detail_cubit.dart';
import 'package:kasnew/response_model/e_cat_detail_request_model.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/router/router_path.dart';
import 'package:kasnew/screens/sidebar/ecat/ecat_widget.dart';
import 'package:kasnew/screens/sidebar/ecat/product_slider_section.dart';
import 'package:kasnew/states/ecat_detail_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/expand_html_widget.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class ECatDetailScreen extends StatefulWidget {
  String? id;
 ECatDetailScreen({required this.id});

  @override
  State<ECatDetailScreen> createState() => _ECatDetailScreenState();
}

class _ECatDetailScreenState extends State<ECatDetailScreen> {
  @override
  

  @override
  void initState() {
    super.initState();
    context.read<ECatDetailCubit>().login(ECatDetailRequestModel(userId: ApiConstant.userId,
    lang: ApiConstant.langCode,productId:widget.id ));
  }
  Widget build(BuildContext context) {
      LangModel? lang=ApiConstant.language;
    var d=lang?.data;
     double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return   BlocConsumer<ECatDetailCubit, ECatDetailState>(
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
      var pData=data?.productData;
     return
       Scaffold(
        backgroundColor: greyColor,
      appBar: TitleAppBarWidget(title:data?.productData?.productName),
      body: SingleChildScrollView(
 
         child: Padding(padding: EdgeInsets.all(screenPadding/2),
         child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            ProductSliderList(products: pData?.proSnaps,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextViewLarge(title: pData?.productName,fontWeight: FontWeight.w700,textcolor: blackColor,),  
                 Html(data: pData?.shortDescription),
              ],
            ),
          ) ,  
            ],
          ),),
          vericalSpaceMedium,
          Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),

            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextViewLarge(title: d?.productDescription??'Product Description',fontWeight: FontWeight.w700,textcolor: blackColor),
                Divider(),
               
        ExpandableHtmlWidget(htmlContent: pData?.description,)
              
              ],
                        ),
            ),),
          vericalSpaceMedium,
          Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),

            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextViewLarge(title: d?.similarProducts??'Similar Products',fontWeight: FontWeight.w700,textcolor: blackColor),
                  EcatWidget(data: data?.relatedProducts),
                ],
              ),
            ))
         ])),
       ),
       bottomNavigationBar: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonWidget(onPressed: (){
         openWhatsApp(data?.contactDetails?.siteContactWhatsapp,data?.productData?.productName,data?.productData?.sku);
            }, buttonName: d?.whatsappEnquiry??'Whatsapp Enquiry', buttonColor: whiteColor,
            icon:  Icon(Icons.phone,color:Colors.green,),width: swidth/2,),horizontalSpaceSmall,
             ButtonWidget(onPressed: (){
         context.router.pushNamed(RouterPath.contact_path);
            }, buttonName: d?.enquiryForm??'Enquiry Form', buttonColor: appColor,
            icon:  Icon(Icons.list_outlined,color:whiteColor,),width: swidth/2.3,)
          ],
         ),
       ),
       );
}
else
return CircularWidgetC();
});} 

}

void openWhatsApp(String? phoneNumber, String? productName, String? productCode) async {
  // Construct the message with product details
  String message =
   "Hello, I want more details about this product\n\n"
                   "Product Name: $productName\n"
                   "Product Code: $productCode\n\n"
                   "Thank you!";

  // Encode the message to be URL-friendly
  String encodedMessage = Uri.encodeComponent(message);

  // Create the WhatsApp URL with the pre-filled message
  final whatsappUrl = "https://wa.me/$phoneNumber?text=$encodedMessage";
  
  print('whatsappUrl--$whatsappUrl');
  
  // Check if WhatsApp can be launched and launch the URL
  if (await canLaunch(whatsappUrl)) {
    await launch(whatsappUrl);
  } else {
    throw 'Could not launch WhatsApp';
  }
}
      