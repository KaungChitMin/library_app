import 'package:flutter/material.dart';
import 'package:library_book/bloc/search_page_bloc.dart';
import 'package:library_book/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

import '../../data/vos/search_vo/items_vo/items_vo.dart';
import 'search_book_scroll_view.dart';

class SearchPageBookAndDefaultUiView extends StatelessWidget {
  const SearchPageBookAndDefaultUiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Selector<SearchPageBloc, List<ItemsVO>?>(
        selector: (_, bloc) => bloc.getItemsList,
        builder: (_, itemList, __) {
          if (itemList == null && itemList!.isEmpty) {
            return const Center(
              child: LoadingWidget(),
            );
          }
          return VerticalSearchBookScrollView(itemList: itemList);
        },
      ),
    );
  }
}
