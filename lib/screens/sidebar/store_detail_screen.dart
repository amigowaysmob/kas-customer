import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/cubits/store_detail_cubit.dart';
import 'package:kasnew/request_model/store_detail_request_model.dart';
import 'package:kasnew/states/store_detail_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';

@RoutePage()
class StoreDetailScreen extends StatefulWidget {
  String? storeId;
   StoreDetailScreen({required this.storeId});

  @override
  State<StoreDetailScreen> createState() => _StoreDetailScreenState();
}

class _StoreDetailScreenState extends State<StoreDetailScreen> {
  @override
 
  @override
  void initState() {
    super.initState();
    context.read<StoreDetailCubit>().login(StoreDetailRequestModel(userId: ApiConstant.userId,storeId: widget.storeId));
  }
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;

    return 
    BlocConsumer<StoreDetailCubit, StoreDetailState>(
            listener: (context, state) {
           
      if (state.networkStatusEnum == NetworkStatusEnum.loaded && state?.model.text=='Success') {
   
      }
      else if(state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text!='Success'){

      }
    },
     builder: (context, state) {
     if(  state.networkStatusEnum==NetworkStatusEnum.loading){
      return Center(child: CircularProgressIndicator(color: appColor,));
    }
    if( state.networkStatusEnum==NetworkStatusEnum.loaded){
      var store_data=state.model.data?.storeData;
      var langData=state.model.data?.langData;
     return Scaffold(
      appBar: TitleAppBarWidget(title: "Our Stores"),
      body: SingleChildScrollView(
       child: Padding(padding: EdgeInsets.all(screenPadding),
       child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(store_data?.image??'',height: sheight/3,width: swidth,fit: BoxFit.contain,),
          vericalSpaceExtraMedium,
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           HeadValueWidget(head: langData?.address,value: store_data?.address,),
                 //  HeadValueWidget(head: langData?.landmark,value: store_data?.landmark??'',),
            HeadValueWidget(head: langData?.contactPerson,value: store_data?.contactPerson,),
             HeadValueWidget(head: langData?.contactNumber,value: store_data?.contactNumber,),
              HeadValueWidget(head: langData?.openingTime,value: store_data?.openingTime,),
               HeadValueWidget(head: langData?.closingTime,value: store_data?.closingTime,),
         ],
       ),
        //    WebView(
        //   initialUrl: store_data?.map,
        //   javascriptMode: JavascriptMode.unrestricted,
        // ),
       ])),
    ));} 
else
return CircularProgressIndicator();
}
        );
  }
}

class HeadValueWidget extends StatelessWidget {
  String? head;
  String? value;
   HeadValueWidget({required this.head,required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [TextViewLarge(title: head,fontWeight: FontWeight.w600,textcolor: blackColor,),
      TextViewMedium(name: value,textColors: blackColor,),
      vericalSpaceMedium],
    );
  }
}