import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    super.key,
    required this.icon,
    this.color,
    this.onIconTap,
    this.iconSize,
  });
  final IconData icon;
  final Color? color;
  final double? iconSize;
  final Function()? onIconTap;

  @override
  Widget build(BuildContext context) {
    return onIconTap == null
        ? Icon(
            icon,
            color: color,
            size: iconSize,
          )
        : IconButton(
            onPressed: onIconTap,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: Icon(
              icon,
              color: color,
              size: iconSize,
            ),
          );
  }
}
