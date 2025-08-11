
import 'package:tag_play/core/core.dart';
import 'package:tag_play/core/utils/sheets/show_pop_dialog.dart';
import 'package:tag_play/core/utils/sheets/show_reiv9_bottom_sheet.dart';

void showPopOrModalSheet({
  required bool isTablet,
  required BuildContext context,
  bool isDismissible = false,
  required Widget dialogPop,
  required Widget modalSheet,
}) {
  isTablet
      ? showPopDialog(
        context,
        sheetWidget: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 700.w, maxWidth: 750.w),
          child: dialogPop,
        ),
      )
      : showTagPlayBottomSheet(context: context, child: modalSheet);
}
