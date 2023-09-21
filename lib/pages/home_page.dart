import 'package:flutter/material.dart';
import 'package:library_book/constant/hive_constant.dart';
import 'package:library_book/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

import '../bloc/home_page_bloc.dart';
import '../view_items/home_page_view_items/search_bar_navigate_view_item.dart';
import '../view_items/home_page_view_items/vertical_books_view_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => HomePageBloc(kPublishDate),
        child: Scaffold(
          body: Consumer<HomePageBloc>(
              builder: (_, bloc, __) => (bloc.getListsVoList == null)
                  ? const Center(
                      child: LoadingWidget(),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///Search Bar Session
                        const HonePageSearchBarViewItem(),

                        ///All Books Session
                        VerticalBooksListViewItem(
                          listsVOList: bloc.getListsVoList!,
                        ),
                      ],
                    )),
        ));
  }
}
