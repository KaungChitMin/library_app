import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../constant/dimens.dart';
import '../../data/vos/search_vo/item_vo/volume_info/volume_info.dart';
import '../../widgets/easy_image_widget.dart';
import '../../widgets/easy_text_widget.dart';

class SearchListViewItem extends StatelessWidget {
  const SearchListViewItem({
    Key? key,
    required this.volumeInfoVO,
  }) : super(key: key);

  final VolumeInfoVO volumeInfoVO;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(kSP10x),
        child: GestureDetector(
          onTap: () {},
          child: ListTileBooksTitleAndNameView(
            leading: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(kSP15x)),
              child: EasyImageWidget(
                height: 100,
                imageUrl: volumeInfoVO.imageLinks?.thumbnail ?? '',
              ),
            ),
            title: volumeInfoVO.title ?? '',
            subTitle: volumeInfoVO.printType ?? '',
          ),
        ));
  }
}

class ListTileBooksTitleAndNameView extends StatelessWidget {
  const ListTileBooksTitleAndNameView(
      {Key? key,
      required this.leading,
      required this.title,
      required this.subTitle})
      : super(key: key);

  final Widget leading;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        leading,
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EasyTextWidget(text: title),
              const SizedBox(
                height: 10,
              ),
              EasyTextWidget(
                text: subTitle,
                color: kBlackColor,
              )
            ],
          ),
        )
      ],
    );
  }
}
