import 'package:tag_play/core/core.dart';

class OrWith extends StatelessWidget {
  const OrWith({super.key, this.padding});

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 32.h, vertical: 26.h),
      child: Row(
        children: [
          Expanded(
            child: EditableBox(
              color: GreyColors.grey_400,
              height: 1.h,
              margin: EdgeInsets.only(right: 8.w),
            ),
          ),
          Text(
            'or with',
            style: TextStyle(
              color: GreyColors.grey_500,
              fontSize: FontSize.sm,
              fontWeight: FontWeightMade.regular,
            ),
          ),
          Expanded(
            child: EditableBox(
              color: GreyColors.grey_400,
              height: 1.h,
              margin: EdgeInsets.only(left: 8.w),
            ),
          ),
        ],
      ),
    );
  }
}
