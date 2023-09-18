import 'package:flutter/material.dart';

import '../../constant/dimens.dart';
import '../../constant/strings.dart';
import 'cancel_and_ok_button_view.dart';

class TextFormFieldView extends StatefulWidget {
  const TextFormFieldView({super.key});

  @override
  State<TextFormFieldView> createState() => _TextFormFieldViewState();
}

class _TextFormFieldViewState extends State<TextFormFieldView> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _globalKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSP10x),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: kSP20x),
                TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: kEnterShelfName,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey)),
                    contentPadding: EdgeInsets.symmetric(vertical: kSP15x),
                  ),
                  validator: (text) {
                    if (text!.isEmpty) {
                      return (kShelfIsEmpty);
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
          )),
    );
  }
}
