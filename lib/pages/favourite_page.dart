import 'package:flutter/material.dart';
import 'package:library_book/bloc/home_page_bloc.dart';
import 'package:library_book/bloc/search_page_bloc.dart';
import 'package:library_book/constant/hive_constant.dart';
import 'package:library_book/widgets/search_bar_widget.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchPageBloc(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBarWidget(isEnable: false, onTap: () {}),



            ],
          ),
        ),
      ),
    );
  }
}
