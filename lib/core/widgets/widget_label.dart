

import 'package:tag_play/core/utils/utils.dart';
import 'package:tag_play/core/widgets/core_widgets.dart';

class WidgetLabel extends StatelessWidget {
  const WidgetLabel({super.key, this.labelStyle, this.label, this.child});

  final String? label;

  final TextStyle? labelStyle;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Text(
              label!,
              style:
                  labelStyle ??
                  TextStyle(
                    fontSize: rSize(FontSize.sm, FontSize.base),
                    color: Color(0xFF667085),
                    fontWeight: FontWeightMade.regular,
                  ),
            )
            : const SizedBox(),
        SizedBox(height: 6.h),
        EditableBox(
          height: 44.h,
          width: double.maxFinite,
          padding: EdgeInsets.zero,
          borderRadius: 8.h,
          border: Border.all(color: Color(0xFFD0D5DD), width: 1),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.h),
            child: child,
          ),
        ),
      ],
    );
  }
}
