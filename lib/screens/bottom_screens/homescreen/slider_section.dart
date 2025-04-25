import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kasnew/response_model/home_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/constants/sharedpreference_help.dart';
import 'package:kasnew/widgets/network_image_widget.dart';
import 'package:kasnew/widgets/no_userId_function.dart';
import 'package:kasnew/widgets/scale_image_widget.dart';


class SliderSection extends HookWidget {
  final Sections? homeSection;

  SliderSection({super.key, this.homeSection});

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    var position = useState(0);
   String optimizeImageUrl(String url) {
  return "$url?format=webp&quality=10"; // Adjust quality
}

final sharedPreferenceHelper = useState<SharedPreferenceHelper?>(null);
 final cachedImages = useState<List<String>>([]);
   useEffect(() {
      final helper = SharedPreferenceHelper();
      helper.init().then((_) async {
        sharedPreferenceHelper.value = helper;
        final storedImages = helper.getImageList;

        
          final banners = homeSection?.banners ?? [];
          if (banners.isNotEmpty) {
            List<String> localPaths = [];
            for (var banner in banners) {
              String localPath = await Helper.downloadImage(banner);
              localPaths.add(localPath);
            }
            helper.saveImageList(localPaths);
            cachedImages.value = localPaths;
          
        }
      });
    }, []);


     int itemCount = cachedImages.value.length;
    return itemCount >0?Stack(
      children: [
        if (itemCount > 0)
          CarouselSlider.builder(
            itemCount: itemCount,
            itemBuilder: (context, index, realIndex) {
    
             String imagePath = cachedImages.value[index];
                  bool isLocalFile = imagePath.startsWith('/');

                  return isLocalFile
                      ? Container(
  width: double.infinity,
  height: double.infinity,child: Image.file(File(imagePath), fit: BoxFit.fill))
                      : NetworkImageWidget(optimizeImageUrl(imagePath),
                          fit: BoxFit.cover);
            },
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                position.value = index;
              },
              height: sheight / 4,
              
              enlargeCenterPage: false,
              enableInfiniteScroll: false,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
            ),
          ),
      
      ],
    ):Container();
  }
}
