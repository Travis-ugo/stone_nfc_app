// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
//
// // List<Color> randomColor = const [
// //   Color(0xffD8EFFF),
// //   Color(0xffFFF9D8),
// //   Color(0xffFFD9E8),
// //   Color(0xffE4EAF2),
// //   Color(0xffFFF1C0),
// //   Color(0xffD8EFFF),
// //   Color(0xffE7DFF9),
// //   Color(0xffDFF9E1),
// // ];
//
// const List<String> randomColor = [
//   '#FFADAD', // Light Red
//   '#FFD6A5', // Light Orange
//   '#FDFFB6', // Light Yellow
//   '#CAFFBF', // Light Green
//   '#9BF6FF', // Light Cyan
//   '#A0C4FF', // Light Blue
//   '#BDB2FF', // Light Purple
//   '#FFC6FF', // Light Magenta
// ];
//
// class MainSubColor {
//   final Color mainColor;
//   final Color subColor;
//   MainSubColor({
//     required this.mainColor,
//     required this.subColor,
//   });
// }
//
// List<MainSubColor> mainSubColor = [
//   MainSubColor(
//     mainColor: const Color(0xff0087E5),
//     subColor: const Color(0xffD8EFFF),
//   ),
//   MainSubColor(
//     mainColor: const Color(0xffE5005B),
//     subColor: const Color(0xffFFD9E8),
//   ),
//   MainSubColor(
//     mainColor: const Color(0xffE5C200),
//     subColor: const Color(0xffFFF9D8),
//   ),
//   MainSubColor(
//     mainColor: const Color(0xff0062E5),
//     subColor: const Color(0xffE4EAF2),
//   ),
//   MainSubColor(
//     mainColor: const Color(0xff00E512),
//     subColor: const Color(0xffDFF9E1),
//   ),
// ];


// File: lib/core/theme/app_colors.dart (or your existing color constants file)

import 'package:flutter/material.dart'; // Or 'package:flutter/painting.dart' for just Color
import 'dart:math'; // For random selection example

// // Previous randomColor list (now commented out or removed if you replace its usage)
// const List<String> randomColor = [
//   '#FFADAD', // Light Red
//   '#FFD6A5', // Light Orange
//   '#FDFFB6', // Light Yellow
//   '#CAFFBF', // Light Green
//   '#9BF6FF', // Light Cyan
//   '#A0C4FF', // Light Blue
//   '#BDB2FF', // Light Purple
//   '#FFC6FF', // Light Magenta
// ];

// --- NEW LIST OF HEX CODES YOU PROVIDED ---
/// A list of vibrant hex color codes for random selection.
/// These should be used where a hex string is needed (e.g., for API, specific components).
const List<String> vibrantHexColorPalette = [
  '#FFB6AD', // Your FFB6AD
  '#FFF1C0', // Your FFF1C0
  '#D5E4AB', // Your D5E4AB
  '#B1DAF0', // Your B1DAF0
  '#D2ABE4', // Your D2ABE4
  '#DDD8D7', // Your DDD8D7
  '#CEFEFF', // Your CEFEFF
];

// --- IF YOU ALSO NEED THEM AS FLUTTER COLOR OBJECTS ---
/// A list of vibrant Flutter Color objects, corresponding to vibrantHexColorPalette.
/// Useful for direct UI styling in Flutter.
List<Color> getVibrantFlutterColorPalette() {
  return vibrantHexColorPalette.map((hex) => hexToColor(hex)).toList();
}

/// Utility function to convert a hex string (e.g., "#RRGGBB" or "RRGGBB") to a Flutter Color.
Color hexToColor(String hexCode) {
  final buffer = StringBuffer();
  if (hexCode.length == 6 || hexCode.length == 7) buffer.write('ff'); // Add alpha if missing
  buffer.write(hexCode.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}


// Your existing MainSubColor class and list (unmodified)
class MainSubColor {
  final Color mainColor;
  final Color subColor;
  MainSubColor({
    required this.mainColor,
    required this.subColor,
  });
}


// List<MainSubColor> mainSubColor = [
//   MainSubColor(
//     mainColor: const Color(0xff0087E5),
//     subColor: const Color(0xffD8EFFF),
//   ),
//   MainSubColor(
//     mainColor: const Color(0xffE5005B),
//     subColor: const Color(0xffFFD9E8),
//   ),
//   MainSubColor(
//     mainColor: const Color(0xffE5C200),
//     subColor: const Color(0xffFFF9D8),
//   ),
//   MainSubColor(
//     mainColor: const Color(0xff0062E5),
//     subColor: const Color(0xffE4EAF2),
//   ),
//   MainSubColor(
//     mainColor: const Color(0xff00E512),
//     subColor: const Color(0xffDFF9E1),
//   ),
// ];

// --- MODIFIED mainSubColor LIST ---
List<MainSubColor> mainSubColor = [
  MainSubColor(
    mainColor: const Color(0xFFFFB6AD), // Was Color(0xff0087E5) - Now your 1st vibrant color
    subColor: const Color(0xffD8EFFF),  // SubColor remains the same
  ),
  MainSubColor(
    mainColor: const Color(0xFFFFF1C0), // Was Color(0xffE5005B) - Now your 2nd vibrant color
    subColor: const Color(0xffFFD9E8),  // SubColor remains the same
  ),
  MainSubColor(
    mainColor: const Color(0xFFD5E4AB), // Was Color(0xffE5C200) - Now your 3rd vibrant color
    subColor: const Color(0xffFFF9D8),  // SubColor remains the same
  ),
  MainSubColor(
    mainColor: const Color(0xFFB1DAF0), // Was Color(0xff0062E5) - Now your 4th vibrant color
    subColor: const Color(0xffE4EAF2),  // SubColor remains the same
  ),
  MainSubColor(
    mainColor: const Color(0xFFD2ABE4), // Was Color(0xff00E512) - Now your 5th vibrant color
    subColor: const Color(0xffDFF9E1),  // SubColor remains the same
  ),
  // If you wanted to add more MainSubColor objects to use the remaining vibrant colors:
  MainSubColor(
    mainColor: const Color(0xFFDDD8D7), // Your 6th vibrant color
    subColor: const Color(0xffeeeeee),  // Placeholder new subColor
  ),
  MainSubColor(
    mainColor: const Color(0xFFCEFEFF), // Your 7th vibrant color
    subColor: const Color(0xffdddddd),  // Placeholder new subColor
  ),
];

// Example of how to use the new vibrantHexColorPalette for random selection:
// final Random random = Random();
// String randomHexColor = vibrantHexColorPalette[random.nextInt(vibrantHexColorPalette.length)];