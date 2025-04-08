import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// class ScaleInImageWidget extends StatefulWidget {
//   final String imageUrl;
//   const ScaleInImageWidget(this.imageUrl);

//   @override
//   _ScaleInImageWidgetState createState() => _ScaleInImageWidgetState();
// }

// class _ScaleInImageWidgetState extends State<ScaleInImageWidget> {
//   bool _isLoaded = false;

//   @override
//   Widget build(BuildContext context) {
//     return TweenAnimationBuilder<double>(
//       tween: Tween(begin: 0.8, end: _isLoaded ? 1.0 : 0.8),
//       duration: const Duration(milliseconds: 500),
//       builder: (context, value, child) {
//         return Transform.scale(
//           scale: value,
//           child: Image.network(
//             widget.imageUrl,
//             fit: BoxFit.cover,
//             width: double.infinity,
//             loadingBuilder: (context, child, loadingProgress) {
//               if (loadingProgress == null) {
//                 Future.delayed(Duration(milliseconds: 100), () {
//                   if (mounted) setState(() => _isLoaded = true);
//                 });
//                 return child;
//               }
//               return Container();
//             },
//           ),
//         );
//       },
//     );
//   }
// }

Future<Uint8List> loadImageBytes(String url) async {
  final response = await Dio().get(
    url,
    options: Options(
      responseType: ResponseType.bytes,
      headers: {
        "Cache-Control": "max-age=86400", // Cache for 1 day
      },
    ),
  );
  return Uint8List.fromList(response.data);
}


class NetworkImageWidgetWithMemory extends StatefulWidget {
  final String imageUrl;
  const NetworkImageWidgetWithMemory({required this.imageUrl});

  @override
  _NetworkImageWidgetWithMemoryState createState() => _NetworkImageWidgetWithMemoryState();
}

class _NetworkImageWidgetWithMemoryState extends State<NetworkImageWidgetWithMemory> {
  Uint8List? _imageBytes;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final bytes = await loadImageBytes(widget.imageUrl);
    if (mounted) {
      setState(() => _imageBytes = bytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 100),
      opacity: _imageBytes != null ? 1.0 : 0.0,
      child: _imageBytes == null
          ? Container(color: Colors.grey[300]) // Placeholder color
          : Image.memory(_imageBytes!, fit: BoxFit.cover, width: double.infinity),
    );
  }
}
