import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kasnew/utils/constant.dart';

class NetworkImageWidget extends StatelessWidget {
  NetworkImageWidget(this.imageUrl, {super.key, this.fit, this.height, this.width});

  final String imageUrl;
  BoxFit? fit;
  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          Center(child: CircularProgressIndicator(value: downloadProgress.progress,color: appColor,)),
      errorWidget: (context, url, error) => Container(),
    );
  }
}
