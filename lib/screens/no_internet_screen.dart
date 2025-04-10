import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasnew/cubits/site_settings_cubit.dart';

import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/text_view_medium.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(screenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/no_internet.png',),
            vericalSpaceMedium,
            TextViewMedium(name: 'Check Your Internet Connection'),
            vericalSpaceMedium,
            ButtonWidget(onPressed: (){
              context.read<SiteSettingsCubit>().login(); 
            }, buttonName: 'Try again', buttonColor: appColor,
            width: swidth/2,
            )
          ],
        ),
      ),
    );
  }
}