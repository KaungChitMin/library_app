import 'package:flutter/material.dart';
import 'package:library_book/constant/hive_constant.dart';
import 'package:library_book/pages/search_page.dart';
import 'package:library_book/utils/extensions.dart';
import 'package:library_book/widgets/loading_widget.dart';
import 'package:provider/provider.dart';
import '../bloc/home_page_bloc.dart';
import '../data/vos/home_page_vo/results_vo/lists_vo/lists_vo.dart';
import '../view_items/home_page_view_items/main_title_and_image_view-item.dart';
import '../widgets/search_bar_widget.dart';

class HomesPage extends StatelessWidget {
  const HomesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomePageBloc(kPublishDate),
      child: Scaffold(
          body: Selector<HomePageBloc, List<ListsVO>?>(
              selector: (_, bloc) => bloc.getListsVoList,
              builder: (_, listVoList, __) => listVoList == null
                  ? const Center(
                child: LoadingWidget(),
              )
                  : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Search Bar Session
                  SearchBarWidget(
                      isEnable: true,
                      onTap: () {
                        context.navigateToNextScreen(
                            context, const SearchPage());
                      }),

                  ///All Books Session
                ],
              ))),
    );
  }
}
