import 'package:flutter/material.dart';

import '../../data/vos/home_page_vo/results_vo/lists_vo/lists_vo.dart';
import 'main_title_and_image_view_item.dart';

class VerticalBooksListViewItem extends StatelessWidget {
  const VerticalBooksListViewItem({
    super.key,
    required this.listsVOList,
  });

  final List<ListsVO> listsVOList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: listsVOList.length,
        itemBuilder: (_, index) => MainTitleAndImageView(
          listVo: listsVOList[index],
          isHomeScreen: true,
        ),
      ),
    );
  }
}
