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

class ShowSearchBooksView extends StatelessWidget {
  const ShowSearchBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<SearchPageBloc, List<ItemsVO>?>(
        selector: (_, bloc) => bloc.getItemList,
        builder: (_, itemsList, __) =>
            //     (itemsList != null && itemsList.isEmpty)
            //         ? Selector(
            //       selector: selector
            //         builder: builder,
            //         )
            // );
            ShowSearchHistoryView(
              itemsList: itemsList ?? [],
            ));
  }
}

class ShowSearchHistoryView extends StatelessWidget {
  const ShowSearchHistoryView({super.key, required this.itemsList});

  final List<ItemsVO> itemsList;

  @override
  Widget build(BuildContext context) => (itemsList.isEmpty)
      ? Selector<SearchPageBloc, List<String>?>(
          selector: (_, bloc) => bloc.getSearchHistoryList,
          builder: (_, historyList, __) {
            if (historyList == null) {
              return const EasyTextWidget(text: kNoDataText);
            }
            if (historyList.isEmpty) {
              return const DefaultSearchView();
            }
            return ListView(children: [
              Column(
                children: historyList
                    .map((text) => GestureDetector(
                          onTap: () =>
                            context.getSearchPageBloc().searchByHistory(text),
                          child: SearchView(
                            icon: Icons.history,
                            label: text,
                          ),
                        ))
                    .toList()
                    .reversed
                    .toList(),
              ),
              const DefaultSearchView(),
            ]);
          })
      : Selector<SearchPageBloc, bool>(
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
                  separatorBuilder: (_, index) =>
                      const SizedBox(height: kSP10x),
                ));
}

// class IsSearchingBooksView extends StatelessWidget {
//   const IsSearchingBooksView({super.key, required this.itemsList});
//
//   final List<ItemsVO> itemsList;
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

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
          child: ListTileFake(
            leading: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(kSP15x)),
              child: EasyImageWidget(
                height: 160,
                imageUrl: volumeInfoVO.imageLinks?.thumbnail ?? '',
              ),
            ),
            title: volumeInfoVO.title ?? '',
            subTitle: volumeInfoVO.printType ?? '',
          ),
        ));
  }
}

class ListTileFake extends StatelessWidget {
  const ListTileFake(
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
