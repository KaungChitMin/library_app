import 'package:flutter/material.dart';

import '../../constant/dimens.dart';
import '../../data/vos/home_page_vo/results_vo/books_vo.dart';
import '../../widgets/book_image_widget.dart';
import '../../widgets/book_name_widget.dart';
import 'bottom_sheet_view.dart';

class HorizontalBookImageAndNameView extends StatelessWidget {
  const HorizontalBookImageAndNameView(
      {super.key, required this.bookList, required this.mainTitle});

  final List<BooksVO> bookList;
  final String mainTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: bookList.length,
        itemBuilder: (_, index) => BooksImageAndNameView(
          imageUrl: bookList[index].bookImage ?? '',
          bookName: bookList[index].title ?? '',
          mainTitle: mainTitle,
        ),
        separatorBuilder: (_, index) => const SizedBox(
          width: kSP10x,
        ),
      ),
    );
  }
}

class BooksImageAndNameView extends StatelessWidget {
  const BooksImageAndNameView(
      {super.key,
      required this.imageUrl,
      required this.bookName,
      required this.mainTitle});

  final String imageUrl;
  final String bookName;
  final String mainTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kBookImageAndNameHeight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onLongPress: () {
              showBottomSheet(
                  context: context,
                  builder: (_) => BottomSheetView(
                        imageUrl: imageUrl,
                        bookName: bookName,
                        mainTitle: mainTitle,
                      ));
            },
            child: BookImageWidget(
              imageUrl: imageUrl,
            ),
          ),
          const SizedBox(
            height: kSP10x,
          ),

          ///
          BookNameWidget(
            bookName: bookName,
            fontSize: kBookNameFontSize,
          )
        ],
      ),
    );
  }
}
