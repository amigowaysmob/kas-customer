import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kasnew/response_model/e_cat_detail_model.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/text_view_small.dart';

class EcatWidget extends StatelessWidget {
List<  RelatedProducts?>? data; 
   EcatWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return GridView.builder(
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
                  child:InkWell(
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
            );
  }
}