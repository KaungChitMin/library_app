import 'package:flutter/material.dart';
import 'package:library_book/constant/colors.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/widgets/easy_text_widget.dart';
import 'package:library_book/widgets/rating_widget.dart';

class RatingItemView extends StatelessWidget {
  const RatingItemView({super.key, required this.date});

  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Rating
        const Expanded(
            child: Card(
          elevation: 2,
          child: SizedBox(
            height: kSP42x,
            child: Row(
              children: [
                SizedBox(
                  width: kSP20x,
                ),
                EasyTextWidget(
                  text: '3.5',
                ),
                RatingWidget(),
              ],
            ),
          ),
        )),

        /// Create Date
        Expanded(
          child: SizedBox(
            height: kSP50x,
            child: Card(
              color: kCyanColor,
              child: Center(child: EasyTextWidget(text: date)),
            ),
          ),
        )
      ],
    );
  }
}
