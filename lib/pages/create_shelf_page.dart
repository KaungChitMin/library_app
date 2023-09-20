import 'package:flutter/material.dart';
import 'package:library_book/bloc/shelf_books_page_bloc.dart';
import 'package:library_book/constant/colors.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/constant/strings.dart';
import 'package:library_book/data/vos/home_page_vo/results_vo/books_vo/book_vo.dart';
import 'package:library_book/data/vos/home_page_vo/shelf_vo/shelf_vo.dart';
import 'package:library_book/pages/shelf_books_page.dart';
import 'package:library_book/utils/extensions.dart';
import 'package:library_book/widgets/easy_image_widget.dart';
import 'package:library_book/widgets/easy_text_widget.dart';
import 'package:provider/provider.dart';

import '../view_items/library_page_view_items/create_shelf_view_items/show_dialog_view.dart';

class CreateShelfPage extends StatelessWidget {
  const CreateShelfPage(
      {super.key, required this.booksVO, this.isCheck = false});

  final BooksVO booksVO;
  final bool isCheck;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShelfPageBloc>(
      create: (_) => ShelfPageBloc(isCheck ? booksVO : BooksVO(order: 0)),
      child: Consumer<ShelfPageBloc>(
        builder: (_, bloc, __) => Scaffold(
          appBar: isCheck
              ? null
              : AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () {
                      context.navigateBack(context);
                    },
                    icon: const Icon(Icons.chevron_left),
                    color: kPrimaryTextColor,
                  ),
                  title: const EasyTextWidget(
                    text: 'Add to shelf',
                  ),
                ),

          ///create shelf book file
          body: Selector<ShelfPageBloc, List<ShelfVO>?>(
            selector: (_, bloc) => bloc.getShelfList,
            builder: (_, shelfList, __) {
              if (shelfList == null) {
                return const EasyTextWidget(text: kNoDataText);
              }
              if (shelfList.isEmpty) {
                return const EmptyShelfView();
              }
              return ListView.separated(
                itemCount: shelfList.length,
                itemBuilder: (_, index) => ShelfBooksFileView(
                  shelfVO: shelfList[index],
                  booksVO: booksVO,
                  isCheck: isCheck,
                ),
                separatorBuilder: (_, index) => const SizedBox(
                  height: kSP10x,
                ),
              );
            },
          ),

          ///floating button and show dialog session
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: const ShowDialogInFloatingView(),
        ),
      ),
    );
  }
}

class ShelfBooksFileView extends StatelessWidget {
  const ShelfBooksFileView(
      {super.key,
      required this.shelfVO,
      required this.booksVO,
      required this.isCheck});

  final ShelfVO shelfVO;
  final BooksVO booksVO;
  final bool isCheck;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: isCheck
            ? null
            : () {
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
          text: ('${shelfVO.bookList.length} books'),
        ),
        trailing: IconButton(
          onPressed: () {
            context.navigateToNextScreen(
                context,
                BookShelfPage(
                  shelfName: shelfVO.shelfName ?? '',
                ));
          },
          icon: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}

class EmptyShelfView extends StatelessWidget {
  const EmptyShelfView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(
            height: 205,
            //width: double.infinity,
            //child: EasyTextWidget(text: '😃',fontSize: 100,),
          ),
          Icon(
            Icons.library_add,
            size: 100,
            color: kGreyColor,
          ),
          SizedBox(
            height: 10,
          ),
          EasyTextWidget(
            text: 'There is no shelf right now.Create one',
            color: kGreyColor,
          )
        ],
      ),
    );
  }
}
