import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/widgets/text_view_medium.dart';

class TitleContainerWidget extends StatelessWidget {
  String? title;
  VoidCallback? onTap;
  IconData? iconData;
  Color? iconColor;

  IconData? faIcon; 
 TitleContainerWidget({this.title,this.onTap,this.iconData,this.iconColor,this.faIcon});

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 10,
          shadowColor: yellowColor,
          child: Container(
            
                height: sheight/12,
                width: swidth,
            decoration: BoxDecoration(
              border: Border.all(color: appColor),
             borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                     faIcon!=null?  FaIcon(faIcon,color: iconColor??appColor):   Icon(iconData,color: iconColor??appColor,),
                        SizedBox(
                          width: swidth/1.8,
                          child: TextViewMedium(name:' $title',textColors: appColor,fontWeight: FontWeight.bold,)),
                      ],
                    ),
                  
                    Icon(Icons.keyboard_arrow_right_outlined,color: appColor,)
                  ],
                ),
              ),
            ),
          ),
        )),
    );
  }
}


class TitleDropContainerWidget extends StatelessWidget {
  String? title;
  VoidCallback? onTap;
  IconData? iconData;
  Color? iconColor;
Widget? widget;
  IconData? faIcon; 
 TitleDropContainerWidget({this.title,this.onTap,this.iconData,this.iconColor,this.faIcon,this.widget});

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 10,
          shadowColor: yellowColor,
          child: Container(
            
                height: sheight/12,
                width: swidth,
            decoration: BoxDecoration(
              border: Border.all(color: appColor),
             borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                     faIcon!=null?  FaIcon(faIcon,color: iconColor??appColor):   Icon(iconData,color: iconColor??appColor,),
                       widget??Container(),
                      ],
                    ),
                  
                    Icon(Icons.keyboard_arrow_right_outlined,color: appColor,)
                  ],
                ),
              ),
            ),
          ),
        )),
    );
  }
}