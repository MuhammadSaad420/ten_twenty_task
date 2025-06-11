import 'package:court_pro/ui/common/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../resources/app_colors.dart';
import 'text_widget.dart';

class OutlineButtonWidget extends StatelessWidget {
  const OutlineButtonWidget(
      {super.key, required this.title, required this.onTap, this.btnWidth});

  final String title;
  final VoidCallback onTap;
  final double? btnWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: btnWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.lightBlue, width: 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const IconWidget(
            icon: Icons.play_arrow,
            color: Colors.white,
          ),
          const Gap(10),
          TextWidget(
            title: title,
            size: 14,
            weight: FontWeight.w600,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
