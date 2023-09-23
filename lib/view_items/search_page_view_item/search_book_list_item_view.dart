import 'package:flutter/material.dart';
import 'package:library_book/bloc/search_page_bloc.dart';
import 'package:library_book/constant/colors.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/utils/bloc_extensions.dart';
import 'package:library_book/widgets/easy_image_widget.dart';
import 'package:library_book/widgets/easy_text_widget.dart';
import 'package:library_book/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

import '../../constant/strings.dart';
import '../../data/vos/search_vo/item_vo/item_vo.dart';
import '../../data/vos/search_vo/item_vo/volume_info/volume_info.dart';
import 'default_search_book_view.dart';
import 'researching_text_from_history.dart';
import 'show_search_books_.dart';

class ShowSearchBooksView extends StatelessWidget {
  const ShowSearchBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<SearchPageBloc, List<ItemsVO>?>(
        selector: (_, bloc) => bloc.getItemsList,
        builder: (_, itemsList, __) => (itemsList != null && itemsList.isEmpty)
            ? const ResearchTextFromHistoryItemView()
            : ShowSearchBooksItemView(
                itemsList: itemsList ?? [],
              ));
  }
}


