import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:kasnew/response_model/gallery_model.dart';
import 'package:kasnew/utils/constant.dart';
@RoutePage()
class FullScreenSlider extends StatefulWidget {
 final  List<GalleryData>? images;
  final int initialIndex;

  const FullScreenSlider({
    required this.images,
    required this.initialIndex,
    Key? key,
  }) : super(key: key);

  @override
  _FullScreenSliderState createState() => _FullScreenSliderState();
}

class _FullScreenSliderState extends State<FullScreenSlider> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.images?.length,
            itemBuilder: (context, index) {
              return Center(
                child:InteractiveViewer(
                    boundaryMargin: EdgeInsets.all(20.0),
                    minScale: 1,
                    maxScale: 10.0,child:  SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                      child: Image.network(
                      widget.images?[index].value??'',
                      fit: BoxFit.contain,
                                        ),
                    ),
                ),
              );
            },
          ),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
