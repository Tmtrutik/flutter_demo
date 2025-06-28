import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/utils.dart';

class AppIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Color? color;
  final String? tooltip;

  const AppIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.padding,
    this.borderRadius,
    this.color,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius ?? BorderRadius.circular(defaultRadius),
        ),
        padding: padding,
        child: IconButton(
          onPressed: onPressed,
          icon: icon,
          tooltip: tooltip,
        ),
      ),
    );
  }
}
