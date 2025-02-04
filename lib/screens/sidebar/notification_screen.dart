import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/cubits/notification_cubit.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/states/notification_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/constants/sharedpreference_help.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/text_view_small.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';

@RoutePage()
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  late SharedPreferenceHelper sharedPreferenceHelper;

  @override
  void initState() {
    super.initState();
    context.read<NotificationCubit>().login(HomeRequestModel(userId: ApiConstant.userId,
    lang: ApiConstant.langCode));
  }
  Widget build(BuildContext context) {
    return 
    BlocConsumer<NotificationCubit, NotificationState>(
            listener: (context, state) {
           
      if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text=='Success') {
   
      }
      else if(state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text!='Success'){

      }
    },
     builder: (context, state) {
     if(  state.networkStatusEnum==NetworkStatusEnum.loading){
      return CircularWidgetS();
    }
    if( state.networkStatusEnum==NetworkStatusEnum.loaded){
     return Scaffold(
      appBar: TitleAppBarWidget(title: state.model.data?.langData?.notifications),
      body: SingleChildScrollView(
       child: Padding(padding: EdgeInsets.all(screenPadding/2),
       child:SizedBox(
        height:  MediaQuery.of(context).size.height,
         child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
                    itemCount:state.model?.data?.notificationData?.length ?? 0,
                    itemBuilder: (context, index) {
                      var data=state.model?.data?.notificationData?[index];
                      return Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.8, // Adjust the width as needed
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize
                                            .min, // Ensure the dialog takes only as much space as needed
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: TextViewMedium(
                                                        name:
                                                           data?.title,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    IconButton(
                                                      icon: Icon(Icons.close),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 16),
                                               Image.network(data?.image??'',height: 100,width: 100,),
                                                SizedBox(height: 16),
                                                TextViewSmall(
                                                  title: data?.content,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Card(
                              elevation: 2.0,
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color:whiteColor),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:Image.network(data?.image??'',height: 70,width: 70,)
                                        ),
                                      ),
                                      Flexible(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Expanded(
                                                  child: TextViewSmall(
                                                    title:
                                                       data?.title,
                                                    fontWeight: FontWeight.bold,
                                                    textcolor: appColor,
                                                  ),
                                                ),
                                              horizontalSpaceSmall,
                                              
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8, bottom: 10,right: 8),
                                              child: Text(
                                               data?.content??'',
                                                maxLines: 3,
                                                // Limiting to 3 lines
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12),
                                              ),
                                            ),
                                              Padding(
                                                  padding: const EdgeInsets.only(
                                                      right: 8.0,bottom: 8.0),
                                                  child: Align(
                                                    alignment: Alignment.bottomRight,
                                                    child: TextViewSmall(
                                                        title:
                                                           data?.created,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSizes: 8,
                                                        textcolor:
                                                            greyColor),
                                                  ),
                                                )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ))),
                        ),
                      );
                    },
                  ),
       )),
       )
       
    );}
    else
return CircularProgressIndicator();
    }
    );

}
}     