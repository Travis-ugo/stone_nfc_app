import 'package:tag_play/core/core.dart';
import 'package:tag_play/core/utils/sheets/show_reiv9_bottom_sheet.dart';
import 'package:tag_play/core/widgets/delete_modal.dart';

void showDeleteModal({
  required BuildContext context,
  required String title,
  required String subtitle,
  required VoidCallback onDelete,
  double? modalHeight,
  String? iconPath,
}) {
  showTagPlayBottomSheet(
    context: context,
    child: DeleteModal(
      title: title,
      subtitle: subtitle,
      onDelete: onDelete,
      modalHeight: modalHeight,
      iconPath: iconPath,
    ),
  );
}
