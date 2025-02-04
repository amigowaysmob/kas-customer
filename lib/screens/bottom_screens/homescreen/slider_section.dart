import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kasnew/response_model/home_model.dart';
import 'package:carousel_slider/carousel_slider.dart';


class SliderSection extends HookWidget {
  final Sections? homeSection;

  SliderSection({super.key, this.homeSection});

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    var position = useState(0);
   
  

    int itemCount = homeSection?.banners?.length??0;
    return itemCount >0?Stack(
      children: [
        if (itemCount > 0)
          CarouselSlider.builder(
            itemCount: itemCount,
            itemBuilder: (context, index, realIndex) {
    
              return Container(
                decoration:BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Image.network(
                  "${homeSection?.banners?[index]}",
                  width: swidth,
                  fit:BoxFit.cover
                ),
              );
            },
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                position.value = index;
              },
              height: sheight / 4,
              
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
            ),
          ),
      
      ],
    ):Container();
  }
}
