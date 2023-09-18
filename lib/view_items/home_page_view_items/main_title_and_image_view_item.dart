import 'package:flutter/material.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/widgets/easy_text_widget.dart';
import '../../data/vos/home_page_vo/results_vo/lists_vo/lists_vo.dart';
import 'books_list_view.dart';

class MainTitleAndImageView extends StatelessWidget {
  const MainTitleAndImageView(
      {super.key, required this.listVo, required this.isHomeScreen});

  final ListsVO listVo;
  final bool isHomeScreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSP15x),
      child: SizedBox(
        height: kMainTitleAndImageHeight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Book's Main Title
            EasyTextWidget(
              text: listVo.listName ?? '',
              fontWeight: FontWeight.w700,
              fontSize: kFontSize20x,
            ),
            const SizedBox(
              height: kSP20x,
            ),

            ///Book's Profile Session
            HorizontalBookImageAndNameView(
              mainTitle: listVo.listName ?? '',
              bookList: listVo.books ?? [],
              isHomeScreen: isHomeScreen,
            )
          ],
        ),
      ),
    );
  }
}
