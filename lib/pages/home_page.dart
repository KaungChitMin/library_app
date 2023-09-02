import 'package:flutter/material.dart';
import 'package:library_book/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

import '../bloc/home_page_bloc.dart';
import '../view_items/home_page_view_items/list_main_title_and_image_view-item.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomePageBloc('2023-03-12'),
      child: Scaffold(
        body: Consumer<HomePageBloc>(
          builder: (_, bloc, __) {
            return Column(children: [
              const SizedBox(
                height: 30,
              ),
              bloc.getListsVoList == null
                  ? const Center(child: LoadingWidget())
                  : Expanded(
                child: ListView.builder(
                  itemCount: bloc.getListsVoList!.length,
                  itemBuilder: (_, index) => MainTitleAndImageView(
                    listVo: bloc.getListsVoList![index],
                  ),
                ),
              ),
            ]);
          },
        ),
      ),
    );
  }
}
