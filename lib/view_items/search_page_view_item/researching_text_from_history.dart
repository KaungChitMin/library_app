import 'package:flutter/material.dart';
import 'package:library_book/utils/bloc_extensions.dart';
import 'package:provider/provider.dart';

import '../../bloc/search_page_bloc.dart';
import '../../constant/strings.dart';
import '../../widgets/easy_text_widget.dart';
import 'default_search_book_view.dart';

class ResearchTextFromHistoryItemView extends StatelessWidget {
  const ResearchTextFromHistoryItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<SearchPageBloc, List<String>?>(
        selector: (_, bloc) => bloc.getSearchHistoryList,
        builder: (_, historyList, __) {
          if (historyList == null) {
            return const EasyTextWidget(text: kNoDataText);
          }
          if (historyList.isEmpty) {
            return const DefaultSearchView();
          }
          return ListView(children: [
            Column(
              children: historyList
                  .map((text) => GestureDetector(
                        onTap: () => context
                            .getSearchPageBloc()
                            .addQueryToSearchHistoryList(text),
                        child: SearchView(
                          icon: Icons.history,
                          label: text,
                        ),
                      ))
                  .toList()
                  .reversed
                  .toList(),
            ),
            const DefaultSearchView(),
          ]);
        });
  }
}
