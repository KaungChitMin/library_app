import 'package:flutter/material.dart';
import 'package:library_book/constant/colors.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/utils/bloc_extensions.dart';

import '../constant/strings.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required this.isEnable,
    this.onChanged,
    this.autoFocus = false,
    required this.controller,
  });

  final bool isEnable;
  final Function(String)? onChanged;

  //final Function(String)? onSubmitted;
  final bool autoFocus;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kSP45x,
      child: TextField(
        autofocus: autoFocus,
        enabled: isEnable,
        onChanged: (text) => onChanged!(text),
        controller: controller,
        // onSubmitted: (text) => onSubmitted!(text),
        onSubmitted: (text) {
          context.getSearchPageBloc().saveSearchHistory(text);
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
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
          hintStyle: const TextStyle(color: kGreyColor, fontSize: 13),
        ),
      ),
    );
  }
}
