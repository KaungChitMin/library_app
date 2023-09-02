import 'package:flutter/material.dart';
import 'package:library_book/widgets/easy_image_widget.dart';
import 'package:library_book/widgets/easy_text_widget.dart';

import '../../constant/dimens.dart';
import '../../data/vos/home_page_vo/results_vo/books_vo.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key, required this.bookList});

  final List<BooksVO> bookList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: bookList.length,
        itemBuilder: (_, index) {
          return BooksImageAndNameView(
            imageUrl: bookList[index].bookImage ?? '',
            bookName: bookList[index].title ?? '',
          );
        },
        separatorBuilder: (_, index) => const SizedBox(
          width: 10,
        ),
      ),
    );
  }
}

class BooksImageAndNameView extends StatelessWidget {
  const BooksImageAndNameView(
      {super.key, required this.imageUrl, required this.bookName});

  final String imageUrl;
  final String bookName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 160,
      child: Stack(
        children: [
          Positioned.fill(
              child: EasyImageWidget(
            imageUrl: imageUrl,
          )),
          Positioned(
            bottom: kSP20x,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: EasyTextWidget(
                text: bookName,
              ),
            ),
          )
        ],
      ),
    );
  }
}
