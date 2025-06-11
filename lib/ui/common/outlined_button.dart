import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import 'text_widget.dart';

class OutlineButtonWidget extends StatelessWidget {
  const OutlineButtonWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      child: TextWidget(
        title: title,
        color: AppColors.darkPurple,
      ),
    );
  }
}
