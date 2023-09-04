import 'package:flutter/material.dart';
import 'package:library_book/widgets/easy_text_widget.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: EasyTextWidget(text: 'Library Page',),
    );
  }
}
