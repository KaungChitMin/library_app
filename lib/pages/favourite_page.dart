import 'package:flutter/material.dart';
import 'package:library_book/bloc/favourite_page_bloc.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/data/vos/home_page_vo/results_vo/lists_vo/lists_vo.dart';
import 'package:library_book/pages/shelf_page.dart';
import 'package:library_book/view_items/home_page_view_items/main_title_and_image_view_item.dart';
import 'package:library_book/widgets/easy_text_widget.dart';
import 'package:library_book/widgets/search_bar_widget.dart';
import 'package:provider/provider.dart';

import '../constant/colors.dart';
import '../constant/strings.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FavouritePageBloc(),
      child: Scaffold(
          body: DefaultTabController(
        length: 2,
        child: Consumer<FavouritePageBloc>(
          builder: (_, bloc, __) => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Enable Search Bar Session
              SearchBarWidget(isEnable: false, onTap: () {}),
              const SizedBox(height: kSP20x),

              ///Library's Tab Bar Session
              const TabBar(
                unselectedLabelColor: kGreyColor,
                labelColor: kTealColor,
                tabs: [
                  Tab(
                    text: kYourBooksText,
                  ),
                  Tab(
                    text: kYourShelfText,
                  ),
                ],
              ),

              ///Your Books Session
              ShowFavouriteBooksItemView(
                listsVOList: bloc.getFavouriteList!,
              )
            ],
          ),
        ),
      )),
    );
  }
}

class ShowFavouriteBooksItemView extends StatelessWidget {
  const ShowFavouriteBooksItemView({super.key, required this.listsVOList});

  final List<ListsVO> listsVOList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(children: [
        Stack(
          children: [
            ListView.builder(
                itemCount: listsVOList.length,
                itemBuilder: (_, index) {
                  return Visibility(
                    visible: listsVOList[index]
                        .books!
                        .any((e) => e.isSelected == true),
                    child: MainTitleAndImageView(
                      isHomeScreen: false,
                      listVo: listsVOList[index],
                    ),
                  );
                }),
            Visibility(
                visible: listsVOList.every((element) =>
                    element.books!.every((e) => !(e.isSelected ?? false))),
                child: const Center(child: EasyTextWidget(text: kNoBooksText)))
          ],
        ),
        const ShelfPage(),
      ]),
    );
  }
}
