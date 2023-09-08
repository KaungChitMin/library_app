import 'package:flutter/material.dart';
import 'package:library_book/bloc/search_page_bloc.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/widgets/easy_text_widget.dart';
import 'package:library_book/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

import '../../constant/strings.dart';
import '../../data/vos/search_vo/items_vo/items_vo.dart';
import 'search_book_scroll_view.dart';

class SearchBookListItemView extends StatelessWidget {
  const SearchBookListItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<SearchPageBloc, bool>(
        selector: (_, bloc) => bloc.getIsSearching,
        builder: (_, isSearching, __) =>
        (isSearching)
            ? const LoadingWidget()
            : const BookListView(

        )
    );
  }
}


class BookListView extends StatelessWidget {
  const BookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<SearchPageBloc, List<ItemsVO>?>(
        selector: (_, bloc) => bloc.getItemsList,
        builder: (_, itemList, __) {
          if (itemList == null) {
            return const LoadingWidget();
          }
          if (itemList.isEmpty) {
            return const EasyTextWidget(text: kNoDataText);
          }
          return ListView.separated(
            itemCount: itemList.length,
            itemBuilder: (_, index) {
              BookImageAndNameView(
                volumeInfoVO: itemList[index].volumeInfo!,
              );
            },
            separatorBuilder: (_, index) => const SizedBox(height: kSP15x,),);
        }

    );
  }
}
