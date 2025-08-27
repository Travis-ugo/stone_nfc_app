import 'package:flutter/services.dart';
import 'package:tag_play/core/utils/utils.dart';

class TagPlayInputField extends StatefulWidget {
  const TagPlayInputField({
    super.key,
    this.onChanged,
    this.onSubmitted,
    required this.hintText,
    this.isPassword = false,
    this.prefixIcon,
    this.errorState,
    this.borderRadius = 16,
    this.minLines,
    this.keyboardType,
    this.maxLength,
    this.readOnly = false,
    this.controller,
    this.maxLines,
    this.labelStyle,
    this.label,
    this.labelGap,
    this.textStyle,
    this.contentPadding,
    this.inputFormatters,
    this.bottomLeftWidget,
    this.autoFocused = false,
  });

  final Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final String hintText;
  final bool isPassword;
  final String? label;
  final String? errorState;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final double borderRadius;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool readOnly;
  final double? labelGap;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final Widget? bottomLeftWidget;
  final bool autoFocused;
  final List<TextInputFormatter>? inputFormatters;
  @override
  State<TagPlayInputField> createState() => _TagPlayInputFieldState();
}

class _TagPlayInputFieldState extends State<TagPlayInputField> {
  bool isObscureText = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null
            ? Text(
                widget.label!,
                style:
                    widget.labelStyle ??
                    TextStyle(
                      fontSize: rSize(FontSize.sm, FontSize.base),
                      color: GreyColors.grey_500,
                      fontWeight: FontWeightMade.regular,
                    ),
              )
            : const SizedBox(),
        SizedBox(height: widget.labelGap ?? 6.h),
        TextField(
          key: Key(widget.hintText),
          autofocus: widget.autoFocused,
          onChanged: widget.onChanged,
          onSubmitted: widget.onSubmitted,
          obscureText: isObscureText,
          maxLines: widget.maxLines ?? 1,
          minLines: widget.minLines ?? 1,
          maxLength: widget.maxLength,
          readOnly: widget.readOnly,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          style:
              widget.textStyle ??
              TextStyle(
                fontSize: rSize(FontSize.sm, FontSize.base),
                color: BlackColors.black_500,
                fontWeight: FontWeightMade.regular,
              ),
          controller: widget.controller,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            suffixIconConstraints: const BoxConstraints(
              maxWidth: 90,
              maxHeight: 35,
            ).w,
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: () {
                      isObscureText = !isObscureText;
                      setState(() {});
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          widget.errorState != null
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ).r,
                                  child: SvgPicture.asset(
                                    'assets/icons/alert-circle.svg',
                                    height: 16.h,
                                  ),
                                )
                              : const SizedBox(),
                          isObscureText
                              ? SvgPicture.asset(
                                  'assets/icons/eye.svg',
                                  height: 16.h,
                                )
                              : SvgPicture.asset(
                                  'assets/icons/eye-slash.svg',
                                  height: 16.h,
                                ),
                        ],
                      ),
                    ),
                  )
                : widget.errorState != null
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: SvgPicture.asset(
                      'assets/icons/alert-circle.svg',
                      height: 16.h,
                    ),
                  )
                : const SizedBox(),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius).w,
              borderSide: const BorderSide(color: RedColors.red_500, width: 1),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius).w,
              borderSide: const BorderSide(
                color: GreyColors.grey_400,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius).w,
              borderSide: const BorderSide(
                color: GreyColors.grey_400,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius).w,
              borderSide: const BorderSide(
                color: GreyColors.grey_400,
                width: 1,
              ),
            ),
            hintText: widget.hintText,
            contentPadding:
                widget.contentPadding ??
                EdgeInsets.symmetric(
                  horizontal: rSize(14.w, 18.w),
                  vertical: rSize(10.w, 16.w),
                ),
            hintStyle: TextStyle(
              fontSize: rSize(FontSize.sm, FontSize.base),
              color: GreyColors.grey_200,
              fontWeight: FontWeightMade.regular,
            ),
            errorText: widget.errorState,
            errorStyle: TextStyle(
              fontSize: FontSize.xs,
              color: RedColors.red_500,
              fontWeight: FontWeightMade.regular,
            ),
          ),
        ),
        widget.bottomLeftWidget != null
            ? SizedBox(child: widget.bottomLeftWidget)
            : const SizedBox(),
      ],
    );
  }
}
