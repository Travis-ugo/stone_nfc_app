import 'package:tag_play/core/utils/sheets/show_reiv9_bottom_sheet.dart';
import 'package:tag_play/core/utils/utils.dart';
import 'package:tag_play/core/widgets/core_widgets.dart';

void showSuccessModal({
  required BuildContext context,
  required String title,
  required String subtitle,
  required String iconPath,
  required Color color,
  double? modalHeight,
  VoidCallback? onTap,
}) {
  bool isTablet = DeviceUtils.isTablet(context);

  if (isTablet) {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            child: ModalSheetWidget(
              title: title,
              subTitle: subtitle,
              showSVG: false,
              bottomWidget: PrimaryButton(
                buttonTitle: 'Ok',
                filledColor: WhiteColors.white_50,
                textColor: GreyColors.grey_500,
                fontWeight: FontWeightMade.medium,
                borderSide: const BorderSide(color: GreyColors.grey_700),
                onTap:
                    onTap ??
                    () {
                      Navigator.pop(context);
                    },
              ),
              showPrimaryButton: false,
              iconChild: EditableBox(
                height: 64.h,
                width: 64.w,
                borderRadius: 64.r,
                color: GreenColors.green_500,
                child: Center(
                  child: SvgPicture.asset(
                    iconPath,
                    color: WhiteColors.white_50,
                    height: 32.h,
                  ),
                ),
              ),
              primaryColor: color,
              modalHeight: modalHeight ?? 345.h,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          );
        },
      ),
    );
    return;
  }

  showTagPlayBottomSheet(
    context: context,
    child: ModalSheetWidget(
      title: title,
      subTitle: subtitle,
      showSVG: false,
      bottomWidget: PrimaryButton(
        buttonTitle: 'Ok',
        filledColor: WhiteColors.white_50,
        textColor: GreyColors.grey_500,
        fontWeight: FontWeightMade.medium,
        borderSide: const BorderSide(color: GreyColors.grey_700),
        onTap:
            onTap ??
            () {
              Navigator.pop(context);
            },
      ),
      showPrimaryButton: false,
      iconChild: EditableBox(
        height: 64.h,
        width: 64.w,
        borderRadius: 34.r,
        color: GreenColors.green_500,
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            color: WhiteColors.white_50,
            height: 32.h,
          ),
        ),
      ),
      primaryColor: color,
      modalHeight: modalHeight ?? 345.h,
      onTap: () {
        Navigator.of(context).pop();
      },
    ),
  );
}
