import 'package:tag_play/core/utils/sheets/show_pop_dialog.dart';
import 'package:tag_play/core/utils/utils.dart';

void showPrivacyAndTermsModal({
  required BuildContext context,
  required VoidCallback onTap,
  required String title,

  required String body,
}) {
  showPopDialog(
    context,
    barrierDismissible: true,
    sheetWidget: Container(
      height: 498.h,
      width: double.maxFinite,
      constraints: BoxConstraints(maxWidth: 544.w),
      decoration: BoxDecoration(
        color: WhiteColors.white_50,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Color(0xFFE5E7EB)),
      ),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 16.h, 6.h, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: FontSize.xl,
                    fontWeight: FontWeightMade.semiBold,
                    color: Color(0xFF1E293B),
                  ),
                  textAlign: TextAlign.center,
                ),
                IconButton(
                  onPressed: onTap,
                  icon: SvgPicture.asset('assets/icons/x.svg', height: 20.h),
                ),
              ],
            ),
          ),
          Divider(color: Color(0xFFE5E7EB)),

          Padding(
            padding: EdgeInsets.all(20.h),
            child: Text(
              body,
              style: TextStyle(
                fontSize: FontSize.base,
                fontWeight: FontWeightMade.regular,
                color: Color(0xFF64748A),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
