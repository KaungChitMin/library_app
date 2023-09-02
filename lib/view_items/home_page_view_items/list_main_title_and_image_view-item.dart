import 'package:flutter/material.dart';
import 'package:library_book/widgets/easy_text_widget.dart';

import '../../data/vos/home_page_vo/results_vo/lists_vo.dart';
import 'books_list_view.dart';

class MainTitleAndImageView extends StatelessWidget {
  const MainTitleAndImageView({super.key, required this.listVo});

  final ListsVO listVo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EasyTextWidget(
            text: listVo.listName ?? '',
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          BooksListView(
            bookList: listVo.books ?? [],
          ),
        ],
      ),
    );
  }
}
