import 'package:flutter/material.dart';
import 'package:library_book/utils/extensions.dart';

import '../../widgets/search_bar_widget.dart';

class SearchBarItemView extends StatelessWidget {
  const SearchBarItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBarWidget(
      autoFocus: true,
      isEnable: true,
      onTap: () {},
      onChanged: (text) {
        context.getSearchPageBloc().saveQuery(text);
      },
    );
  }
}
