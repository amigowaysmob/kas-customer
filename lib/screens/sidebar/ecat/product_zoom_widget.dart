import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kasnew/utils/constant.dart';

@RoutePage()
class ZoomProductScreen extends StatelessWidget {
  String? imgUrl;
  ZoomProductScreen({this.imgUrl});

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return  Scaffold(

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(icon: Icon(Icons.close,color: blackColor,),onPressed: () {
                  context.router.pop();
                },),
              ],
            ),
            Hero(
              tag:'product',
              child: InteractiveViewer(
                    boundaryMargin: EdgeInsets.all(20.0),
                    minScale: 1,
                    maxScale: 10.0,child: Image.network(imgUrl??'',height:sheight/1 ,width: swidth,)),
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}