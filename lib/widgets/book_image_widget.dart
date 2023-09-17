import 'package:flutter/material.dart';

import '../constant/dimens.dart';
import 'easy_image_widget.dart';

class BookImageWidget extends StatelessWidget {
  const BookImageWidget({
    super.key,
    required this.imageUrl,
    this.height,
  });

  final double? height;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kSP10x),
      child: EasyImageWidget(
        imageUrl: imageUrl,
        fit: BoxFit.fitHeight,
        height: height,
      ),
    );
  }
}
