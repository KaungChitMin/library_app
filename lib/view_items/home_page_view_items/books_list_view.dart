import 'package:flutter/material.dart';
import 'package:library_book/constant/colors.dart';
import 'package:library_book/pages/details_page.dart';
import 'package:library_book/utils/bloc_extensions.dart';

import '../../constant/dimens.dart';
import '../../data/vos/home_page_vo/results_vo/books_vo/book_vo.dart';
import '../../widgets/book_image_widget.dart';
import '../../widgets/book_name_widget.dart';
import 'bottom_sheet_view.dart';

///Scrolling For Books
class HorizontalBookImageAndNameView extends StatelessWidget {
  const HorizontalBookImageAndNameView(
      {super.key,
      required this.bookList,
      required this.mainTitle,
      required this.isHomeScreen});

  final List<BooksVO> bookList;
  final String mainTitle;
  final bool isHomeScreen;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: bookList.length,
        itemBuilder: (_, index) => isHomeScreen
            ? BooksImageAndNameView(
                booksVO: bookList[index],
                mainTitle: mainTitle,
                isHomeScreen: isHomeScreen)
            : (bookList[index].isSelected == true)
                ? BooksImageAndNameView(
                    booksVO: bookList[index],
                    mainTitle: mainTitle,
                    isHomeScreen: isHomeScreen,
                  )
                : const SizedBox.shrink(),
        separatorBuilder: (_, index) => const SizedBox(
          width: kSP10x,
        ),
      ),
    );
  }
}

///Book's Detail Session
class BooksImageAndNameView extends StatelessWidget {
  const BooksImageAndNameView(
      {super.key,
      required this.mainTitle,
      required this.booksVO,
      required this.isHomeScreen});

  final BooksVO booksVO;
  final String mainTitle;
  final bool isHomeScreen;

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
                        booksVO: booksVO,
                        imageUrl: booksVO.bookImage ?? '',
                        mainTitle: mainTitle,
                      ));
            },
            child: Stack(children: [
              GestureDetector(
                onTap: () {
                  context.navigateToNextScreen(
                      context, DetailsPage(booksVO: booksVO));
                },
                child: BookImageWidget(
                  imageUrl: booksVO.bookImage ?? '',
                ),
              ),

              ///favourite Icon session
              Padding(
                  padding: const EdgeInsets.only(right: kSP20x, top: kSP10x),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: kSP18x,
                        backgroundColor: kWhiteColor,
                        child: Center(
                            child: IconButton(
                          onPressed: () => isHomeScreen
                              ? context
                                  .getHomePageBloc()
                                  .checkFavourite(mainTitle, booksVO)
                              : context
                                  .getFavouritePageBloc()
                                  .checkFavourite(mainTitle, booksVO),
                          icon: Center(
                              child: (booksVO.isSelected ?? false)
                                  ? const Icon(
                                      Icons.favorite,
                                      color: kCyanColor,
                                      size: kSP18x,
                                    )
                                  : const Icon(
                                      Icons.favorite_border,
                                      color: kGreyColor,
                                      size: kSP18x,
                                    )),
                        )),
                      )))
            ]),
          ),
          const SizedBox(
            height: kSP10x,
          ),
          BookNameWidget(
            bookName: booksVO.title ?? ' ',
            fontSize: kBookNameFontSize,
          )
        ],
      ),
    );
  }
}
