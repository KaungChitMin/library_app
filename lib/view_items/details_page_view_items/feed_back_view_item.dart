import 'package:flutter/material.dart';
import 'package:library_book/constant/colors.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/view_items/search_page_view_item/default_search_book_view.dart';

import '../../constant/strings.dart';

class FeedBackItemView extends StatelessWidget {
  const FeedBackItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: kCyanColor,
            borderRadius: BorderRadius.all(Radius.circular(kSP15x))),
        child: const SearchView(
          label: kFeedBackText,
          fontSize: 15,
          color: kWhiteColor,
          icon: Icons.message,
          iconColor: kWhiteColor,
        ));
  }
}
