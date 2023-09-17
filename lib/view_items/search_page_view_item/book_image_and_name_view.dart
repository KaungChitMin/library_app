import 'package:flutter/material.dart';
import 'package:library_book/widgets/easy_image_widget.dart';

import '../../data/vos/search_vo/items_vo/volume_info_vo.dart';

// class VerticalSearchBookScrollView extends StatelessWidget {
//   const VerticalSearchBookScrollView({super.key, required this.itemList});
//
//   final List<ItemsVO> itemList;
//
//   @override
//   Widget build(BuildContext context) {
//     return Selector<SearchPageBloc, bool>(
//         selector: (_, bloc) => bloc.getIsSearching,
//         builder: (_, isSearching, __) => (isSearching)
//             ? const LoadingWidget()
//             : ListView.separated(
//                 itemCount: itemList.length,
//                 scrollDirection: Axis.vertical,
//                 itemBuilder: (_, index) {
//                   return BookImageAndNameView(
//                     volumeInfoVO: itemList[index].volumeInfo!,
//                   );
//                 },
//                 separatorBuilder: (_, index) => const SizedBox(height: kSP10x),
//               ));
//   }
// }

class BookImageAndNameView extends StatelessWidget {
  const BookImageAndNameView({super.key, required this.volumeInfoVO});

  final VolumeInfoVO volumeInfoVO;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
        width: 50,
        child: EasyImageWidget(
          imageUrl: volumeInfoVO.imageLinks?.thumbnail ?? '',
          fit: BoxFit.fitHeight,
        ));
  }
}
