import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bloc/search_page_bloc.dart';
import '../../constant/dimens.dart';
import '../../data/vos/search_vo/item_vo/item_vo.dart';
import '../../widgets/loading_widget.dart';
import 'book_image_and_name_view.dart';

class ShowSearchBooksItemView extends StatelessWidget {
  const ShowSearchBooksItemView({super.key, required this.itemsList});

  final List<ItemsVO> itemsList;

  @override
  Widget build(BuildContext context) {
    return Selector<SearchPageBloc, bool>(
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
                separatorBuilder: (_, index) => const SizedBox(height: kSP10x),
              ));
  }
}
