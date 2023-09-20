import 'package:flutter/material.dart';
import 'package:library_book/utils/bloc_extensions.dart';

import '../../../constant/api_constant.dart';
import '../../../constant/dimens.dart';
import '../../../data/vos/home_page_vo/results_vo/books_vo/book_vo.dart';
import '../../../data/vos/home_page_vo/shelf_vo/shelf_vo.dart';
import '../../../pages/shelf_books_page.dart';
import '../../../widgets/easy_image_widget.dart';
import '../../../widgets/easy_text_widget.dart';

class ShelfBooksListTileView extends StatelessWidget {
  const ShelfBooksListTileView({
    super.key,
    required this.shelfVO,
    required this.booksVO,
  });

  final ShelfVO shelfVO;
  final BooksVO booksVO;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          context.getShelfPageBloc().addBooksToShelf(shelfVO, booksVO);
          context.navigateBack(context);
        },
        leading: (shelfVO.bookList.isEmpty)
            ? const EasyImageWidget(
                imageUrl: kDefaultImage,
                height: kSP50x,
                width: kSP50x,
              )
            : EasyImageWidget(
                imageUrl: shelfVO.bookList.first.bookImage ?? '',
                height: kSP50x,
                width: kSP50x,
              ),
        title: EasyTextWidget(
          text: shelfVO.shelfName ?? '',
        ),
        subtitle: EasyTextWidget(
          text: ((shelfVO.bookList.length <= 1)
              ? '${shelfVO.bookList.length} book'
              : '${shelfVO.bookList.length} books'),
        ),
        trailing: IconButton(
          onPressed: () {
            context.navigateToNextScreen(
                context,
                ShelfBooksPage(
                  shelfName: shelfVO.shelfName ?? '',
                ));
            //context.getShelfPageBloc().getBookListByShelfName(shelfVO.shelfName ?? '');
          },
          icon: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
