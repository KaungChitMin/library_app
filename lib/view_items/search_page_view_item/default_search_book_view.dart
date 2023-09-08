import 'package:flutter/material.dart';
import 'package:library_book/bloc/search_page_bloc.dart';
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
  }) : super(key: key);
  final IconData? icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSP10x),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: kSP50x,
          ),
          EasyTextWidget(
            text: label,
            color: Colors.grey,
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
        selector: (_, bloc) => bloc.getSearchQueryList,
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
