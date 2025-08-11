import 'package:tag_play/core/utils/utils.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.buttonTitle = '',
    required this.onTap,
    this.buttonHeight,
    this.isFilled = true,
    this.borderColor = GreyColors.grey_50,
    this.filledColor = PrimaryColor.primary_500,
    this.textColor = const Color(0xFFFFFFFF),
    this.childWidget,
    this.fontWeight = FontWeightMade.medium,
    this.fontSize,
    this.padding,
    this.isFormValid = true,
    this.borderRadius = 16.0,
    this.borderSide = BorderSide.none,
    this.fixedSize,
  });

  final String buttonTitle;
  final void Function()? onTap;
  final bool isFilled;
  final Color borderColor;
  final Color filledColor;
  final Color textColor;
  final double? buttonHeight;
  final Widget? childWidget;
  final double? fontSize;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry? padding;
  final bool isFormValid;
  final double? borderRadius;
  final BorderSide borderSide;
  final Size? fixedSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isFormValid ? onTap : null,
      key: Key('${buttonTitle}key'),
      style: ElevatedButton.styleFrom(
        padding: padding,
        fixedSize: fixedSize,
        backgroundColor: isFilled ? filledColor : Colors.transparent,
        foregroundColor: isFilled ? filledColor : Colors.transparent,
        disabledBackgroundColor: filledColor.withValues(alpha: 0.4),
        shadowColor: filledColor.withValues(alpha: 0.3),
        elevation: 0.0,
        minimumSize: Size(double.infinity, buttonHeight ?? 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
          side: isFilled
              ? borderSide
              : BorderSide(width: 1, color: borderColor),
        ),
      ),
      child:
          childWidget ??
          Text(
            buttonTitle,
            style: TextStyle(
              fontSize: fontSize ?? FontSize.base,
              color: textColor,
              fontFamily: "Poppins",
              fontWeight: fontWeight,
            ),
          ),
    );
  }
}
