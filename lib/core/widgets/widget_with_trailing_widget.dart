import 'package:flutter/material.dart';

class WidgetWithTrailingWidget extends StatelessWidget {
  const WidgetWithTrailingWidget({
    super.key,
    required this.leadingWidget,
    required this.trailingWidget,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this. mainAxisAlignment = MainAxisAlignment.start,
    this.gap = 5,
  });

  final Widget leadingWidget;
  final Widget trailingWidget;
  final double gap;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        leadingWidget,
        SizedBox(width: gap),
        trailingWidget,
      ],
    );
  }
}
