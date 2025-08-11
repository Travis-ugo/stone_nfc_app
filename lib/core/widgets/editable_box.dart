import 'package:flutter/material.dart';

class EditableBox extends StatelessWidget {
  const EditableBox({
    super.key,
    this.child,
    this.color,
    this.borderRadius = 16,
    this.border,
    this.padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
    this.margin,
    this.width,
    this.height,
    this.boxShadow,
  });

  final Widget? child;
  final Color? color;
  final double borderRadius;
  final Border? border;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: color,
        border: border,
        boxShadow: boxShadow,
      ),
      margin: margin,
      padding: padding,
      child: child,
    );
  }
}
