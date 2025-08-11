import 'package:tag_play/core/core.dart';

void showTagPlayBottomSheet({
  required BuildContext context,
  required Widget child,
  bool isDismissible = true,
  Color backgroundColor = WhiteColors.white_50,
  BorderRadiusGeometry? borderRadius,
  Color? barrierColor,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: isDismissible,
    shape: RoundedRectangleBorder(
      borderRadius:borderRadius ?? BorderRadius.only(
        topLeft: Radius.circular(10.r),
        topRight: Radius.circular(10.r),
      ),
    ),
    backgroundColor: backgroundColor,
    barrierColor: barrierColor ?? BlackColors.black_500.withOpacity(0.5),
    builder: (build) {
      return child;
    },
  );
}
