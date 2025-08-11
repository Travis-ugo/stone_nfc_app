import 'package:tag_play/core/utils/utils.dart'; 

class TagPlaySearchBar extends StatelessWidget {
  const TagPlaySearchBar({
    super.key,
    this.onChanged,
    this.onSubmitted,
    required this.hintText,
    this.contentPadding,
    this.borderSide,
    this.hintStyle,
    this.style,
    this.borderRadius,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.controller,
    this.fillColor,
    this.filled,
  });

  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final EdgeInsetsGeometry? contentPadding;
  final BoxConstraints? prefixIconConstraints;
  final TextEditingController? controller;
  final BorderSide? borderSide;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final double? borderRadius;
  final Widget? prefixIcon;
  final String hintText;
  final Color? fillColor;
  final bool? filled;

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: Key('search_bar_$hintText'),
      onChanged: onChanged,
      controller: controller,
      style:
          style ??
          TextStyle(
            fontSize: rSize(FontSize.sm, FontSize.base),
            color: BlackColors.black_500,
            fontWeight: FontWeightMade.regular,
          ),
      onSubmitted: onSubmitted,

      decoration: InputDecoration(
        filled: filled,
        fillColor: fillColor,
        prefixIconConstraints: prefixIconConstraints,
        prefixIcon:
            prefixIcon ??
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0).r,
              child: SvgPicture.asset(
                'assets/icons/search-normal.svg',
                color: GreyColors.grey_400,
                height: 16.h,
              ),
            ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          borderSide:
              borderSide ??
              const BorderSide(color: Color(0xFFE1E7EF), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          borderSide:
              borderSide ??
              const BorderSide(color: Color(0xFFE1E7EF), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          borderSide:
              borderSide ??
              const BorderSide(color: Color(0xFFE1E7EF), width: 1),
        ),
        hintText: hintText,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 2.w, vertical: 12.h),
        hintStyle:
            hintStyle ??
            TextStyle(
              fontSize: rSize(FontSize.sm, FontSize.base),
              color: Color(0xFF667085),
              fontWeight: FontWeightMade.regular,
            ),
      ),
    );
  }
}
