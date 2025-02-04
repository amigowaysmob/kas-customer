 import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/utils/constant.dart';

class ProductSliderList extends HookWidget {
 List<String?>? products;
  ProductSliderList({super.key, this.products});

  @override
  Widget build(BuildContext context) {
    final buttonCarouselController = useCarouselController();
    

   

    // Adding product image to the list
   

// Adding video screenshot to the list (if available)



    // Zoom status to disable/enable auto-play
    final isZooming = useState(false);
    var position = useState(0);
 double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            CarouselSlider.builder(
              itemCount: products?.length,
              carouselController: buttonCarouselController,
              itemBuilder: (context, index, realIndex) {
               
                      return GestureDetector(
                  onTap: () {
                  
                   context.router.push(ZoomProductScreen(imgUrl: products?[index])); 
                  },
                  onScaleStart: (_) {
                    isZooming.value = true; // Disable auto-play when zooming
                  },
                  onScaleEnd: (_) {
                    isZooming.value = false; // Re-enable auto-play after zooming
                  },
                  child:Hero(
              tag:'product',
                    child: Image.network(
                      products?[index] ?? '',
                       width: swidth,
                      fit: BoxFit.fill,
                     
                                   
                                   
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  // Handle page changes
                    position.value = index;
                },
                
                // height: 150.sp,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 1.0,
                autoPlay: false, // Disable auto-play when zooming
                // autoPlayInterval: const Duration(seconds: 2),
              ),
            ),
            Positioned(
              bottom: 5,
              right: 0,
              left: 0,
              child: (products?.length??0) > 1?
          DotsIndicator(
            dotsCount: products?.length??1,
            position:   position.value ,
            decorator: DotsDecorator(
              color: greyColor,
              activeColor: appColor,
            ),
          ):Container())
          ],
        ),
vericalSpaceSmall,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 80.sp,
            child: ListView.separated(
              itemCount: products?.length??0,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return horizontalSpaceSmall;
              },
              itemBuilder: (BuildContext context, int index) {
                // bool isVideo = link[index] ==
                //     "${settingsModel?.data?[0].siteUrl}${ApiConstant.pathProducts}${productDetailsModel?.data?.video?.screenshot}";
          
                return InkWell(
                  onTap: () {
                    buttonCarouselController.jumpToPage(index);
                  },
                  child:Image.network(products?[index]??'')
                );
              },
            ),
          ),
        ),
        vericalSpaceSmall,
      ],
    );
  }

  CarouselSliderController useCarouselController() {
    final controller =
        useState<CarouselSliderController>(CarouselSliderController());

    useEffect(() {
      return () {
        // Cleanup when the widget is disposed
        controller.dispose();
      };
    }, const []);

    return controller.value;
  }
}
