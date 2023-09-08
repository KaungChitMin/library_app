import 'package:flutter/material.dart';
import 'package:library_book/bloc/search_page_bloc.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/utils/extensions.dart';
import 'package:library_book/view_items/search_page_view_item/search_default_ui_and_book_profile.dart';
import 'package:library_book/widgets/loading_widget.dart';
import 'package:library_book/widgets/search_bar_widget.dart';
import 'package:provider/provider.dart';

import '../data/vos/search_vo/items_vo/items_vo.dart';
import '../view_items/search_page_view_item/default_search_book_view.dart';
import '../view_items/search_page_view_item/search_book_and_default_ui_item_view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchPageBloc>(
      create: (_) => SearchPageBloc(),
      child: const Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBarItemView(),
            SizedBox(height: kSP20x),
            SearchBookListItemView()
          ],
        ),
      ),
    );
  }
}

class SearchBarItemView extends StatelessWidget {
  const SearchBarItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<SearchPageBloc, List<ItemsVO>?>(
      selector: (_, bloc) => bloc.getItemsList,
      builder: (_, itemList, __) => itemList == null
          ? const LoadingWidget()
          : SearchBarWidget(
              autoFocus: true,
              isEnable: true,
              onTap: () {},
              onChanged: (text) {
                context.getSearchPageBloc().saveQuery(text);
              },
            ),
    );
  }
}
