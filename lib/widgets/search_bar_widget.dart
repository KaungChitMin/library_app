import 'package:flutter/material.dart';
import 'package:library_book/constant/colors.dart';
import 'package:library_book/constant/dimens.dart';

import '../constant/strings.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget(
      {super.key, required this.isEnable, this.onChanged,required this.onTap});

  final bool isEnable;
  final Function(String)? onChanged;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        autofocus: false,
        enabled: isEnable,
        onChanged: onChanged,
        onTap: () => onTap(),
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
          hintStyle: const TextStyle(color: kPrimaryTextColor),
        ),
      ),
    );
  }
}
