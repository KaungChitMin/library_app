import 'package:flutter/material.dart';
import 'package:library_book/utils/bloc_extensions.dart';

import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/strings.dart';
import '../../../widgets/easy_button_widget.dart';

class CancelAndOkButton extends StatelessWidget {
  const CancelAndOkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        EasyButton(
          color: kCyanColor,
          text: kCancelText,
          height: kSP35x,
          textColor: kWhiteColor,
          onPressed: () {
            context.navigateBack(context);
          },
        ),
        EasyButton(
          color: kCyanColor,
          text: kOkText,
          height: kSP35x,
          textColor: kWhiteColor,
          onPressed: () {
            if (context
                    .getCreateShelfPageBloc()
                    .getGlobalKey
                    .currentState
                    ?.validate() ??
                false) {
              context.getCreateShelfPageBloc().createShelfText();
              context.navigateBack(context);
            }
          },
        ),
      ],
    );
  }
}
