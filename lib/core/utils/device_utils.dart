import 'package:flutter/material.dart';

class DeviceUtils {
  /// Determines if the current device is a tablet based on screen dimensions.

  static bool isTablet(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return isLandscape
        ? screenWidth > 800 &&
            screenHeight >
                600 // Tablet in landscape
        : screenWidth > 600 && screenHeight > 800; // Tablet in portrait
  }
}
