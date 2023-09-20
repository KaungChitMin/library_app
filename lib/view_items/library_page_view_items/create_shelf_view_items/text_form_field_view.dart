import 'package:flutter/material.dart';
import 'package:library_book/bloc/create_shelf.dart';
import 'package:library_book/utils/extensions.dart';
import 'package:provider/provider.dart';

import '../../../constant/dimens.dart';
import '../../../constant/strings.dart';
import 'cancel_and_ok_button_view.dart';

class TextFormFieldView extends StatelessWidget {
  const TextFormFieldView({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.getCreateShelfPageBloc().getGlobalKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSP10x),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: kSP20x),
              TextFormField(
                controller: context.getCreateShelfPageBloc().getTextEditingController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: kEnterShelfNameText,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey)),
                  contentPadding: EdgeInsets.symmetric(vertical: kSP15x),
                ),
                validator: (text) {
                  if (text!.isEmpty) {
                    return (kShelfIsEmptyText);
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: kSP20x,
              ),
              const CancelAndOkButton(),
            ],
          ),
        ));
  }
}

