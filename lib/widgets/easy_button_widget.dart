import 'package:flutter/material.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/widgets/easy_text_widget.dart';

class EasyButton extends StatelessWidget {
  const EasyButton(
      {Key? key,
      required this.color,
      required this.text,
      required this.height,
      required this.textColor,
      this.width = 0,
      required this.onPressed})
      : super(key: key);

  final Color color;
  final double height;
  final String text;
  final Color textColor;
  final double width;
  final Function onPressed;


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onPressed(),
      height: height,
      minWidth: width,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kSP10x)),
      child: EasyTextWidget(
        text: text,
        color: textColor,
        fontSize: 13,

      ),
    );
  }
}
