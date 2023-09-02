import 'package:flutter/material.dart';
import 'package:library_book/bloc/bottom_navigation_page_bloc.dart';
import 'package:library_book/bloc/home_page_bloc.dart';
import 'package:provider/provider.dart';

extension E on BuildContext {
  Future navigateToNextScreen(BuildContext context, Widget nextScreen) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => nextScreen));

  void navigateBack(BuildContext context) => Navigator.of(context).pop();

  BottomNavigationPageBloc getBottomNavigationPageBloc() => read<BottomNavigationPageBloc>();
  HomePageBloc getHomePageBloc()=> read<HomePageBloc>();

}
