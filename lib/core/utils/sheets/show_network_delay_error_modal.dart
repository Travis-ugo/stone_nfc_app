import 'package:tag_play/core/utils/sheets/show_pop_dialog.dart';
import 'package:tag_play/core/utils/utils.dart';
import 'package:tag_play/core/widgets/core_widgets.dart';

void showNetworkDelayErrorModal(BuildContext context, VoidCallback onTap) {
  showPopDialog(
    context,
    barrierDismissible: true,
    sheetWidget: Container(
      height: 319.h,
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
            'Network Delay Detected!',
            style: TextStyle(
              fontSize: FontSize.xl,
              fontWeight: FontWeightMade.bold,
              color: Color(0xFF1E293B),
            ),
            textAlign: TextAlign.center,
          ),
          VSpaceWidget(height: 8.h),
          Text(
            'We are experiencing some network issues\nat the moment. This might take a few\nmore seconds.',
            style: TextStyle(
              fontSize: FontSize.sm,
              fontWeight: FontWeightMade.regular,
              color: Color(0xFF64748A),
            ),
            textAlign: TextAlign.center,
          ),
          VSpaceWidget(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: PrimaryButton(
              buttonTitle: 'Retry',
              filledColor: Color(0xFFDB2626),
              buttonHeight: 48.h,
              fontWeight: FontWeightMade.medium,
              onTap: onTap,
            ),
          ),
          VSpaceWidget(height: 16.h),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Check Connection: ',
              style: TextStyle(
                fontWeight: FontWeightMade.regular,
                color: Color(0xFF1E293B),
                fontSize: rSize(FontSize.sm, FontSize.base),
                fontFamily: 'Poppins',
                height: 1.7,
              ),

              children: <TextSpan>[
                TextSpan(
                  text: 'Ensure your internet connection is stable.',
                  style: TextStyle(
                    fontWeight: FontWeightMade.regular,
                    color: Color(0xFF64748A),
                    fontSize: rSize(FontSize.sm, FontSize.base),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
