// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:tag_play/core/utils/utils.dart';

void showPopDialog(
  BuildContext context, {
  Widget? sheetWidget,
  Color? barrierColor,
  bool barrierDismissible = true,
}) {
  showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierColor: barrierColor ?? BlackColors.black_500.withOpacity(0.5),
    builder: (BuildContext dialogContext) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24.h)),
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: 15.w),
        child: sheetWidget,
      );
    },
  );
}
