import 'package:flutter/material.dart';

import '../../../common/icon_widget.dart';
import '../../../resources/app_colors.dart';

class ZoomButton extends StatelessWidget {
  const ZoomButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: AppColors.grey, width: 0.5),
        ),
        child: IconWidget(icon: icon),
      ),
    );
  }
}
