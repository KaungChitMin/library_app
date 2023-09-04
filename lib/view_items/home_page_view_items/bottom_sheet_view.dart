import 'package:flutter/material.dart';
import 'package:library_book/utils/extensions.dart';

import '../../constant/dimens.dart';
import '../../constant/strings.dart';
import '../../widgets/book_image_widget.dart';
import '../../widgets/book_name_widget.dart';
import '../../widgets/easy_text_widget.dart';

class BottomSheetView extends StatelessWidget {
  const BottomSheetView({
    super.key,
    required this.bookName,
    required this.imageUrl,
    required this.mainTitle,
  });

  final String bookName;
  final String imageUrl;
  final String mainTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kBottomSheetHeight,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BookImageWidget(
                  imageUrl: imageUrl,
                  height: kBookImageOnBottomSheetHeight,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    EasyTextWidget(text: mainTitle),
                    const SizedBox(
                      height: kSP10x,
                    ),
                    BookNameWidget(bookName: bookName),
                  ],
                ),
                const SizedBox(width: kSP10x)
              ],
            ),
          ),
          const Divider(
            height: 0.5,
          ),
          Expanded(
            flex: 1,
            child: ShelfAndCancelWidget(
              text: kCancelText,
              icon: const Icon(
                Icons.home_mini_outlined,
                color: Colors.black38,
              ),
              onTap: () {
                context.navigateBack(context);
              },
            ),
          ),
          const Divider(
            height: 0.5,
          ),
          Expanded(
            flex: 1,
            child: ShelfAndCancelWidget(
              text: kShelfText,
              icon: const Icon(
                Icons.add_circle_outline,
                color: Colors.black38,
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class ShelfAndCancelWidget extends StatelessWidget {
  const ShelfAndCancelWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  final String text;
  final Icon icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: kSP20x,
        ),
        icon,
        const SizedBox(
          width: kSP30x,
        ),
        TextButton(
            onPressed: ()=> onTap(),
            child: EasyTextWidget(
              text: text,
              fontSize: kShelfAndCancelFontSize,
            )),
      ],
    );
  }
}
