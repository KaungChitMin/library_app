import 'package:flutter/material.dart';
import 'package:library_book/utils/bloc_extensions.dart';

import '../../constant/colors.dart';
import '../../constant/dimens.dart';
import '../../constant/strings.dart';
import '../../pages/search_page.dart';
import '../../widgets/easy_text_widget.dart';

class HonePageSearchBarViewItem extends StatelessWidget {
  const HonePageSearchBarViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: kSP40x, left: kSP20x, right: kSP20x),
      height: kSP50x,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(kSP15x)),
          border: Border.all(color: kCyanColor)),
      child: Row(
        children: [
          const SizedBox(
            width: kSP10x,
          ),
          const Icon(
            Icons.search,
          ),
          const SizedBox(
            width: kSP15x,
          ),
          GestureDetector(
              onTap: () {
                context.navigateToNextScreen(context, const SearchPage());
              },
              child: const EasyTextWidget(
                text: kSearchText,
              )),
          const Spacer(),
          const CircleAvatar(
              radius: kSP15x,
              backgroundColor: kCyanColor,
              child: EasyTextWidget(
                text: "S",
                color: kWhiteColor,
              )),
          const SizedBox(
            width: kSP10x,
          )
        ],
      ),
    );
  }
}
