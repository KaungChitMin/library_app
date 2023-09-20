import 'package:flutter/material.dart';
import 'package:library_book/utils/extensions.dart';

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
          color: kTealColor,
          text: kCancelText,
          height: kSP40x,
          textColor: kSecondaryTextColor,
          onPressed: () {
            context.navigateBack(context);
          },
        ),
        EasyButton(
          color: kTealColor,
          text: 'Ok',
          height: kSP40x,
          textColor: kPrimaryTextColor,
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
