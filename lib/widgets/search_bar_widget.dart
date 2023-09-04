import 'package:flutter/material.dart';
import 'package:library_book/constant/colors.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/widgets/easy_text_widget.dart';

import '../constant/strings.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget(
      {super.key, required this.isEnable, required this.onChanged});

  final bool isEnable;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        autofocus: false,
        enabled: isEnable,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search,color: Colors.grey,),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kSP20x),
              borderSide: const BorderSide(
                color: Colors.grey,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kSP20x),
              borderSide: const BorderSide(
                color: Colors.grey,
              )),
          hintText: kSearchText,
          hintStyle: const TextStyle(color: kPrimaryTextColor),
        ),
      ),
    );
  }
}
