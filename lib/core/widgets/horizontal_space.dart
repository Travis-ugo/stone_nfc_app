import 'package:flutter/material.dart';

class HSpaceWidget extends StatelessWidget {
  const HSpaceWidget({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
