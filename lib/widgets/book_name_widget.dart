import 'package:flutter/material.dart';
import 'package:library_book/constant/dimens.dart';

import 'easy_text_widget.dart';

class BookNameWidget extends StatelessWidget {
  const BookNameWidget({
    super.key,
    required this.bookName,
    this.fontSize = kBookNameDefaultFontSize,
  });

  final double fontSize;
  final String bookName;

  @override
  Widget build(BuildContext context) {
    return EasyTextWidget(
      text: bookName,
      fontSize: fontSize,
    );
  }
}
