import 'package:flutter/material.dart';
import 'package:library_book/utils/bloc_extensions.dart';
import 'package:library_book/widgets/easy_text_widget.dart';

import '../constant/strings.dart';

class ShowShelfBooksPage extends StatelessWidget {
  const ShowShelfBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const EasyTextWidget(
          text: kShelfBooksText,
        ),
        leading: GestureDetector(
          onTap: () {
            context.navigateBack(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),

      body: const SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EasyTextWidget(text: ''),
          ],
        ),
      )
    );
  }
}
