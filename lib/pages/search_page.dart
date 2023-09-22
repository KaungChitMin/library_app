// import 'package:flutter/material.dart';
// import 'package:library_book/bloc/search_page_bloc.dart';
// import 'package:library_book/constant/dimens.dart';
// import 'package:library_book/view_items/search_page_view_item/search_book_list_item_view.dart';
// import 'package:provider/provider.dart';
//
// import '../view_items/search_page_view_item/search_bar_item_view.dart';
//
// class SearchPage extends StatelessWidget {
//   const SearchPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<SearchPageBloc>(
//       create: (_) => SearchPageBloc(),
//       child: Scaffold(
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.07,
//             ),
//
//             ///Search Bar Session
//             const SearchPageSearchBarItemView(),
//             const SizedBox(height: kSP20x),
//
//             ///Show Search Query And Search Books Session
//             const Expanded(child: ShowSearchBooksView()),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:library_book/bloc/search_page_bloc.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/utils/bloc_extensions.dart';
import 'package:library_book/view_items/search_page_view_item/default_search_book_view.dart';
import 'package:library_book/view_items/search_page_view_item/search_book_list_item_view.dart';
import 'package:provider/provider.dart';

import '../data/vos/search_vo/item_vo/item_vo.dart';
import '../view_items/search_page_view_item/search_bar_item_view.dart';
import '../widgets/loading_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchPageBloc(),
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: kSP30x,
            ),
            const SearchItemView(),
            Selector<SearchPageBloc, List<ItemsVO>?>(
              selector: (_, selector) => selector.getItemList,
              builder: (_, itemList, __) =>
                  Expanded(child: SearchListView(itemsList: itemList ?? [])),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchListView extends StatelessWidget {
  const SearchListView({Key? key, required this.itemsList}) : super(key: key);

  final List<ItemsVO> itemsList;

  @override
  Widget build(BuildContext context) {
    return (itemsList.isEmpty)
        ? Selector<SearchPageBloc, List<String>?>(
            selector: (_, selector) => selector.getSearchHistoryList,
            builder: (_, searchHistory, __) {
              if (searchHistory == null) {
                return const DefaultSearchView();
              }
              if (searchHistory.isEmpty) {
                return const DefaultSearchView();
              }
              return ListView(
                children: [
                  Column(
                    children: searchHistory
                        .map((e) => GestureDetector(
                            onTap: () =>
                                context.getSearchPageBloc().searchByHistory(e),
                            child: SearchView(icon: Icons.history, label: e)))
                        .toList()
                        .reversed
                        .toList(),
                  ),
                  const DefaultSearchView(),
                ],
              );
            })
        : Selector<SearchPageBloc, bool>(
        selector: (_, bloc) => bloc.getIsSearching,
        builder: (_, isSearching, __) => isSearching
            ? const LoadingWidget()
            : ListView.separated(
          itemCount: itemsList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (_, index) {
            return SearchListViewItem(
              volumeInfoVO: itemsList[index].volumeInfo!,
            );
          },
          separatorBuilder: (_, index) =>
          const SizedBox(height: kSP10x),
        ));
  }
}
