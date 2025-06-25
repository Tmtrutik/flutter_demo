import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;
  final EdgeInsets? padding;
  final Color? color;
  final String? tooltip;

  const AppIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.padding,
    this.color,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: color,
        tooltip: tooltip,
      ),
    );
  }
}
