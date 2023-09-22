import 'package:flutter/material.dart';
import 'package:library_book/bloc/search_page_bloc.dart';
import 'package:library_book/constant/colors.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/widgets/easy_text_widget.dart';
import 'package:provider/provider.dart';

class DefaultSearchView extends StatelessWidget {
  const DefaultSearchView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchView(
          icon: Icons.add,
          label: 'Top Selling',
        ),
        SearchView(
          icon: Icons.notification_add,
          label: 'New Release',
        ),
        SearchView(
          icon: Icons.add_business,
          label: 'BookShop',
        ),
      ],
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({
    Key? key,
    this.icon,
    required this.label,
    this.color = kGreyColor,
    this.fontSize = kDefaultFontSize,
    this.iconColor = kBlackColor,
  }) : super(key: key);
  final IconData? icon;
  final String label;
  final Color color;
  final Color iconColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSP10x),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          const SizedBox(
            width: kSP30x,
          ),
          EasyTextWidget(
            text: label,
            color: color,
            fontSize: fontSize,
          )
        ],
      ),
    );
  }
}

class AddSearchHistory extends StatelessWidget {
  const AddSearchHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<SearchPageBloc, List<String>?>(
        selector: (_, bloc) => bloc.getSearchHistoryList,
        builder: (_, list, __) => list == null
            ? const DefaultSearchView()
            : ListView.builder(
                itemCount: list.length,
                itemBuilder: (_, index) {
                  return SearchView(
                    label: list[index],
                  );
                },
              ));
  }
}
