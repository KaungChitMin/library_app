import 'package:flutter/material.dart';
import 'package:library_book/constant/dimens.dart';

import '../../../constant/colors.dart';
import '../../../constant/strings.dart';
import '../../../widgets/easy_text_widget.dart';

class EmptyShelfView extends StatelessWidget {
  const EmptyShelfView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(
            height: kSP205x,
          ),
          Icon(
            Icons.library_add,
            size: kLibraryAddIconHeight,
            color: kGreyColor,
          ),
          SizedBox(
            height: kSP10x,
          ),
          EasyTextWidget(
            text: kBooksEmptyText,
            color: kGreyColor,
          )
        ],
      ),
    );
  }
}
