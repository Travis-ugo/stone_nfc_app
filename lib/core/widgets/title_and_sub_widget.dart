import 'package:tag_play/core/utils/utils.dart'; 

class TitleAndSubWidget extends StatelessWidget {
  const TitleAndSubWidget({
    super.key,
    required this.title,
    this.subWidget,
    this.fontWeight = FontWeightMade.medium,
    this.textColor = GreyColors.grey_200,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.gap,
    this.fontSize,
    this.textDecoration,
    this.textAlign,
    this.lineHeight,
    this.overflow,
  });
  final String title;
  final Widget? subWidget;
  final FontWeight fontWeight;
  final Color textColor;
  final double? fontSize;
  final double? gap;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final double? lineHeight;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize ?? FontSize.sm,
            color: textColor,
            fontWeight: fontWeight,
            decoration: textDecoration,
            height: lineHeight,
          ),
          textAlign: textAlign,
          overflow: overflow,
        ),
        SizedBox(height: gap),
        SizedBox(child: subWidget),
      ],
    );
  }
}
