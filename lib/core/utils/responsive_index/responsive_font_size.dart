import 'package:flutter_screenutil/flutter_screenutil.dart';

double rSize(double mobile, [double? tablet]) {
  double screenWidth = ScreenUtil().screenWidth;

  if (tablet == null) {
    if (screenWidth > 600) {
      return mobile * (screenWidth / 375);
    }
    return mobile;
  }

  return screenWidth > 600 ? tablet : mobile;
}
