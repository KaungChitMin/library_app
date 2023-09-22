import 'package:flutter/material.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/widgets/easy_text_widget.dart';

import '../../widgets/easy_image_widget.dart';

class ReviewImageAndTextItemView extends StatelessWidget {
  const ReviewImageAndTextItemView(
      {super.key,
      required this.firstImageUrl,
      required this.firstReviewText,
      required this.secondImageUrl,
      required this.secondReviewText,
      required this.reviewTitle});

  final String reviewTitle;
  final String firstImageUrl;
  final String firstReviewText;
  final String secondImageUrl;
  final String secondReviewText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Review Title
        Padding(
          padding:
              const EdgeInsets.only(top: kSP15x, left: kSP10x, bottom: kSP10x),
          child: EasyTextWidget(
            text: reviewTitle,
            fontSize: kSP20x,
            fontWeight: FontWeight.bold,
          ),
        ),

        ///Image And Review Text
        SizedBox(
          height: kSP70x,
          child: Card(
            child: Row(
              children: [
                CircleAvatar(
                  radius: kSP20x,
                  child: EasyImageWidget(
                    imageUrl: firstImageUrl,
                  ),
                ),
                const SizedBox(width: kSP10x,),
                Expanded(
                  child: EasyTextWidget(
                    text: firstReviewText,
                    maxLine: 100,
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: kSP60x,
          child: Card(
            child: Row(
              children: [
                CircleAvatar(
                  radius: kSP20x,
                  child: EasyImageWidget(
                    imageUrl: secondImageUrl,
                  ),
                ),
                const SizedBox(width: kSP10x,),
                Expanded(
                  child: EasyTextWidget(
                    text: secondReviewText,
                    maxLine: 100,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
