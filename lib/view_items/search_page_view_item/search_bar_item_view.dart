import 'package:flutter/material.dart';
import 'package:library_book/bloc/search_page_bloc.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/utils/bloc_extensions.dart';
import 'package:provider/provider.dart';

import '../../widgets/search_bar_widget.dart';

class SearchPageSearchBarItemView extends StatelessWidget {
  const SearchPageSearchBarItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: kSP15x,
        ),
        GestureDetector(
          onTap: () {
            context.navigateBack(context);
          },
          child: const Icon(Icons.chevron_left_outlined),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kSP20x,
            ),
            child: Selector<SearchPageBloc, String>(
                selector: (_, bloc) => bloc.getQuery,
                builder: (context, _, __) {
                  return SearchBarWidget(
                    autoFocus: true,
                    isEnable: true,
                    controller:
                        context.getSearchPageBloc().getTextEditingController,
                    onTap: () {},
                    onChanged: (text) {
                      context.getSearchPageBloc().searchText(text);
                    },
                  );
                }),
          ),
        ),
      ],
    );
  }
}
