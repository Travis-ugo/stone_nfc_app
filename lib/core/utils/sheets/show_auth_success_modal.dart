import 'package:tag_play/core/core.dart';
import 'package:tag_play/core/utils/sheets/show_pop_dialog.dart';

void showAuthSuccessModal(BuildContext context, VoidCallback onTap) {
  showPopDialog(
    context,
    barrierDismissible: true,
    sheetWidget: Container(
      height: 278.h,
      width: double.maxFinite,
      constraints: BoxConstraints(maxWidth: 544.w),
      decoration: BoxDecoration(
        color: WhiteColors.white_50,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.all(6.h),
              child: IconButton(
                onPressed: onTap,
                icon: SvgPicture.asset('assets/icons/x.svg', height: 20.h),
              ),
            ),
          ),
          Text(
            'Account Created\nSuccessfully',
            style: TextStyle(
              fontSize: FontSize.xl,
              fontWeight: FontWeightMade.bold,
              color: Color(0xFF1E293B),
            ),
            textAlign: TextAlign.center,
          ),
          VSpaceWidget(height: 26.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: PrimaryButton(
              buttonTitle: 'Login to your account',
              buttonHeight: 48.h,
              fontWeight: FontWeightMade.medium,
              onTap: onTap,
            ),
          ),
          VSpaceWidget(height: 20.h),
          Text(
            'You can now access all features and start\nexploring FIIXCONN.',
            style: TextStyle(
              fontSize: FontSize.sm,
              fontWeight: FontWeightMade.regular,
              color: Color(0xFF5C5B59),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
