import 'package:flutter/material.dart';

import '../../constant/dimens.dart';
import '../../widgets/easy_image_widget.dart';
import '../../widgets/easy_text_widget.dart';

class BooksImageNameAndAuthorItemView extends StatelessWidget {
  const BooksImageNameAndAuthorItemView({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.author,
  });

  final String imageUrl;
  final String name;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSP5x,vertical: kSP20x ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ///Details Books Image
          ClipRRect(
            borderRadius: BorderRadius.circular(kSP10x),
            child: EasyImageWidget(
              imageUrl: imageUrl,
              height: kDetailsImageHeight,
            ),
          ),

          ///Title And Author
          const SizedBox(width: kSP15x,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EasyTextWidget(
                  text: name,
                  maxLine: 5,
                ),
                const SizedBox(height: kSP20x),
                EasyTextWidget(
                  text: author,
                  maxLine: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
