import 'package:flutter/material.dart';
import 'package:library_book/constant/colors.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/constant/strings.dart';
import 'package:library_book/data/vos/home_page_vo/results_vo/books_vo/book_vo.dart';
import 'package:library_book/utils/bloc_extensions.dart';
import 'package:library_book/widgets/easy_text_widget.dart';

import '../view_items/details_page_view_items/book_image_name_and_author_item_view.dart';
import '../view_items/details_page_view_items/feed_back_view_item.dart';
import '../view_items/details_page_view_items/rating_view_item.dart';
import '../view_items/details_page_view_items/review_image_and_text.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.booksVO});

  final BooksVO booksVO;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const EasyTextWidget(text: 'About Book'),
        leading: GestureDetector(
            onTap: () {
              context.navigateBack(context);
            },
            child: const Icon(Icons.arrow_back_sharp)),
        backgroundColor: kCyanColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kSP15x,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Books Image, Name And Writer Session
              BooksImageNameAndAuthorItemView(
                imageUrl: booksVO.bookImage ?? '',
                name: booksVO.title ?? '',
                author: booksVO.author ?? '',
              ),

              ///Rating And Create Date Session
              RatingItemView(
                date: booksVO.createdDate ?? '',
              ),

              ///Review Session
              const ReviewImageAndTextItemView(
                reviewTitle: kReviewText,
                firstImageUrl: kFirstReviewImageText,
                firstReviewText: kFirstReviewText,
                secondImageUrl: kSecondReviewImageText,
                secondReviewText: kSecondReviewText,
              ),

              ///FeedBack Session
              const SizedBox(height: kSP30x,),
              const FeedBackItemView(),
            ],
          ),
        ),
      ),
    );
  }
}
