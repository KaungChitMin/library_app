import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../constant/api_constant.dart';

class EasyImageWidget extends StatelessWidget {
  const EasyImageWidget(
      {Key? key,
      required this.imageUrl,
      this.fit = BoxFit.contain,
      this.height,
      this.width})
      : super(key: key);
  final String imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      fit: fit,
      imageUrl: (imageUrl.isEmpty) ? kDefaultImage : imageUrl,
    );
  }
}
