 

import 'package:tag_play/core/utils/utils.dart';
import 'package:tag_play/core/widgets/core_widgets.dart';

class ModalSheetWidget extends StatelessWidget {
  const ModalSheetWidget({
    super.key,
    this.width,
    this.bottomWidget,
    required this.title,
    required this.subTitle,
    this.buttonText = '',
    this.iconPath = '',
    required this.primaryColor,
    required this.modalHeight,
    required this.onTap,
    this.showPrimaryButton = true,
    this.isFilled = true,
    this.textColor = const Color(0xFFFFFFFF),
    this.borderColor = GreyColors.grey_50,
    this.showSVG = true,
    this.iconChild,
    this.paddingWidth,
  });

  final Widget? bottomWidget;
  final String title;
  final String subTitle;
  final String buttonText;
  final String iconPath;
  final Color primaryColor;
  final double modalHeight;
  final bool showPrimaryButton;
  final VoidCallback onTap;
  final bool isFilled;
  final Color borderColor;
  final Color textColor;
  final Widget? iconChild;
  final bool showSVG;
  final double? width;
  final double? paddingWidth;

  @override
  Widget build(BuildContext context) {
    bool isTablet = DeviceUtils.isTablet(context);
    return Container(
      height: modalHeight,
      width: width ?? double.maxFinite,
      constraints: isTablet ? BoxConstraints(maxWidth: 544.w) : null,
      decoration: BoxDecoration(
        color: WhiteColors.white_50,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.h),
          topRight: Radius.circular(24.h),
          bottomLeft: isTablet ? Radius.circular(24.h) : Radius.zero,
          bottomRight: isTablet ? Radius.circular(24.h) : Radius.zero,
        ),
      ),
      padding: isTablet ? EdgeInsets.symmetric(horizontal:  paddingWidth ?? 62.h) : EdgeInsets.all(24.h),
      child: Column(
        mainAxisAlignment: isTablet ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          RWidget(
            smallS: EditableBox(
              height: 8.h,
              width: 47.w,
              borderRadius: 16.r,
              color: GreyColors.grey_200,
            ),
            largeS: const SizedBox(),
          ),
          RWidget(
            smallS: VSpaceWidget(height: 32.h),
            largeS: const SizedBox(),
          ),
          showSVG ? SvgPicture.asset(iconPath, height: isTablet ? 100.w : null) : const SizedBox(),
          SizedBox(child: iconChild),
          VSpaceWidget(height: 16.h),
          TitleAndSubWidget(
            title: title,
            fontSize: rSize(FontSize.xl, FontSize.x3l),
            fontWeight: FontWeightMade.semiBold,
            textColor: GreyColors.grey_500,
            textAlign: TextAlign.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            subWidget: Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Text(
                subTitle,
                style: TextStyle(
                  color: GreyColors.grey_700,
                  fontWeight: FontWeightMade.regular,
                  fontSize: rSize(
                    FontSize.xs,
                    FontSize.base,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          VSpaceWidget(height: 26.h),
          showPrimaryButton
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 24.w : 0),
                  child: PrimaryButton(
                    buttonTitle: buttonText,
                    fontWeight: FontWeightMade.medium,
                    fontSize: FontSize.base,
                    textColor: textColor,
                    filledColor: primaryColor,
                    isFilled: isFilled,
                    borderColor: borderColor,
                    buttonHeight: isTablet ? 52.w : null,
                    onTap: onTap,
                  ),
                )
              : const SizedBox(),
          SizedBox(
            child: bottomWidget,
          ),
        ],
      ),
    );
  }
}

class RWidget extends StatelessWidget {
  const RWidget({
    super.key,
    required this.smallS,
    required this.largeS,
    this.width = 600,
  });

  final Widget smallS;
  final Widget largeS;
  final double width;

  @override
  Widget build(BuildContext context) {
    bool isTablet = DeviceUtils.isTablet(context);
    return isTablet ? largeS : smallS;
  }
}
