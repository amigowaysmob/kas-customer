import 'package:flutter/material.dart';
import 'package:kasnew/widgets/network_image_widget.dart';



class HeaderSection extends StatelessWidget {
  String? image;
  HeaderSection({required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top:8.0,left: 8.0,right: 8.0,bottom:8.0),
      child: Image.asset('assets/images/header_logo_img.png'),
    ) ;
  }
}