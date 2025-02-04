import 'package:flutter/material.dart';

import 'package:kasnew/utils/constant.dart';

class CircularWidgetC extends StatelessWidget {
  const CircularWidgetC({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(child:CircularProgressIndicator(color: appColor,));
  }
}
class CircularWidgetS extends StatelessWidget {
  const CircularWidgetS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:CircularProgressIndicator(color: appColor,)) ,
    );
  }
}

