import 'package:tag_play/core/core.dart';

bool get isLargeScreen {
  double screenWidth = ScreenUtil().screenWidth;

  return screenWidth > 600;
}
