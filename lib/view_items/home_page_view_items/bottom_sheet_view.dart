import 'package:flutter/material.dart';
import 'package:library_book/data/vos/home_page_vo/results_vo/books_vo/book_vo.dart';
import 'package:library_book/pages/create_shelf_page.dart';
import 'package:library_book/utils/bloc_extensions.dart';

import '../../constant/dimens.dart';
import '../../constant/strings.dart';
import '../../widgets/book_image_widget.dart';
import '../../widgets/book_name_widget.dart';
import '../../widgets/easy_text_widget.dart';

class BottomSheetView extends StatelessWidget {
  const BottomSheetView({
    super.key,
    required this.mainTitle,
    required this.booksVO,
    required this.imageUrl,
  });

  final BooksVO booksVO;
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
                  imageUrl: booksVO.bookImage ?? '',
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
                    BookNameWidget(bookName: booksVO.title ?? ''),
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
            child: AddToShelfAndCancelWidget(
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
            child: AddToShelfAndCancelWidget(
              text: kShelfText,
              icon: const Icon(
                Icons.add_circle_outline,
                color: Colors.black38,
              ),
              onTap: () {
                context.navigateBack(context);
                context.navigateToNextScreen(
                    context, CreateShelfPage(booksVO: booksVO));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AddToShelfAndCancelWidget extends StatelessWidget {
  const AddToShelfAndCancelWidget({
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
            onPressed: () => onTap(),
            child: EasyTextWidget(
              text: text,
              fontSize: kShelfAndCancelFontSize,
            )),
      ],
    );
  }
}
