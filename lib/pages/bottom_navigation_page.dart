import 'package:flutter/material.dart';
import 'package:library_book/utils/extensions.dart';
import 'package:provider/provider.dart';

import '../bloc/bottom_navigation_page_bloc.dart';
import '../constant/colors.dart';
import '../constant/strings.dart';
import '../utils/pages.dart';

class BottomNavigationPage extends StatelessWidget {
  const BottomNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BottomNavigationPageBloc(),
      child: Scaffold(
        body: Selector<BottomNavigationPageBloc, int>(
            selector: (_, selector) => selector.getIndex,
            builder: (_, index, __) =>
                IndexedStack(index: index, children: pages)),
        bottomNavigationBar: Selector<BottomNavigationPageBloc, int>(
            selector: (_, bloc) => bloc.getIndex,
            builder: (_, index, __) => BottomNavigationView(
                  index: index,
                )),
      ),
    );
  }
}


///
class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      selectedItemColor: kTealColor,
      unselectedItemColor: kPrimaryTextColor,
      onTap: (index) => context.getBottomNavigationPageBloc().pageChange(index),
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: kHomeIconText),
        BottomNavigationBarItem(
            icon: Icon(Icons.library_books), label: kLibraryTitle),
      ],
    );
  }
}
