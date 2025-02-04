import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/cubits/stores_cubit.dart';
import 'package:kasnew/request_model/user_id_request_model.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/states/stores_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/constants/sharedpreference_help.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/network_image_widget.dart';

import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/text_view_small.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';
@RoutePage()
class StoresScreen extends StatefulWidget {
  const StoresScreen({super.key});

  @override
  State<StoresScreen> createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  late SharedPreferenceHelper sharedPreferenceHelper;

  @override
  void initState() {
    super.initState();
    context.read<StoresCubit>().login(UserIdRequestModel(
        userId: ApiConstant.userId));
  }

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return BlocConsumer<StoresCubit, StoresState>(
        listener: (context, state) {
          if (state.networkStatusEnum == NetworkStatusEnum.loaded &&
              state.model.text == 'Success') {
            // Handle success
          } else if (state.networkStatusEnum == NetworkStatusEnum.loaded &&
              state.model.text != 'Success') {
            // Handle failure
          }
        },
        builder: (context, state) {
          if (state.networkStatusEnum == NetworkStatusEnum.loading) {
            return Center(
              child: CircularProgressIndicator(
                color: appColor,
              ),
            );
          }
          if (state.networkStatusEnum == NetworkStatusEnum.loaded) {
            return Scaffold(
                appBar: TitleAppBarWidget(title: 'Our stores'),
                body: Padding(
                  padding:  EdgeInsets.all(screenPadding),
                  child: ListView.builder(
                    // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //   crossAxisCount: 2, // Two images per row
                    //   crossAxisSpacing: 10,
                    //   mainAxisSpacing: 10,
                    //    mainAxisExtent: sheight/1.75,
                       
                    // ),
                    itemCount: state.model.data?.storesData?.length,
                    itemBuilder: (context, index) {
                      var image = state.model.data?.storesData?[index].image;
                      var title = state.model.data?.storesData?[index].name;
                      var address = state.model.data?.storesData?[index].address;
                  
                      return Padding(
                        padding: EdgeInsets.only(top:8.0,bottom: 8.0),
                        child: InkWell(
                          onTap: () {
                            context.router.push(StoreDetailScreen(
                                storeId: state.model.data?.storesData?[index].id));
                          },
                          child: Card(
                            elevation: 10,
                            color: whiteColor,
                            child: Container(
                              width: swidth,
                              child: Row(
                                
                                children: [
                                 NetworkImageWidget(
                                    image ?? '',
                                    fit: BoxFit.cover,
                                    width: swidth/4, // Match the container's width
                                    height: sheight / 4, // Set height for the image
                                  ),
                                  horizontalSpaceMedium,
                                  Container(
                                    width: swidth/2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ApiConstant.langCode != 'ta'
                                              ? TextViewMedium(
                                                  name: title,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                )
                                              : TextViewSmall(
                                                  title: title,
                                                  fontSizes: 12,
                                                ),
                                          vericalSpaceSmall,
                                          TextViewSmall(title: address),
                                          vericalSpaceMedium,
                                           ButtonWidget(onPressed: (){
                                        context.router.push(StoreDetailScreen(
                                      storeId: state.model.data?.storesData?[index].id));
                                      }, buttonName:'Read More', buttonColor: appColor,width: swidth/3.5,),
                                      vericalSpaceSmall
                                        ],
                                      ),
                                    ),
                                  ),
                                 
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ));
          } else {
            return CircularWidgetS();
          }
        });
  }
}
