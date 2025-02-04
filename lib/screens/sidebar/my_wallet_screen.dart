import 'package:flutter/material.dart';
import 'package:kasnew/screens/bottom_screens/homescreen/plan_slider_section.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({super.key});

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBarWidget(title: 'My Wallet'),
     body: ListView.builder(itemBuilder: (context,index){
        return Card(
          elevation: 5,
          child: Container(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(''),
                ),
                horizontalSpaceMedium,
                Column(
                  children: [
                    TextViewLarge(title: 'name',textcolor: blackColor,fontWeight: FontWeight.w800,),
                    RowBoldWidget(variable: "ID",value: 'id',),
                    TextViewLarge(title: '#7899',textcolor: blackColor,fontWeight: FontWeight.w800,)
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}