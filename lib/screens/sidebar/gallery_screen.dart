import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/cubits/gallery_cubit.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/response_model/gallery_model.dart';
import 'package:kasnew/router/app_router.gr.dart';

import 'package:kasnew/states/gallery_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/indicator_widget.dart';

import 'package:kasnew/widgets/text_view_small.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';

@RoutePage()
class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GalleryCubit>().login(HomeRequestModel(userId: ApiConstant.userId,lang: ApiConstant.langCode));
  }
  LangData? langData=LangData() ;
  Widget build(BuildContext context) {
       double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return  BlocConsumer<GalleryCubit, GalleryState>(
          listener: (context, state) {
           
         },
          builder: (context, state) {
            if (state.networkStatusEnum == NetworkStatusEnum.loading) {
              return Center(child:CircularProgressIndicator(color: appColor,));
            } else if (state.networkStatusEnum == NetworkStatusEnum.loaded) {
              langData=state.model.data?.langData;
              print(sheight/6);
              print(swidth/2.5);
return Scaffold(
  appBar: TitleAppBarWidget(title:langData?.imagesGallery ),
  body: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two images per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: state.model.data?.galleryData?.length?? 0,
              itemBuilder: (context, index) {
                var image=state.model.data?.galleryData?[index].value;
                var title=state.model.data?.galleryData?[index].title;
                return 
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [


                        InkWell(
                          onTap:(){
                            context.router.push(FullScreenSlider(images: state.model.data?.galleryData, 
                            initialIndex:index ));
                          },
                          child:Image.network(
                            image??'',
                            fit: BoxFit.cover,
                            height: sheight/6,
                            width: swidth/2.5,
                          ),
                        ),
                        vericalSpaceSmall,
                        TextViewSmall(title: title,textcolor: appColor,fontWeight: FontWeight.bold,),
                      ],
                    );
                  
                 
              },
            ),
);

            }
            else{
              return CircularWidgetS();
            }
   } );
  }
}