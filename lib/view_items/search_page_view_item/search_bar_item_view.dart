import 'package:flutter/material.dart';
import 'package:library_book/bloc/search_page_bloc.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/utils/bloc_extensions.dart';
import 'package:provider/provider.dart';

import '../../constant/colors.dart';
import '../../constant/strings.dart';
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
                    onSubmitted: (text) {
                      context.getSearchPageBloc().saveHistory(text);
                    },
                    controller:
                        context.getSearchPageBloc().getSearchEditingController,
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

class SearchItemView extends StatelessWidget {
  const SearchItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: kSP10x,
        ),
        GestureDetector(
            onTap: () {
              context.navigateBack(context);
            },
            child: const Icon(Icons.chevron_left)),
        Expanded(
          child: Selector<SearchPageBloc, String>(
            selector: (_, selector) => selector.getQuery,
            builder: (_, history, __) => SearchMovieWidget(
              isAutoFocus: true,
              isEnable: true,
              onChange: (text) => context.getSearchPageBloc().searchText(text),
              controller:
                  context.getSearchPageBloc().getSearchEditingController,
            ),
          ),
        ),
      ],
    );
  }
}

class SearchMovieWidget extends StatelessWidget {
  const SearchMovieWidget(
      {super.key,
      this.isEnable = false,
      this.isAutoFocus = false,
      this.onChange,
      required this.controller});

  final bool isEnable;
  final bool isAutoFocus;
  final Function(String)? onChange;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSP10x),
      child: TextField(
        onChanged: (text) => onChange!(text),
        autofocus: isAutoFocus,
        enabled: isEnable,
        controller: controller,
        onSubmitted: (text) => context.getSearchPageBloc().saveHistory(text),
        decoration: const InputDecoration(
          filled: true,
          hintText: kSearchText,
          hintStyle: TextStyle(color: kGreyColor),
          suffixIcon: Icon(Icons.keyboard_voice),
        ),
      ),
    );
  }
}
