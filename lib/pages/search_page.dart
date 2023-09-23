import 'package:flutter/material.dart';
import 'package:library_book/bloc/search_page_bloc.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/view_items/search_page_view_item/search_book_list_item_view.dart';
import 'package:provider/provider.dart';

import '../view_items/search_page_view_item/search_bar_item_view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchPageBloc>(
      create: (_) => SearchPageBloc(),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),

            ///Search Bar Session
            const SearchPageSearchBarItemView(),
            const SizedBox(height: kSP20x),

            ///Show Search Query And Search Books Session
            const Expanded(child: ShowSearchBooksView()),
          ],
        ),
      ),
    );
  }
}
