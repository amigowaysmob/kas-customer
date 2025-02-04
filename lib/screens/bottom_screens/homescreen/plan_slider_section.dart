import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kasnew/response_model/home_model.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/text_view_small.dart';

class PlanSliderSection extends HookWidget {
  final Sections? homeSection;
LangData? langData;
  PlanSliderSection({super.key, this.homeSection,required this.langData});

  @override
  Widget build(BuildContext context) {
     
    var d=langData;
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    var position = useState(0);
   
  

    int itemCount = homeSection?.myplans?.length??0;
    return itemCount >0?Column(
      children: [
        if (itemCount > 0)
          CarouselSlider.builder(
            itemCount: itemCount,
            itemBuilder: (context, index, realIndex) {
    var data=homeSection?.myplans?[index];

              return Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextViewLarge(title:'${index+1}.${data?.planName}',textcolor: appColor,fontWeight: FontWeight.bold, ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                               TextViewSmall(title: '${d?.duration??'Duration'}',
                       textcolor: appColor,
                       fontSizes: ApiConstant.langCode!='ta'? 10:9,),
                       vericalSpaceSmall,
                        TextViewSmall(title: '${d?.payable??'Payable'}',
                       textcolor: appColor,
                       fontSizes: ApiConstant.langCode!='ta'? 10:9,),
                            ],
                          ),
                          horizontalSpaceMedium,
                          Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              TextViewSmall(title: ':',textcolor: appColor,fontSizes:ApiConstant.langCode!='ta'? 10:9,),
                  vericalSpaceSmall,
                  TextViewSmall(title: ':',textcolor: appColor,fontSizes:ApiConstant.langCode!='ta'? 10:9,),
                  
                            ],
                          ),
                          horizontalSpaceMedium,
                           Column(
                           crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                       TextViewSmall(title:'${data?.duration}  ',
                        textcolor: appColor,
                        fontWeight: FontWeight.w700,fontSizes: 10,),
                        vericalSpaceSmall,
                        TextViewSmall(title:'₹${data?.payable??'0'}' ,
                        textcolor:  appColor,
                        fontWeight: FontWeight.w700,fontSizes: 12,),
                       
                    ],) 
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                  TextViewSmall(title: data?.record,)
                        ],
                      ),
                      LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(4),
                        backgroundColor: Color.fromARGB(255, 216, 212, 212),
                        color: sandleColor,
                        minHeight: 5,
                        value:double.parse(data?.progress??'1') /100,),
                        vericalSpaceMedium,
                      Row(
                       
                        children: [
                        RowBoldWidget(variable: '${d?.nextDueDate??'Next Due Date'}',value:data?.dueDate ,),
                          
                      ],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                                onTap:(){
                          context.router.push(PayDuesScreen(id:data?.id ));
                                },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: sandleColor
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TextViewSmall(title: '${d?.payNow??'Pay Now'}',textcolor: blackColor,fontWeight: FontWeight.bold,),
                              ),
                            ),
                          ),
                        ],
                      ),
                    
                    ],
                  ),
                ),);
            },
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                position.value = index;
              },
              
              height: sheight/4.5,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              viewportFraction: 0.9
              ,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 2),
            ),
          ),
          vericalSpaceSmall,
        if (itemCount > 0)
          DotsIndicator(
            dotsCount: itemCount,
            position: position.value,
            decorator: DotsDecorator(
              color: greyColor,
              activeColor: appColor,
            ),
          )
      ],
    ):Container();
  }
}
class RowBoldWidget extends StatelessWidget {
  String? variable;
  String? value;
   RowBoldWidget({this.variable,this.value});

  @override
  Widget build(BuildContext context) {
    return  Row(children: [
    TextViewSmall(title: '${variable} : ',textcolor: appColor,fontSizes: ApiConstant.langCode!='ta'? 10:9,),
     TextViewSmall(title: '${value}',textcolor: appColor,fontWeight: FontWeight.w700,fontSizes: 12,),
],);
  }
}