import 'package:flutter/material.dart';
import 'package:kasnew/widgets/network_image_widget.dart';
import 'package:kasnew/widgets/text_view_small.dart';

class ProofWidget extends StatelessWidget {
  String? front;
  String? back;
String? title;
   ProofWidget({this.front,this.back,this.title});

  @override
  Widget build(BuildContext context) {
     double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextViewSmall(title: title,fontWeight: FontWeight.w700,),
        Row(
          children: [
             NetworkImageWidget(
                                                  front??'',
                                                        height: sheight / 7,
                                                        width: swidth / 3,
                                                      ),
                                                        NetworkImageWidget(
                                                  back??'',
                                                        height: sheight / 6,
                                                        width: swidth / 3,
                                                      )
          ],
        ),
      ],
    );
  }
}