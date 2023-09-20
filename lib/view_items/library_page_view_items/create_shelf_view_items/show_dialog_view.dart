import 'package:flutter/material.dart';
import 'package:library_book/bloc/create_shelf.dart';
import 'package:library_book/constant/colors.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/widgets/easy_text_widget.dart';
import 'package:provider/provider.dart';

import '../../../constant/strings.dart';
import 'text_form_field_view.dart';

class ShowDialogInFloatingView extends StatelessWidget {
  const ShowDialogInFloatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kSP10x)),
                  child: SizedBox(
                    height: 160,
                    width: 300,
                    child: ChangeNotifierProvider<CreateShelfPageBloc>(
                        create: (_) => CreateShelfPageBloc(),
                        child: const TextFormFieldView()),
                  ),
                );
                // return
              });
        },
        label: const Row(
          children: [
            Icon(Icons.edit),
            EasyTextWidget(
              text: kCreateNewText,
              color: kSecondaryTextColor,
              fontWeight: FontWeight.bold,
            ),
          ],
        ));
  }
}
