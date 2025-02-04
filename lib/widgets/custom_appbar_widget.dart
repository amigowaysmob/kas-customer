
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kasnew/cubits/home_cubit.dart';
import 'package:kasnew/cubits/lang_cubit.dart';
import 'package:kasnew/cubits/lang_list_cubit.dart';
import 'package:kasnew/cubits/ledger_cubit.dart';
import 'package:kasnew/cubits/trans_cubit.dart';
import 'package:kasnew/cubits/view_profile_cubit.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/request_model/trans_request_model.dart';
import 'package:kasnew/request_model/user_id_request_model.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/states/lang_list_state.dart';
import 'package:kasnew/states/lang_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/constants/sharedpreference_help.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/network_image_widget.dart';

import '../response_model/lang_list_model.dart' as lang;





class AppBarWidget extends HookWidget implements PreferredSizeWidget {
  String? image;
   AppBarWidget({this.image});

  @override
  Size get preferredSize => Size.fromHeight(50.0.sp);

  @override
  Widget build(BuildContext context) {
    final sharedPreferenceHelper = useState<SharedPreferenceHelper?>(null);

    useEffect(() {
      final helper = SharedPreferenceHelper();
      helper.init().then((_) {
        sharedPreferenceHelper.value = helper;
        // After initialization, call the Cubit's login method
        final userId = sharedPreferenceHelper.value?.getUserId;
      
           context.read<LangListCubit>().login(UserIdRequestModel(userId: userId));
        
      });
    }, []);
    void refresh()async{
   context.read<LangCubit>().login(HomeRequestModel(userId: sharedPreferenceHelper.value?.getUserId,lang: sharedPreferenceHelper.value?.getLanguageCode));   
await context.read<HomeCubit>().login(HomeRequestModel(userId: sharedPreferenceHelper.value?.getUserId,lang: sharedPreferenceHelper.value?.getLanguageCode));
 await context.read<LedgerCubit>().login(HomeRequestModel(userId: sharedPreferenceHelper.value?.getUserId,lang: sharedPreferenceHelper.value?.getLanguageCode));
await context.read<TransCubit>().login(TransRequestModel(userId: sharedPreferenceHelper.value?.getUserId,lang: sharedPreferenceHelper.value?.getLanguageCode));
await context.read<ViewProfileCubit>().login(HomeRequestModel(userId: sharedPreferenceHelper.value?.getUserId,lang: sharedPreferenceHelper.value?.getLanguageCode));
}
    return MultiBlocListener(
     listeners: [
      BlocListener<LangListCubit,LangListState>(listener:  (context, state) {
           
      if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text=='Success') {
   
      }
      else if(state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text!='Success'){

      }
    },),
      BlocListener<LangCubit,LangState>(listener:  (context, state) {
           
      if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text=='Success') {
  //  sharedPreferenceHelper.value?.saveLang(state.model.data);
  //  print(ApiConstant.language);
  //  print('-------------------------------------saved');
      }
      else if(state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text!='Success'){

      }
    },)
     ],
     child:   
     BlocBuilder<LangListCubit, LangListState>(
          builder: (context, state) {
            return Container(
          height:  preferredSize.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            IconButton(
              icon: Icon(Icons.menu,color: appColor,size: 30.r,),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
             InkWell(
              onTap:(){context.router.push(BottomNavigationRoute());},
              child:Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset('assets/images/home_logo.png',fit:BoxFit.cover),
              )),
                            PopupMenuButton<lang.Data>(
                              icon: Image.asset(
    'assets/images/lang_img.png', // Replace with your image asset path
    
  ),
                iconColor: appColor,
                position: PopupMenuPosition.under,
                onSelected: (selectedLanguage) {
                  // Handle language selection here
                  print('Selected language: ${selectedLanguage.name}');
                  sharedPreferenceHelper.value?.saveLangCode(selectedLanguage.langCode);
                  var langCode = sharedPreferenceHelper.value?.getLanguageCode;
                  print(langCode);
                  refresh();
                  // Dispatch an action to update the language state if needed
                },
                itemBuilder: (BuildContext context) {
                  return state.model.data?.map((language) {
                    return PopupMenuItem<lang.Data>(
                      value: language,
                      child: Text(language.name ?? ''),
                    );
                  }).toList() ?? [];
                },
              ),
          ],)
            // bottom: Container(),
            //  titleSpacing:  preferredSize.height,
           
        );
          }
         ),
    );
    
  }
 }
