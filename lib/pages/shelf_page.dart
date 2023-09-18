import 'package:flutter/material.dart';
import 'package:library_book/constant/colors.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/widgets/easy_text_widget.dart';

import '../constant/strings.dart';
import '../view_items/create_shelf_view_items/text_form_field_view.dart';

class ShelfPage extends StatelessWidget {
  const ShelfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FloatingActionButton.extended(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                        child: Container(
                      height: 140,
                      width: 400,
                      decoration: const BoxDecoration(
                          color: kTealColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(kSP10x))),
                      child: const TextFormFieldView(),
                    ));
                  });
            },
            label: const Row(
              children: [
                Icon(Icons.edit),
                EasyTextWidget(
                  text: kCreateNew,
                  color: kSecondaryTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ],
            )));
  }
}
