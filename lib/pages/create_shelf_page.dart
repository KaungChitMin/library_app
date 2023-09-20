import 'package:flutter/material.dart';
import 'package:library_book/bloc/shelf_books_page_bloc.dart';
import 'package:library_book/constant/colors.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/constant/strings.dart';
import 'package:library_book/data/vos/home_page_vo/results_vo/books_vo/book_vo.dart';
import 'package:library_book/data/vos/home_page_vo/shelf_vo/shelf_vo.dart';
import 'package:library_book/utils/bloc_extensions.dart';
import 'package:library_book/widgets/easy_text_widget.dart';
import 'package:provider/provider.dart';

import '../view_items/library_page_view_items/create_shelf_view_items/empty_shelf_view.dart';
import '../view_items/library_page_view_items/create_shelf_view_items/shelf_books_list_tile_view.dart';
import '../view_items/library_page_view_items/create_shelf_view_items/show_dialog_view.dart';

class CreateShelfPage extends StatelessWidget {
  const CreateShelfPage({super.key, required this.booksVO});

  final BooksVO booksVO;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShelfBooksPageBloc>(
      create: (_) => ShelfBooksPageBloc(booksVO),
      child: Consumer<ShelfBooksPageBloc>(
        builder: (_, bloc, __) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                context.navigateBack(context);
              },
              icon: const Icon(Icons.chevron_left),
              color: kBlackColor,
            ),
            title: const EasyTextWidget(
              text: kShelfText,
            ),
          ),

          ///create shelf book file
          body: Selector<ShelfBooksPageBloc, List<ShelfVO>?>(
            selector: (_, bloc) => bloc.getShelfList,
            builder: (_, shelfList, __) {
              if (shelfList == null) {
                return const EasyTextWidget(text: kNoDataText);
              }
              if (shelfList.isEmpty) {
                return const EmptyShelfView();
              }
              return ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: shelfList.length,
                itemBuilder: (_, index) => ShelfBooksListTileView(
                  shelfVO: shelfList[index],
                  booksVO: booksVO,
                ),
                separatorBuilder: (_, index) => const SizedBox(
                  height: kSP10x,
                ),
              );
            },
          ),

          ///floating action button and show dialog session
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: const ShowDialogInFloatingView(),
        ),
      ),
    );
  }
}
