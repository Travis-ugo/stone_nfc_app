String rgbaToHex(double alpha, double red, double green, double blue) {
  // Convert each component to 8-bit integer values
  int a = (alpha * 255).toInt();
  int r = (red * 255).toInt();
  int g = (green * 255).toInt();
  int b = (blue * 255).toInt();

  // Return the hex string in 0xAARRGGBB format
  return "0x${a.toRadixString(16).padLeft(2, '0')}"
          "${r.toRadixString(16).padLeft(2, '0')}"
          "${g.toRadixString(16).padLeft(2, '0')}"
          "${b.toRadixString(16).padLeft(2, '0')}"
      .toUpperCase();
}
