import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/cubits/e_cat_cubit.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/states/e_cat_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/indicator_widget.dart';

import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/text_view_small.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';
@RoutePage()
class ECatScreen extends StatefulWidget {
  const ECatScreen({super.key});

  @override
  State<ECatScreen> createState() => _ECatScreenState();
}
class _ECatScreenState extends State<ECatScreen> {
  void initState(){
    super.initState();
    context.read<ECatCubit>().login(HomeRequestModel(userId: ApiConstant.userId,lang: ApiConstant.langCode));
  }
  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: TitleAppBarWidget(title: 'E-catalogue'),
      body: BlocConsumer<ECatCubit,ECatState>(
        listener: (context, state) {
          
        },
        builder: (context, state) {
          
         if(  state.networkStatusEnum==NetworkStatusEnum.loading){
      return CircularWidgetC();
    }
  else  if( state.networkStatusEnum==NetworkStatusEnum.loaded){ 
    var data=state.model.data;
      return   SingleChildScrollView(
        child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
            mainAxisSpacing:10,
          
            mainAxisExtent: sheight/3,
            crossAxisSpacing: 10
             
              
              ),
              itemCount: data?.length,
              itemBuilder: (context, index) {
                 var eData=data?[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      context.router.push(ECatDetailScreen(id: eData?.id));
                    },
                    child: Card(
                      elevation: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                              Image.network(eData?.image??'',height: sheight/5.5,width: swidth/2,fit: BoxFit.cover,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: swidth/2.1,
                                      child: TextViewMedium(name:'${eData?.productName}' ,fontWeight: FontWeight.bold,textColors: appColor,)),
                                    TextViewSmall(title: 'Weight:${eData?.weight}',textcolor: greyColor,),
                                    TextViewMedium(name: '₹${eData?.price}',textColors: appColor,fontWeight: FontWeight.w800,),
                                  ],
                                ),
                              )
                              
                      ],),
                    ),
                  )
                );
              },
            ),
      );}
          else{
            return CircularWidgetC();
          }
        }
      ),
    );
  }
}