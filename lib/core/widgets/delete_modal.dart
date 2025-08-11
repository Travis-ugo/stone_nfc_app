import 'package:tag_play/core/utils/utils.dart';
import 'package:tag_play/core/widgets/core_widgets.dart'; 

class DeleteModal extends StatelessWidget {
  const DeleteModal({
    super.key,
    this.iconPath,
    this.modalHeight,
    required this.title,
    required this.subtitle,
    required this.onDelete,
  });

  final String title;
  final String subtitle;
  final VoidCallback onDelete;
  final double? modalHeight;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    return ModalSheetWidget(
      title: title,
      subTitle: subtitle,
      showSVG: false,
      bottomWidget: Row(
        children: [
          Expanded(
            child: PrimaryButton(
              buttonTitle: 'Cancel',
              filledColor: WhiteColors.white_50,
              textColor: GreyColors.grey_500,
              fontWeight: FontWeightMade.medium,
              borderSide: const BorderSide(color: GreyColors.grey_700),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          HSpaceWidget(width: 20.w),
          Expanded(
            child: PrimaryButton(
              buttonTitle: 'Delete',
              filledColor: RedColors.red_500,
              textColor: WhiteColors.white_50,
              fontWeight: FontWeightMade.medium,
              onTap: onDelete,
            ),
          ),
        ],
      ),
      showPrimaryButton: false,
      iconChild: EditableBox(
        height: rSize(64.w, 124.h),
        width: rSize(64.w, 124.h),
        borderRadius: 134.r,
        color: RedColors.red_500,
        child: Center(
          child: SvgPicture.asset(
            iconPath ?? 'assets/icons/trash-line.svg',
            color: WhiteColors.white_50,
            height: rSize(24.h, 70.h),
          ),
        ),
      ),
      primaryColor: RedColors.red_500,
      modalHeight: modalHeight ?? 362.h,
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }
}
