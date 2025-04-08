import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/text_view_small.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';

// @RoutePage()
// class WinnerVideoScreen extends StatefulWidget {
  
  
//    WinnerVideoScreen({this.image,this.title});

//   @override
//   State<WinnerVideoScreen> createState() => _WinnerVideoScreenState();
// }

// class _WinnerVideoScreenState extends State<WinnerVideoScreen> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<GalleryCubit>().login(HomeRequestModel(userId: ApiConstant.userId,lang: ApiConstant.langCode));
//   }
//   LangData? langData=LangData() ;
//   Widget build(BuildContext context) {
//        double swidth = MediaQuery.of(context).size.width;
//     double sheight = MediaQuery.of(context).size.height;
//     return  BlocConsumer<GalleryCubit, GalleryState>(
//           listener: (context, state) {
           
//          },
//           builder: (context, state) {
//             if (state.networkStatusEnum == NetworkStatusEnum.loading) {
//               return Center(child:CircularProgressIndicator(color: appColor,));
//             } else if (state.networkStatusEnum == NetworkStatusEnum.loaded) {
//               langData=state.model.data?.langData;
//               print(sheight/6);
//               print(swidth/2.5);
// return Scaffold(
//   appBar: TitleAppBarWidget(title:'Winners Video Screen' ),
//   body: GridView.builder(
//               padding: EdgeInsets.all(10),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2, // Two images per row
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//               ),
//               itemCount: state.model.data?.galleryData?.length?? 0,
//               itemBuilder: (context, index) {
//                 var image=state.model.data?.galleryData?[index].value;
//                 var title=state.model.data?.galleryData?[index].title;
//                 return 
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [


//                         InkWell(
//                           onTap:(){
//                             context.router.push(FullScreenSlider(images: state.model.data?.galleryData, 
//                             initialIndex:index ));
//                           },
//                           child:Image.network(
//                             image??'',
//                             fit: BoxFit.cover,
//                             height: sheight/6,
//                             width: swidth/2.5,
//                           ),
//                         ),
//                         vericalSpaceSmall,
//                         TextViewSmall(title: title,textcolor: appColor,fontWeight: FontWeight.bold,),
//                       ],
//                     );
                  
                 
//               },
//             ),
// );

//             }
//             else{
//               return CircularWidgetS();
//             }
//    } );
//   }
// }