import 'package:flutter/material.dart';
import 'package:library_book/widgets/search_bar_widget.dart';

import '../constant/colors.dart';
import '../constant/strings.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///Enable Search Bar Session
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          SearchBarWidget(isEnable: false, onTap: () {}),

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

        ],
      ),
    ));
  }
}
